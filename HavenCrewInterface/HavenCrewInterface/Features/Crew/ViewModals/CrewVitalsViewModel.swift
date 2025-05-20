//
//  VitalSignsViewModel.swift
//  HavenVitals
//
//  Created by Bryan Norden on 5/13/25.
//

import Foundation
import VitalsCoreWrapper

@MainActor
class CrewVitalsViewModel: ObservableObject {
    @Published var crewMembers: [CrewMember] = []
    private let vitalsService: VitalsService
    
    private var timer: Timer?
    
    init(vitalsService: VitalsService = VitalsCoreWrapper()) {
        self.vitalsService = vitalsService
        crewMembers = [
            CrewMember(
                id: UUID(),
                name: "Cmdr. Feustel",
                role: "Commander",
                vitals: DefaultValues().defaultVitals(),
                vitalSignStatuses:  DefaultValues.initialVitalSignStatuses(),
                status: "Normal"
            ),
            CrewMember(
                id: UUID(),
                name: "Lt. Singh",
                role: "Navigator",
                vitals:  DefaultValues().defaultVitals(),
                vitalSignStatuses:  DefaultValues.initialVitalSignStatuses(),
                status: "Normal"
            ),
            CrewMember(
                id: UUID(),
                name: "Spec. Kim",
                role: "Medic",
                vitals:  DefaultValues().defaultVitals(),
                vitalSignStatuses:  DefaultValues.initialVitalSignStatuses(),
                status: "Normal"
            ),
            CrewMember(
                id: UUID(),
                name: "Eng. Reisman",
                role: "Engineer",
                vitals:  DefaultValues().defaultVitals(),
                vitalSignStatuses:  DefaultValues.initialVitalSignStatuses(),
                status: "Normal"
            )
        ]
        
        startFetchingCrewUpdates()
    }
    
    deinit {
        timer?.invalidate()
    }
    
    func startFetchingCrewUpdates() {
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { [weak self] _ in
            Task { [weak self] in
                await self?.fetchCrewVitals()
            }
        }
    }
    
    func fetchCrewVitals() {
        for i in self.crewMembers.indices {
            let memberVitals = vitalsService.getNextVitalSigns()
            crewMembers[i].vitals = memberVitals
            let updatedVitalSignStatus = checkVitalStatuses(for: memberVitals)
            crewMembers[i].vitalSignStatuses = updatedVitalSignStatus
            crewMembers[i].status = statusString(for: updatedVitalSignStatus)
        }
    }
    
    func checkVitalStatuses(for vitals: VitalSigns) -> [VitalSignType: VitalStatus] {
        let heartRateStatus: VitalStatus
        let oxygenLevelStatus: VitalStatus
        let temperatureStatus: VitalStatus
        let suitPressureStatus: VitalStatus
        
        if vitals.heartRate < 50 || vitals.heartRate > 100 {
            heartRateStatus = .critical
        } else if vitals.heartRate < 60 {
            heartRateStatus = .warning
        } else {
            heartRateStatus = .normal
        }
        
        if vitals.oxygenLevel < 95 {
            oxygenLevelStatus = .warning
        } else if vitals.oxygenLevel < 90 {
            oxygenLevelStatus = .critical
        } else {
            oxygenLevelStatus = .normal
        }
        
        if vitals.temperature < 96 || (vitals.temperature > 99 && vitals.temperature < 101) {
            temperatureStatus = .critical
        } else if vitals.temperature > 99.5 || vitals.temperature < 97.5 {
            temperatureStatus = .warning
        } else {
            temperatureStatus = .normal
        }
        
        if vitals.suitPressure < 13.5 {
            suitPressureStatus = .critical
        } else if vitals.suitPressure < 14.0 {
            suitPressureStatus = .warning
        } else {
            suitPressureStatus = .normal
        }
        
        return [
            .heartRate: heartRateStatus,
            .oxygenLevel: oxygenLevelStatus,
            .temperature: temperatureStatus,
            .suitPressure: suitPressureStatus
        ]
    }
    
    func statusString(for statuses: [VitalSignType: VitalStatus]) -> String {
        let heartRateStatus = statuses[.heartRate]
        let oxygenLevelStatus = statuses[.oxygenLevel]
        let temperatureStatus = statuses[.temperature]
        let suitPressureStatus = statuses[.suitPressure]
        
        if heartRateStatus == .critical ||
            oxygenLevelStatus == .critical ||
            temperatureStatus == .critical ||
            suitPressureStatus == .critical {
            return "CRITICAL"
        }
        
        if heartRateStatus == .warning ||
            oxygenLevelStatus == .warning ||
            temperatureStatus == .warning ||
            suitPressureStatus == .warning {
            return "Warning"
        }
        
        return "Normal"
    }
}
