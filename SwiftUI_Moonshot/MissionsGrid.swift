//
//  MissionsGrid.swift
//  SwiftUI_Moonshot
//
//  Created by Dzmitry Khamitsevich on 25.12.23.
//

import SwiftUI

struct MissionsGrid: View {
    let missions: [Mission]
    let austronauts: [String: Austronaut]
    
    private let gridColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    private let listColumns = [
        GridItem(.adaptive(minimum: .infinity))
    ]
    
    @AppStorage("isList") var isListOn = true
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: isListOn ? listColumns : gridColumns) {
                ForEach(missions) { mission in
                    NavigationLink(value: mission) {
                        MissionsListItem(mission: mission)
                    }
                    .navigationDestination(for: Mission.self) { missionProps in
                        MissionView(mission: missionProps, austronauts: austronauts)
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .animation(.bouncy, value: isListOn)

        }
        .toolbar {
            Toggle(isOn: $isListOn) {
                Image(systemName: isListOn ?  "rectangle.grid.1x2.fill" : "square.grid.3x2.fill")
                    .animation(.bouncy, value: isListOn)
            }
            .tint(Color(red: 0.2, green: 0.2, blue: 0.3))
            .toggleStyle(.switch)
            .padding(.horizontal)
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Austronaut] = Bundle.main.decode("astronauts.json")

    return MissionsGrid(missions: missions, austronauts: astronauts)
        .preferredColorScheme(.dark)
}
