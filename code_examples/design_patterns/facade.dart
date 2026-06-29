// Facade Design Pattern
// The Facade Design Pattern is a structural pattern that provides a simplified interface to a larger,
// more complex subsystem. Instead of exposing all the details of the subsystem, it creates a unified,
// higher-level interface that makes the subsystem easier to use.


// 1. Subsystems
// Each subsystem has its own detailed implementation:
class Lights {
  void turnOn() => print("Lights turned on.");
  void turnOff() => print("Lights turned off.");
}

class AirConditioner {
  void turnOn() => print("Air Conditioner turned on.");
  void turnOff() => print("Air Conditioner turned off.");
  void setTemperature(int temperature) => print("Temperature set to $temperature°C.");
}

class MusicSystem {
  void turnOn() => print("Music System turned on.");
  void turnOff() => print("Music System turned off.");
  void playMusic() => print("Playing music...");
}

// 2. Facade
// The HomeAutomationFacade simplifies interactions with these subsystems:
class HomeAutomationFacade {
  final Lights _lights;
  final AirConditioner _airConditioner;
  final MusicSystem _musicSystem;

  HomeAutomationFacade(this._lights, this._airConditioner, this._musicSystem);

  void startPartyMode() {
    print("Starting Party Mode...");
    _lights.turnOn();
    _airConditioner.turnOn();
    _airConditioner.setTemperature(22);
    _musicSystem.turnOn();
    _musicSystem.playMusic();
  }

  void stopPartyMode() {
    print("Stopping Party Mode...");
    _lights.turnOff();
    _airConditioner.turnOff();
    _musicSystem.turnOff();
  }

  void relaxMode() {
    print("Starting Relax Mode...");
    _lights.turnOn();
    _airConditioner.turnOn();
    _airConditioner.setTemperature(24);
    _musicSystem.turnOn();
    print("Playing relaxing music...");
  }
}

// 3. Client
// The client uses the facade to control the home automation system without worrying about subsystem details:
void main() {
  // Subsystem instances
  Lights lights = Lights();
  AirConditioner airConditioner = AirConditioner();
  MusicSystem musicSystem = MusicSystem();

  // Facade instance
  HomeAutomationFacade homeFacade = HomeAutomationFacade(lights, airConditioner, musicSystem);

  // Use Facade to start Party Mode
  homeFacade.startPartyMode();

  print("\n--- After some time ---\n");

  // Use Facade to stop Party Mode
  homeFacade.stopPartyMode();

  print("\n--- Relax Mode ---\n");

  // Use Facade for Relax Mode
  homeFacade.relaxMode();
}
// When to Use the Facade Pattern?
// To reduce the complexity of interacting with multiple subsystems.
// To provide a single, unified interface for clients to interact with.
// To decouple the client from the subsystem, making the system easier to maintain and extend.

// Key Components
// Subsystems: The complex components with detailed functionalities.
// Facade: A simplified interface that interacts with the subsystems.
// Client: Uses the facade to interact with the subsystems without knowing their complexity.
// Example in Dart
// Scenario: A home automation system with multiple subsystems: Lights, AirConditioner, and MusicSystem.
// The client wants a simplified interface to control these systems.
// 1. Subsystems
// Each subsystem has its own detailed implementation:
//

// class Lights {
//   void turnOn() => print("Lights turned on.");
//   void turnOff() => print("Lights turned off.");
// }
//
// class AirConditioner {
//   void turnOn() => print("Air Conditioner turned on.");
//   void turnOff() => print("Air Conditioner turned off.");
//   void setTemperature(int temperature) => print("Temperature set to $temperature°C.");
// }
//
// class MusicSystem {
//   void turnOn() => print("Music System turned on.");
//   void turnOff() => print("Music System turned off.");
//   void playMusic() => print("Playing music...");
// }
// 2. Facade
// The HomeAutomationFacade simplifies interactions with these subsystems:
//
// class HomeAutomationFacade {
//   final Lights _lights;
//   final AirConditioner _airConditioner;
//   final MusicSystem _musicSystem;
//
//   HomeAutomationFacade(this._lights, this._airConditioner, this._musicSystem);
//
//   void startPartyMode() {
//     print("Starting Party Mode...");
//     _lights.turnOn();
//     _airConditioner.turnOn();
//     _airConditioner.setTemperature(22);
//     _musicSystem.turnOn();
//     _musicSystem.playMusic();
//   }
//
//   void stopPartyMode() {
//     print("Stopping Party Mode...");
//     _lights.turnOff();
//     _airConditioner.turnOff();
//     _musicSystem.turnOff();
//   }
//
//   void relaxMode() {
//     print("Starting Relax Mode...");
//     _lights.turnOn();
//     _airConditioner.turnOn();
//     _airConditioner.setTemperature(24);
//     _musicSystem.turnOn();
//     print("Playing relaxing music...");
//   }
// }
// 3. Client
// The client uses the facade to control the home automation system without worrying about subsystem details:
//
// void main() {
//   // Subsystem instances
//   Lights lights = Lights();
//   AirConditioner airConditioner = AirConditioner();
//   MusicSystem musicSystem = MusicSystem();
//
//   // Facade instance
//   HomeAutomationFacade homeFacade = HomeAutomationFacade(lights, airConditioner, musicSystem);
//
//   // Use Facade to start Party Mode
//   homeFacade.startPartyMode();
//
//   print("\n--- After some time ---\n");
//
//   // Use Facade to stop Party Mode
//   homeFacade.stopPartyMode();
//
//   print("\n--- Relax Mode ---\n");
//
//   // Use Facade for Relax Mode
//   homeFacade.relaxMode();
// }
// Output

// Starting Party Mode...
// Lights turned on.
// Air Conditioner turned on.
// Temperature set to 22°C.
// Music System turned on.
// Playing music...
//
// --- After some time ---
//
// Stopping Party Mode...
// Lights turned off.
// Air Conditioner turned off.
// Music System turned off.
//
// --- Relax Mode ---
//
// Starting Relax Mode...
// Lights turned on.
// Air Conditioner turned on.
// Temperature set to 24°C.
// Music System turned on.
// Playing relaxing music...
// Explanation
// Subsystems (Lights, AirConditioner, MusicSystem):
//
// Each subsystem provides specific, detailed functionality.
// Facade (HomeAutomationFacade):
//
// Provides a high-level interface for clients.
// Simplifies the complex interactions required to operate the home automation system.
// Client:
//
// Interacts only with the facade to control the system, without needing to know about the subsystems' internal workings.
// Benefits of the Facade Pattern
// Simplified Interface:
// Reduces complexity by hiding subsystem details.
// Decoupling:
// Minimizes dependencies between the client and the subsystem.
// Improved Maintainability:
// Changes in subsystems don’t affect clients as long as the facade interface remains consistent.
// Flexible Usage:
// The same subsystem can be accessed in different ways if necessary.
// Conclusion
// The Facade Pattern is highly useful for creating a simplified interface to complex systems. By implementing this pattern,
// you can make your application easier to use, maintain, and extend.