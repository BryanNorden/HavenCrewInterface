//
//  StationDashboardView.swift
//  HavenCrewInterface
//
//  Created by Bryan Norden.
//

import SwiftUI
import VitalsCoreWrapper

struct StationDashboardView: View {
    @StateObject private var viewModel = CrewVitalsViewModel()
    @State private var starlinkStatus = StarlinkStatus(signalStrength: "Strong", latency: 25.0, dataRate: 6.4)
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 20) {
                HStack {
                    Image("Vast_Icon_White")
                        .resizable()
                        .scaledToFit()
                    Text("Haven-1 Crew Dashboard")
                        .font(.system(.title, design: .default, weight: .bold))
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.all)
                .background(
                    Color(red: 0.85, green: 0.75, blue: 0.65).opacity(0.75)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                )
                
                CrewListView()
                
                StarlinkStatusView(starlinkStatus: starlinkStatus)
            }
        }
        .padding()
    }
}

#Preview {
    StationDashboardView()
}
