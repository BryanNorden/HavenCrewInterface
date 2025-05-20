#include "VitalsInterface.h"
#include "HealthChecker.hpp"
#include "VitalSimulator.hpp"

#include <string>

static VitalSimulator simulator;
static HealthChecker checker;

VitalSignsC getNextVitalSigns(void) {
    // Currenlty using simulated vitals.
    // This is where you would grab data from hardware sensors
    VitalSigns vitals = simulator.generateNextVitals();
    return {
        vitals.heartRate,
        vitals.oxygenLevel,
        vitals.temperature,
        vitals.suitPressure
    };
}

char* checkVitalSigns(VitalSignsC input) {
    VitalSigns vitals = {
        input.heartRate,
        input.oxygenLevel,
        input.temperature,
        input.suitPressure
    };
    std::string result = checker.checkVitals(vitals);
    char* cResult = strdup(result.c_str());
    return cResult;
}

void freeVitalSignsResult(char* result) {
    free(result);
}
