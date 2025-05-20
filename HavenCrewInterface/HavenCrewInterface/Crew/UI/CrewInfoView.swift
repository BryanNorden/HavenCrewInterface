//
//  CrewInfoView.swift
//  HavenCrewInterface
//
//  Created by Bryan Norden.
//

import SwiftUI

@MainActor
struct CrewInfoView: View {
    let member: CrewMember
    
    var body: some View {
        HStack {
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.gray)
            VStack(alignment: .leading) {
                Text(member.name)
                    .font(.system(.headline, design: .default, weight: .medium))
                    .foregroundColor(.black)
                Text(member.role)
                    .font(.system(.subheadline, design: .default))
                    .foregroundColor(Color(red: 0.29, green: 0.56, blue: 0.89))
            }
            Spacer()
        }
    }
}

#Preview {
    CrewInfoView(
        member:
            CrewMember(
                id: UUID(),
                name: "Cmdr. Feustel",
                role: "Commander",
                vitals: DefaultValues().defaultVitals(),
                vitalSignStatuses: DefaultValues.initialVitalSignStatuses(),
                status: "Normal"
            )
    )
}
