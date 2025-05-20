#pragma once
#include "VitalSigns.hpp"

class VitalSimulator {
public:
    VitalSimulator();
    VitalSigns generateNextVitals();

private:
    VitalSigns currentVitals;
    float randomize(float base, float variance);
};
