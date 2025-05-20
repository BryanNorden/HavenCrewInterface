//
//  CrewCardView.swift
//  HavenCrewInterface
//
//  Created by Bryan Norden.
//

import SwiftUI

@MainActor
struct CrewCardView: View {
   var member: CrewMember
    
    var body: some View {
        ZStack(alignment: .leading) {
            CardBackground()
            VStack(alignment: .leading, spacing: 10) {
                CrewInfoView(member: member)
                VitalsView(member: member)
            }
            .padding(.all)
        }
        .frame(width: 240)
    }
}

#Preview {
    CrewCardView(
        member:
            CrewMember(
                id: UUID(),
                name: "Cmdr. Feustel",
                role: "Commander",
                vitals:  DefaultValues().defaultVitals(),
                vitalSignStatuses:  DefaultValues.initialVitalSignStatuses(),
                status: "Normal"
            ),
    )
}
