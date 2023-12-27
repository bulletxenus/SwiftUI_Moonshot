//
//  CustomSeparator.swift
//  SwiftUI_Moonshot
//
//  Created by Dzmitry Khamitsevich on 25.12.23.
//

import SwiftUI

struct CustomSeparator: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    CustomSeparator()
}
