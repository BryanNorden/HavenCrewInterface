//
//  CardBackground.swift
//  HavenCrewInterface
//
//  Created by Bryan Norden.
//

import SwiftUI

struct CardBackground: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(red: 0.95, green: 0.95, blue: 0.95))
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color(red: 0.75, green: 0.75, blue: 0.75), lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 2)
        }
        .background(
            Color(red: 0.85, green: 0.75, blue: 0.65).opacity(0.1) // Maple wood texture
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(2)
        )
    }
}
