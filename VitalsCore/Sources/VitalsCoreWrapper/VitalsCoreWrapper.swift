import VitalsCore

public struct VitalSigns {
    public let heartRate: Float
    public let oxygenLevel: Float
    public let temperature: Float
    public let suitPressure: Float
    
    init(cVitalSigns: VitalsCore.VitalSignsC) {
        self.heartRate = cVitalSigns.heartRate
        self.oxygenLevel = cVitalSigns.oxygenLevel
        self.temperature = cVitalSigns.temperature
        self.suitPressure = cVitalSigns.suitPressure
    }
}

public class VitalsCoreWrapper {
    public init() {}
    
    public func getNextVitalSigns() -> VitalSigns {
        let cVitalSigns = VitalsCore.getNextVitalSigns()
        return VitalSigns(cVitalSigns: cVitalSigns)
    }
    
    public func checkVitalSigns(_ vitals: VitalSigns) -> String {
        let cVitals = VitalSignsC(
            heartRate: vitals.heartRate,
            oxygenLevel: vitals.oxygenLevel,
            temperature: vitals.temperature,
            suitPressure: vitals.suitPressure
        )
        
        guard let cResult = VitalsCore.checkVitalSigns(cVitals) else {
            return ""
        }
        
        defer { VitalsCore.freeVitalSignsResult(cResult) }
        return String(cString: cResult)
    }
}
