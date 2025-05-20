//
//  VitalDashboardView.swift
//  HavenVitals
//
//  Created by Bryan Norden on 5/13/25.
//

import SwiftUI

struct VitalDashboardView: View {
    @StateObject private var viewModel = CrewVitalsViewModel()
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(viewModel.crewMembers) { member in
                VStack(alignment: .leading) {
                    Text(member.name).font(.headline)
                    vitalCard(title: "Heart Rate", value: "\(Int(member.vitals.heartRate)) bpm")
                    vitalCard(title: "Oxygen Level", value: "\(Int(member.vitals.oxygenLevel))%")
                    vitalCard(title: "Temperature", value: String(format: "%.1f°F", member.vitals.temperature))
                    vitalCard(title: "Suit Pressure", value: String(format: "%.1f psi", member.vitals.suitPressure))
                    
                    Text("Status: \(member.status)")
                        .font(.title2)
                        .foregroundColor(member.status.contains("Critical") ? .red : .green)
                    Spacer()
                }
            }
        }
        .padding()
    }
    
    func vitalCard(title: String, value: String) -> some View {
        VStack {
            Text(title).font(.caption)
            Text(value).font(.title)
        }
        .frame(width: 150, height: 80)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(12)
    }
    
    func formatTime(_ seconds: TimeInterval) -> String {
        let hrs = Int(seconds) / 3600
        let mins = (Int(seconds) % 3600) / 60
        let secs = Int(seconds) % 60
        return String(format: "%02d:%02d:%02d", hrs, mins, secs)
    }
}

#Preview {
    VitalDashboardView()
}
