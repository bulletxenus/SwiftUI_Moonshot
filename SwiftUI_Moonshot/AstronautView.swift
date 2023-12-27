//
//  AstronautView.swift
//  SwiftUI_Moonshot
//
//  Created by Dzmitry Khamitsevich on 25.12.23.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Austronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronauts: [String: Austronaut] = Bundle.main.decode("astronauts.json")
    
    return AstronautView(astronaut: astronauts["white"]!)
        .preferredColorScheme(.dark)
}
