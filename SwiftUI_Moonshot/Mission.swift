//
//  Mission.swift
//  SwiftUI_Moonshot
//
//  Created by Dzmitry Khamitsevich on 24.12.23.
//

import Foundation



struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
}
