//
//  CrewListView.swift
//  HavenCrewInterface
//
//  Created by Bryan Norden on 5/19/25.
//

import SwiftUI
import VitalsCoreWrapper

@MainActor
struct CrewListView: View {
    @StateObject private var viewModel = CrewVitalsViewModel()
    
    var body: some View {
        LazyVGrid(
            columns: [GridItem(.adaptive(minimum: 240), spacing: 5)],
            spacing: 5,
        ) {
            ForEach(viewModel.crewMembers) { member in
                CrewCardView(member: member)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    CrewListView()
}
