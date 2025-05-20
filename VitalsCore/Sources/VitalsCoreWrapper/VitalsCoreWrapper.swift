import VitalsCore

public struct VitalSigns {
    public let heartRate: Float
    public let oxygenLevel: Float
    public let temperature: Float
    public let suitPressure: Float
    
    public init(cVitalSigns: VitalsCore.VitalSignsC) {
        self.heartRate = cVitalSigns.heartRate
        self.oxygenLevel = cVitalSigns.oxygenLevel
        self.temperature = cVitalSigns.temperature
        self.suitPressure = cVitalSigns.suitPressure
    }
    
    public init(heartRate: Float, oxygenLevel: Float, temperature: Float, suitPressure: Float) {
        self.heartRate = heartRate
        self.oxygenLevel = oxygenLevel
        self.temperature = temperature
        self.suitPressure = suitPressure
    }
}

public protocol VitalsService {
    func getNextVitalSigns() -> VitalSigns
}

public class VitalsCoreWrapper: VitalsService {
    public init() {}
    
    public func getNextVitalSigns() -> VitalSigns {
        let cVitalSigns = VitalsCore.getNextVitalSigns()
        return VitalSigns(cVitalSigns: cVitalSigns)
    }
}
