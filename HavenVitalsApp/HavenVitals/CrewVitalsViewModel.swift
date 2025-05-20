//
//  VitalSignsViewModel.swift
//  HavenVitals
//
//  Created by Bryan Norden on 5/13/25.
//

import Foundation
import VitalsCore

enum HealthStatus {
    case stable
    case warning
    case critical
}

class CrewVitalsViewModel: ObservableObject {
    @Published var crewMembers: [CrewMember] = []
    
    private var timer: Timer?
    
    init() {
        crewMembers = [
            CrewMember(id: UUID(), name: "Cmdr. Hayes", vitals: defaultVitals(), status: "Normal"),
            CrewMember(id: UUID(), name: "Lt. Singh", vitals: defaultVitals(), status: "Normal"),
            CrewMember(id: UUID(), name: "Spec. Lopez", vitals: defaultVitals(), status: "Normal"),
            CrewMember(id: UUID(), name: "Eng. Kim", vitals: defaultVitals(), status: "Normal")
        ]
        
        startFetchingCrewUpdates()
    }
    
    deinit {
        timer?.invalidate()
    }
    
    func startFetchingCrewUpdates() {
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { [weak self] _ in
            self?.fetchCrewVitals()
        }
    }
    
    func fetchCrewVitals() {
        for i in crewMembers.indices {
            let cVitals = getNextVitalSigns()
            let newVitals = VitalSigns(
                heartRate: cVitals.heartRate,
                oxygenLevel: cVitals.oxygenLevel,
                temperature: cVitals.temperature,
                suitPressure: cVitals.suitPressure
            )
            crewMembers[i].vitals = newVitals
            crewMembers[i].status = String(cString: checkVitalSigns(cVitals))
        }
    }
    
    private func defaultVitals() -> VitalSigns {
        return VitalSigns(heartRate: 75, oxygenLevel: 98, temperature: 98.6, suitPressure: 14.7)
    }
}
