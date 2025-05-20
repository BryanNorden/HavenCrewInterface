#pragma once

#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
    float heartRate;
    float oxygenLevel;
    float temperature;
    float suitPressure;
} VitalSignsC;

VitalSignsC getNextVitalSigns(void);

#ifdef __cplusplus
}
#endif
