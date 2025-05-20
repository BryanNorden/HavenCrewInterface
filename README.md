# Haven-1 Space Station Crew Interface

## Overview
HavenCrewInterface is a SwiftUI-based iPad app designed to power crew interfaces for Vast’s Haven-1 space station. It displays crew vitals and Starlink connection status. It's integrated with a C++ library for sensor data.

## Features
- **Crew Vitals**: Displays heart rate, oxygen levels, and temperature with updates from C++ sensor framework.
-- Includes warnings based on low or high sensor data
-- Grabs sensor data from VitalsCore
- **VitalsCore**: C++ library that connects to sensors and sends their data back. Right now it's using simulated data. 
- **Starlink Status**: Shows connection strength.

## Project Structure
- **HavenCrewInterface**: Main app module containing the entry point (`HavenCrewInterface.swift`) and core views.
  - `StationDashboardView.swift`: Main dashboard view for the app.
  - `Features`: Contains the features `Crew` and `Starlink`
    - `Features/Crew`: Crew-related models (`CrewMember.swift`) and UI.
    - `Features/Starlink`: Starlink status monitoring with models (`StarlinkStatus.swift`) and UI (`StarlinkStatusView.swift`).
  - `SharedUI`: Reusable UI components such as `CardBackground.swift` and `CardView.swift`.
- **HavenCrewInterfaceTests**: Unit tests for the app (`HavenVitalsTests.swift`).
- **VitalsCore Package**: Local Swift Package with wrapper and C++ library.
  - `VitalsCore`: Core functionality for vital signs simulation and interfacing.
    - `Include`: Header files for interfacing (`VitalSigns.hpp`, `VitalSimulator.hpp`, `VitalsInterface.h`).
    - `VitalsCore`: C++ implementation files (`VitalSimulator.cpp`, `VitalsInterface.cpp`).
  - `VitalsCoreWrapper`: Swift wrapper (`VitalsCoreWrapper.swift`) for bridging C++ and Swift.

## Setup
1. Requires Swift 5.9 and a C++ library (included in `HavenCrewInterface/VitalsCore`).
2. Open `HavenCrewInterface.xcworkspace` in Xcode 16+.
3. Build and run on an iPad Air 11-inch simulator or device. (Can use others but this is the best for current UI)

## Running the Demo
- Launch the app to view the vitals dashboard.
- Watch the sensor data change each second

## Notes
- Built with unidirectional data flow (MVVM) for maintainability.
- Video demo: https://youtu.be/erI4R12BUKk
- Contact: https://bryan.engineer
