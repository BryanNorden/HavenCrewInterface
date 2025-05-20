#include "VitalsInterface.h"
#include "VitalSimulator.hpp"
#include "HealtChecker.hpp"

static VitalSimulator simulator;
static HealthChecker checker;

VitalSignsC getNextVitalSigns() {
    VitalSigns vs = simulator.generateNextVitals();
    return { vs.heartRate, vs.oxygenLevel, vs.temperature, vs.pressure };
}

const char* checkVitalSigns(VitalSignsC vs) {
    VitalSigns cppVs = { vs.heartRate, vs.oxygenLevel, vs.temperature, vs.pressure };
    static std::string result;
    result = checker.checkVitals(cppVs);
    return result.c_str();
}