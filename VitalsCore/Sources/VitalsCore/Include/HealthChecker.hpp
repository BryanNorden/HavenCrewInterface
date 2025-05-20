#pragma once
#include "VitalSigns.hpp"
#include <string>

class HealthChecker {
public:
    std::string checkVitals(const VitalSigns& vitals);
};
