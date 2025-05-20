#include "VitalsInterface.h"
#include "VitalSimulator.hpp"

#include <string>

static VitalSimulator simulator;

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
