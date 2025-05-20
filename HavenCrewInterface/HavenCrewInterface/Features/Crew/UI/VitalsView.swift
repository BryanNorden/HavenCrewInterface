//
//  VitalsView.swift
//  HavenCrewInterface
//
//  Created by Bryan Norden.
//

import SwiftUI

@MainActor
struct VitalsView: View {
    let member: CrewMember
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            CardView(
                title: "Heart Rate",
                value: "\(Int(member.vitals.heartRate)) bpm",
                backgroundType: member.vitalSignStatuses[.heartRate]!
            )
            CardView(
                title: "Oxygen Level",
                value: "\(Int(member.vitals.oxygenLevel))%",
                backgroundType: member.vitalSignStatuses[.oxygenLevel]!
            )
            CardView(
                title: "Temperature",
                value: String(format: "%.1f°F", member.vitals.temperature),
                backgroundType: member.vitalSignStatuses[.temperature]!
            )
            CardView(
                title: "Suit Pressure",
                value: String(format: "%.1f psi", member.vitals.suitPressure),
                backgroundType: member.vitalSignStatuses[.suitPressure]!
            )
            CardView(
                title: "Status",
                value: member.status
            )
        }
    }
}

#Preview {
    VitalsView(
        member:
            CrewMember(
                id: UUID(),
                name: "Cmdr. Feustel",
                role: "Commander",
                vitals:  DefaultValues().defaultVitals(),
                vitalSignStatuses:  DefaultValues.initialVitalSignStatuses(),
                status: "Normal"
            )
    )
}
