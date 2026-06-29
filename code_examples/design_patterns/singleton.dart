class Singleton {
  // Private constructor
  Singleton._privateConstructor();

  // Static private instance
  static Singleton? _instance;

  // Public factory method to provide access to the instance
  factory Singleton() {
    _instance ??= Singleton._privateConstructor();
    return _instance!;
  }

  void someBusinessLogic() {
    print("Singleton instance invoked for business logic.");
  }
}

void main() async {
  var singleton1 = Singleton();
  var singleton2 = Singleton();

  print(identical(singleton1, singleton2)); // true

  singleton1.someBusinessLogic();
  var singleton3 = EagerSingleton();
  var singleton4 = EagerSingleton();

  print(identical(singleton3, singleton4)); // true

  singleton3.someBusinessLogic();

  var singleton5 = await ThreadSafeSingleton.getInstance();
  var singleton6 = await ThreadSafeSingleton.getInstance();

  print(identical(singleton5, singleton6)); // true

  singleton5.someBusinessLogic();
}

class EagerSingleton {
  // Private constructor
  EagerSingleton._privateConstructor();

  // Static instance initialized immediately
  static final EagerSingleton _instance = EagerSingleton._privateConstructor();

  // Public accessor
  factory EagerSingleton() {
    return _instance;
  }

  void someBusinessLogic() {
    print("Eager Singleton instance invoked.");
  }
}

class ThreadSafeSingleton {
  // Private constructor
  ThreadSafeSingleton._privateConstructor();

  // Static instance
  static ThreadSafeSingleton? _instance;

  // Public accessor with thread-safe initialization
  static Future<ThreadSafeSingleton> getInstance() async {
    if (_instance == null) {
      await Future.delayed(Duration(milliseconds: 10)); // Simulate a delay
      _instance ??= ThreadSafeSingleton._privateConstructor();
    }
    return _instance!;
  }

  void someBusinessLogic() {
    print("Thread-safe Singleton instance invoked.");
  }
}

// Singleton Design Pattern
// The Singleton Design Pattern ensures that a class has only one instance and provides a global point of access to it.
// This is useful when exactly one object is needed to coordinate actions across the system.
//
// When to Use the Singleton Pattern?
// When a single shared resource (e.g., configuration, logging, cache) needs to be accessed globally.
// When controlling concurrent access to a shared resource.
// To provide a single access point for a specific functionality.
// Key Characteristics
// Single Instance: Ensures that only one instance of the class exists.
// Global Access Point: Provides a way to access the instance globally.
// Controlled Instantiation: Prevents direct instantiation from outside the class.
// Implementation in Dart
// Dart provides several ways to implement the Singleton pattern. Here’s how:
//
// 1. Lazy Singleton Implementation
// This approach ensures the instance is created only when it is first accessed.

// class Singleton {
//   // Private constructor
//   Singleton._privateConstructor();
//
//   // Static private instance
//   static Singleton? _instance;
//
//   // Public factory method to provide access to the instance
//   factory Singleton() {
//     _instance ??= Singleton._privateConstructor();
//     return _instance!;
//   }
//
//   void someBusinessLogic() {
//     print("Singleton instance invoked for business logic.");
//   }
// }
// Usage

// void main() {
//   var singleton1 = Singleton();
//   var singleton2 = Singleton();
//
//   print(identical(singleton1, singleton2)); // true
//
//   singleton1.someBusinessLogic();
// }
// 2. Eager Singleton Implementation
// In this version, the instance is created as soon as the class is loaded.
//

// class EagerSingleton {
//   // Private constructor
//   EagerSingleton._privateConstructor();
//
//   // Static instance initialized immediately
//   static final EagerSingleton _instance = EagerSingleton._privateConstructor();
//
//   // Public accessor
//   factory EagerSingleton() {
//     return _instance;
//   }
//
//   void someBusinessLogic() {
//     print("Eager Singleton instance invoked.");
//   }
// }
// Usage
// dart
// Copy code
// void main() {
//   var singleton1 = EagerSingleton();
//   var singleton2 = EagerSingleton();
//
//   print(identical(singleton1, singleton2)); // true
//
//   singleton1.someBusinessLogic();
// }
// 3. Thread-Safe Singleton Implementation
// In multi-threaded environments, you can ensure thread safety using Dart’s synchronized package or other mechanisms.
//

// import 'dart:async';
//
// class ThreadSafeSingleton {
//   // Private constructor
//   ThreadSafeSingleton._privateConstructor();
//
//   // Static instance
//   static ThreadSafeSingleton? _instance;
//
//   // Public accessor with thread-safe initialization
//   static Future<ThreadSafeSingleton> getInstance() async {
//     if (_instance == null) {
//       await Future.delayed(Duration(milliseconds: 10)); // Simulate a delay
//       _instance ??= ThreadSafeSingleton._privateConstructor();
//     }
//     return _instance!;
//   }
//
//   void someBusinessLogic() {
//     print("Thread-safe Singleton instance invoked.");
//   }
// }
// Usage
// void main() async {
//   var singleton1 = await ThreadSafeSingleton.getInstance();
//   var singleton2 = await ThreadSafeSingleton.getInstance();
//
//   print(identical(singleton1, singleton2)); // true
//
//   singleton1.someBusinessLogic();
// }
// Benefits of Singleton Pattern
// Controlled Access:
//
// Guarantees a single point of control over the resource.
// Global Access:
//
// Provides a globally accessible instance.
// Lazy Initialization:
//
// Reduces memory usage if the instance is created on demand.
// Thread Safety:
//
// Ensures safe usage in multi-threaded environments (with proper implementation).
// Drawbacks
// Global State:
//
// It may lead to unexpected behaviors if the state is modified in one part of the code and accessed in another.
// Testing Difficulty:
//
// Makes unit testing harder due to its global nature and inability to mock or reset the singleton easily.
// Hidden Dependencies:
//
// Code depending on a Singleton can become tightly coupled, making it harder to understand and refactor.
// Conclusion
// The Singleton Pattern is a simple yet powerful way to ensure a class has only one instance while providing a global access point.
// It is widely used for shared resources like configuration settings,
// logging, and database connections. However, use it judiciously to avoid issues with global state and testing complexity.

// The Singleton Design Pattern is a widely used pattern but is also considered an anti-pattern in some scenarios due to
// the potential issues it introduces. Here's why:
//
// Why Singleton is Considered an Anti-Pattern
// 1. Global State and Hidden Dependencies
// Problem: Singletons act as a global state, making the system dependent on a single instance.
// This can lead to implicit dependencies where classes rely on the Singleton without it being apparent from their interface.
// Impact: Makes the code harder to understand, maintain, and debug, as dependencies are not explicitly passed.
// 2. Tight Coupling
// Problem: When multiple classes depend on the Singleton, they become tightly coupled to it.
// Impact: Refactoring or changing the Singleton becomes difficult since changes may impact all dependent classes.
// 3. Testing Difficulties
// Problem: Singletons introduce global state, which is difficult to isolate in unit tests.
// Impact: Mocking or resetting the Singleton's state for individual tests becomes cumbersome.
// It can lead to test order dependencies and unreliable tests.
// 4. Violation of Single Responsibility Principle (SRP)
// Problem: A Singleton often takes on multiple responsibilities beyond just managing its single instance,
// such as configuration, logging, etc.
// Impact: It becomes harder to modify or extend without affecting unrelated functionality.
// 5. Concurrency Issues
// Problem: If not implemented properly (e.g., in multi-threaded environments),
// Singletons can lead to race conditions and other thread safety issues.
// Impact: Leads to inconsistent behavior and bugs that are hard to track down.
// 6. Lack of Flexibility
// Problem: Since there is only one instance, it becomes hard to adapt the system to different requirements
// (e.g., multiple configurations in testing vs. production).
// Impact: Limits scalability and configurability of the application.
// When Singleton is Useful (Despite Criticism)
// Managing shared resources like configuration files, logging systems, or database connections.
// Situations where ensuring a single instance is critical for functional correctness.
// Alternatives to Singleton
// Dependency Injection (DI):
//
// Pass the instance explicitly to the objects that need it.
// Improves testability and decouples the components.
// Service Locator:
//
// A centralized registry provides dependencies but avoids global state.
// Scoped Instances:
//
// Limit the lifespan and scope of instances to specific modules or contexts.
// Conclusion
// Singleton is considered an anti-pattern in many contexts because it often introduces global state,
// tight coupling, and testing challenges, which conflict with principles like modularity, testability, and flexibility.
// In modern software design, patterns like Dependency Injection and Service Locators are preferred for better
// maintainability and scalability.
// However, Singleton is still useful in specific, controlled scenarios when used carefully.
