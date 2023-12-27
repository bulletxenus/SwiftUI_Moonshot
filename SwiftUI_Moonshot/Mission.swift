//
//  Mission.swift
//  SwiftUI_Moonshot
//
//  Created by Dzmitry Khamitsevich on 24.12.23.
//

import Foundation



struct Mission: Codable, Identifiable, Hashable {
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    struct CrewRole: Codable, Hashable {
        let name: String
        let role: String
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
