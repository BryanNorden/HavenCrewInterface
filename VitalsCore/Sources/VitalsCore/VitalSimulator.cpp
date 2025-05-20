#include "VitalSimulator.hpp"
#include <cstdlib>
#include <ctime>

VitalSimulator::VitalSimulator() {
    std::srand(static_cast<unsigned>(std::time(nullptr)));
    
    // Setting reasonable defaults
    currentVitals.heartRate = 75.0f;
    currentVitals.oxygenLevel = 98.0f;
    currentVitals.temperature = 98.6f;
    currentVitals.suitPressure = 14.7f;
}

VitalSigns VitalSimulator::generateNextVitals() {
    currentVitals.heartRate = randomize(currentVitals.heartRate, 2.5f);
    currentVitals.oxygenLevel = randomize(currentVitals.oxygenLevel, 1.0f);
    currentVitals.temperature = randomize(currentVitals.temperature, 0.3f);
    currentVitals.suitPressure = randomize(currentVitals.suitPressure, 0.2f);
    
    return currentVitals;
}

float VitalSimulator::randomize(float base, float variance) {
    float change = ((std::rand() % 1000) / 1000.0f) * variance * 2 - variance;
    return base + change;
}
