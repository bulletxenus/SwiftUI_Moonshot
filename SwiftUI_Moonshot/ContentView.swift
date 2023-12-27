//
//  ContentView.swift
//  SwiftUI_Moonshot
//
//  Created by Dzmitry Khamitsevich on 24.12.23.
//

import SwiftUI

struct ContentView: View {
    enum ContentVisionType {
        case list
        case grid
    }
    
    let austronauts: [String: Austronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
        
    var body: some View {
        NavigationStack {
            VStack {
                MissionsGrid(missions: missions, austronauts: austronauts)
                    .transition(
                        .slide.combined(with:
                        .scale.combined(with:
                        .opacity)))
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
