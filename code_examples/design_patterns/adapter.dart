abstract class NewLogger {
  void writeLog(String message);
}

class OldLogger {
  void logMessage(String message) {
    print("Old Logger: $message");
  }
}

class LoggerAdapter implements NewLogger {
  final OldLogger oldLogger;

  LoggerAdapter(this.oldLogger);

  @override
  void writeLog(String message) {
    oldLogger.logMessage(message); // Adapting the method call
  }
}

void main() {
  // Create an instance of OldLogger
  OldLogger oldLogger = OldLogger();

  // Wrap it in an adapter
  NewLogger logger = LoggerAdapter(oldLogger);

  // Use the adapter to log messages
  logger.writeLog("This is a log message.");
}
// Adapter Design Pattern in Dart
// The Adapter Pattern is a structural design pattern used to bridge the gap between two incompatible interfaces.
// It allows a class with a specific interface to work with another class that has a different interface by converting
// one interface into another that the client expects.
//
// Key Components of Adapter Pattern:
// Target Interface: Defines the interface expected by the client.
// Adaptee: The existing class with an incompatible interface.
// Adapter: The class that implements the target interface and translates the request from the client to the adaptee.
// Client: Works with objects through the target interface.
// Example Scenario
// Suppose we have an old logging system (OldLogger) that writes logs using a logMessage(String) method.
// Now, we want to integrate this into a new system that uses a NewLogger interface with a method writeLog(String message).
//
// Implementation
// 1. Target Interface (NewLogger)
// abstract class NewLogger {
//   void writeLog(String message);
// }
// 2. Adaptee (OldLogger)
// class OldLogger {
//   void logMessage(String message) {
//     print("Old Logger: $message");
//   }
// }
// 3. Adapter (LoggerAdapter)
// The adapter implements the NewLogger interface and translates calls to the OldLogger.
//
// class LoggerAdapter implements NewLogger {
//   final OldLogger oldLogger;
//
//   LoggerAdapter(this.oldLogger);
//
//   @override
//   void writeLog(String message) {
//     oldLogger.logMessage(message); // Adapting the method call
//   }
// }
// 4. Client
// The client works with the NewLogger interface but can now use OldLogger through the adapter.
//
// void main() {
//   // Create an instance of OldLogger
//   OldLogger oldLogger = OldLogger();
//
//   // Wrap it in an adapter
//   NewLogger logger = LoggerAdapter(oldLogger);
//
//   // Use the adapter to log messages
//   logger.writeLog("This is a log message.");
// }
// Explanation
// Client (main):
//
// The client expects a NewLogger interface to log messages.
// It interacts with LoggerAdapter, unaware of the underlying OldLogger.
// Adapter (LoggerAdapter):
//
// Implements the NewLogger interface.
// Internally delegates the writeLog call to OldLogger's logMessage method.
// Adaptee (OldLogger):
//
// The old system's class that doesn't conform to NewLogger.
// Benefits of Using the Adapter Pattern
// Reusability: Reuses the existing OldLogger without modifying it.
// Interoperability: Bridges the gap between different interfaces.
// Flexibility: Adapts multiple incompatible interfaces to work with the new system.
// Real-World Analogy
// Imagine you have an old-style 3-pin power plug (OldLogger) and a modern 2-pin socket (NewLogger).
// You can use an adapter (LoggerAdapter) that allows the 3-pin plug to fit into the 2-pin socket.
//
// Key Points
// The adapter pattern allows incompatible interfaces to work together.
// In Dart, the adapter is typically implemented by creating a class that wraps an existing class and translates its interface.

// Using the Adapter Design Pattern in the context of APIs and Hive (or other local storage systems)
// often involves creating an intermediary class that bridges the gap between your API data format and the local storage format.
// This ensures your application can seamlessly convert, store, and retrieve data between the two layers, despite their differences.
//
// How Adapter Fits with APIs and Hive
// API Data Model: Data retrieved from the API is often structured in a specific format (e.g., JSON).
// Local Storage Model: Hive, as a local storage solution, requires data to be stored in a format that is optimized for persistence
// and retrieval.
// Adapter Role: The adapter helps to convert the API model into a Hive-compatible model and vice versa,
// ensuring smooth interaction between the two systems.
// Use Case Example
// Suppose you have a User model fetched from an API in JSON format, but you want to store it in Hive.
// However, Hive requires you to manage type adapters for custom objects.
//
// Steps to Implement
// 1. API Data Model
// // API Data Model
// class User {
//   final int id;
//   final String name;
//   final String email;
//
//   User({required this.id, required this.name, required this.email});
//
//   // Factory constructor to create a User from JSON (from API)
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//     );
//   }
//
//   // Convert User object to JSON (for sending data back to the API)
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'email': email,
//     };
//   }
// }
// 2. Hive-Compatible Model
// Hive requires a class to have a simpler structure, often with a type adapter.
// For this, we can implement the adapter pattern by creating a Hive-compatible version of the User.
//

// // Hive-compatible User Model
// @HiveType(typeId: 1)
// class HiveUser {
//   @HiveField(0)
//   final int id;
//
//   @HiveField(1)
//   final String name;
//
//   @HiveField(2)
//   final String email;
//
//   HiveUser({required this.id, required this.name, required this.email});
// }
// 3. Adapter Implementation
// The adapter bridges the gap between User (API model) and HiveUser (local storage model).
//
// class UserAdapter {
//   // Convert User (API model) to HiveUser (local model)
//   static HiveUser toHiveUser(User user) {
//     return HiveUser(
//       id: user.id,
//       name: user.name,
//       email: user.email,
//     );
//   }
//
//   // Convert HiveUser (local model) to User (API model)
//   static User toApiUser(HiveUser hiveUser) {
//     return User(
//       id: hiveUser.id,
//       name: hiveUser.name,
//       email: hiveUser.email,
//     );
//   }
// }
// 4. Usage Example
// void main() async {
//   // Step 1: Simulate API response
//   Map<String, dynamic> apiResponse = {
//     "id": 101,
//     "name": "Alice",
//     "email": "alice@example.com"
//   };
//
//   // Step 2: Parse API response into User object
//   User apiUser = User.fromJson(apiResponse);
//
//   // Step 3: Convert API User to HiveUser using the adapter
//   HiveUser hiveUser = UserAdapter.toHiveUser(apiUser);
//
//   // Step 4: Store HiveUser in Hive (simulated)
//   print("Storing HiveUser in Hive: ${hiveUser.name}");
//
//   // Step 5: Retrieve HiveUser and convert back to User for API use
//   User restoredApiUser = UserAdapter.toApiUser(hiveUser);
//
//   print("Restored User for API: ${restoredApiUser.name}, ${restoredApiUser.email}");
// }
// Explanation
// User: Represents the API's data model with a fromJson method to parse data from the API and a toJson method for sending data back.
// HiveUser: Represents the Hive-compatible version of the User model,
// equipped with HiveType and HiveField annotations for efficient local storage.
// UserAdapter: Acts as an adapter that converts between User and HiveUser:
// toHiveUser: Converts User to HiveUser for local storage.
// toApiUser: Converts HiveUser back to User for API interaction.
// Benefits of Using the Adapter Pattern Here
// Decoupling:
//
// Keeps the API and local storage layers independent. If the API structure changes, you only need to modify the adapter,
// not the entire storage logic.
// Reusability:
//
// You can reuse the adapter logic across different parts of your application.
// Flexibility:
//
// Supports different data formats for APIs and Hive without tightly coupling them.
// When to Use Adapter with Hive?
// Different Data Formats:
// When the data model from the API differs from the local storage model.
// Encapsulation:
// Hide the complexity of converting data models from the client code.
// Consistency:
// Ensure data integrity by using the same adapter logic for conversions throughout the application.

