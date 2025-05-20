//
//  StarlinkStatusView.swift
//  HavenCrewInterface
//
//  Created by Bryan Norden on 5/19/25.
//

import SwiftUI

struct StarlinkStatusView: View {
    let starlinkStatus: StarlinkStatus
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Starlink Optical ISLs Connection")
                .font(.system(.headline, design: .default, weight: .bold))
                .foregroundColor(.black)
            HStack {
                Text("Signal: \(starlinkStatus.signalStrength)")
                    .foregroundColor(starlinkStatus.signalStrength == "Strong" ? .green : .yellow)
                Spacer()
                Text("Latency: \(starlinkStatus.latency, specifier: "%.1f") ms")
                Spacer()
                Text("Data Rate: \(starlinkStatus.dataRate, specifier: "%.1f") Gbps")
            }
            .font(.system(.caption, design: .default))
            .foregroundColor(.black.opacity(0.8))
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(red: 0.95, green: 0.95, blue: 0.95))
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray, lineWidth: 1)
                )
        )
        .padding(.horizontal)
    }
}

#Preview {
    StarlinkStatusView(starlinkStatus: .init(signalStrength: "Strong", latency: 25.0, dataRate: 225.0))
}
