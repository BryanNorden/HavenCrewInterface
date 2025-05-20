#include "HealthChecker.hpp"
#include <sstream>

std::string HealthChecker::checkVitals(const VitalSigns& vitals) {
    if (vitals.oxygenLevel < 92.0f) {
        return "Warning: Oxygen Low";
    } else if (vitals.heartRate > 120.0f) {
        return "Critical: Heart Rate Too High";
    } else if (vitals.temperature > 101.0f) {
        return "Warning: Temperature High";
    }
    return "Normal";
}
