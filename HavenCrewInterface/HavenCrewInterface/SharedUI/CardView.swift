//
//  CardView.swift
//  HavenCrewInterface
//
//  Created by Bryan Norden.
//

import SwiftUI

@MainActor
struct CardView: View {
    var title: String
    var value: String
    var backgroundType: VitalStatus = .normal
    
//    enum BackgroundType {
//        case normal
//        case warning
//        case critical
//    }
    
    var body: some View {
        VStack {
            Text(title).font(.caption)
            Text(value).font(.title)
        }
        .frame(width: 200, height: 85)
        .background(backgroundColor(for: backgroundType))
        .cornerRadius(12)
    }
    
    func backgroundColor(for type: VitalStatus) -> Color {
        switch type {
        case .normal:
            return Color.gray.opacity(0.2)
        case .warning:
            return Color.yellow.opacity(0.2)
        case .critical:
            return Color.red.opacity(0.2)
        }
    }
}

#Preview {
    CardView(title: "Heart Rate", value: "82 BPM")
}
