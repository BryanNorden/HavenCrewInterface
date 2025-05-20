//
//  CrewMember.swift
//  HavenVitals
//
//  Created by Bryan Norden.
//

import Foundation
import VitalsCoreWrapper

struct CrewMember: Identifiable {
    let id: UUID
    let name: String
    let role: String
    var vitals: VitalSigns
    var vitalSignStatuses: [VitalSignType: VitalStatus]
    var status: String
}

class DefaultValues {
    func defaultVitals() -> VitalSigns {
        let heartRate = Float.random(in: 60...100)             // Normal resting heart rate
        let oxygenLevel = Float.random(in: 95...100)           // Normal SpO2 level
        let temperature = Float.random(in: 97.5...99.5)        // Normal body temperature (Fahrenheit)
        let suitPressure = Float.random(in: 14.0...14.9)       // Simulated suit pressure in psi
        
        return VitalSigns(
            heartRate: heartRate,
            oxygenLevel: oxygenLevel,
            temperature: round(temperature * 10) / 10,          // Round to 1 decimal
            suitPressure: round(suitPressure * 10) / 10         // Round to 1 decimal
        )
    }
    
    static func initialVitalSignStatuses() -> [VitalSignType: VitalStatus] {
        return [
            .heartRate: .normal,
            .oxygenLevel: .normal,
            .temperature: .normal,
            .suitPressure: .normal
        ]
    }
}
