//
//  CrewCarousel.swift
//  SwiftUI_Moonshot
//
//  Created by Dzmitry Khamitsevich on 25.12.23.
//

import SwiftUI

struct CrewCarousel: View {
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink(value: crewMember) {
                        HStack {
                            Image(crewMember.austronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                    .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.austronaut.id)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                
                                Text(crewMember.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                    }
                    .navigationDestination(for: CrewMember.self) { member in
                        AstronautView(astronaut: member.austronaut)
                    }
                }
            }
        }
    }
}
