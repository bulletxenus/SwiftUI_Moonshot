//
//  MissionView.swift
//  SwiftUI_Moonshot
//
//  Created by Dzmitry Khamitsevich on 25.12.23.
//

import SwiftUI

struct CrewMember: Hashable {
    let role: String
    let austronaut: Austronaut
}

struct MissionView: View {
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                
                VStack(alignment: .leading) {
                    CustomSeparator()
                
                    VStack(alignment: .center) {
                        Text("Launch date")
                            .font(.headline.bold())
                        
                        Text(mission.formattedLaunchDate)
                    }
                    .frame(maxWidth: .infinity)
                    
                    CustomSeparator()
                    
                    Text("Mission Hightlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                    
                    CustomSeparator()
                    
                    Text("Crew:")
                        .font(.title.bold())
                        .padding(.bottom, 10)
                }
                .padding(.horizontal)
                
                CrewCarousel(crew: crew)
            }
            .padding(.bottom)
            
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, austronauts: [String: Austronaut]) {
        print("mission: ", mission)
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let austronaut = austronauts[member.name] {
                return CrewMember(role: member.role, austronaut: austronaut)
            } else {
                fatalError("Mission \(member.name)")
            }
        }
    }
    
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Austronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[0], austronauts: astronauts)
        .preferredColorScheme(.dark)
}
