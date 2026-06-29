// The Factory Pattern is a creational design pattern that provides a way to create objects without
// specifying the exact class of the object being created.
// It delegates the responsibility of object creation to a factory method,
// abstracting the instantiation process from the client.


// 2. Factory Method
// Relies on subclasses to decide which class to instantiate.

abstract class Animal {
  void speak();
}

class Dog implements Animal {
  @override
  void speak() {
    print('Woof! Woof!');
  }
}

class Cat implements Animal {
  @override
  void speak() {
    print('Meow! Meow!');
  }
}

abstract class AnimalFactory {
  Animal createAnimal();
}

class DogFactory extends AnimalFactory {
  @override
  Animal createAnimal() {
    return Dog();
  }
}

class CatFactory extends AnimalFactory {
  @override
  Animal createAnimal() {
    return Cat();
  }
}

void main() {
  AnimalFactory dogFactory = DogFactory();
  Animal dog = dogFactory.createAnimal();
  dog.speak(); // Output: Woof! Woof!

  AnimalFactory catFactory = CatFactory();
  Animal cat = catFactory.createAnimal();
  cat.speak(); // Output: Meow! Meow!
}
// In many cases, especially when dealing with APIs and parsing JSON responses,
// the Factory Pattern is used in combination with fromJson() methods to convert raw JSON data into Dart objects.
// This is a very common approach for creating models from API responses.
//
// Using a factory constructor with fromJson() allows you to abstract the creation process of objects from raw data,
// and ensures that your objects are correctly instantiated and initialized based on the data returned from the API.
//
// Example: Using Factory with fromJson() in Dart
// Let’s walk through an example of how you can use a factory constructor with a fromJson() method when working with API responses in Dart.
//
// 1. Model Class with fromJson() Method
// import 'dart:convert';
//
// // Step 1: Define a model class
// class User {
//   final int id;
//   final String name;
//   final String email;
//
//   // Constructor
//   User({required this.id, required this.name, required this.email});
//
//   // Step 2: Define the factory constructor with fromJson
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       name: json['name'],
//       email: json['email']
//     );
//   }
//
//   // Step 3: Define toJson method to convert User object back to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'email': email,
//     };
//   }
// }
//
// void main() {
//   // Step 4: Simulate an API response (JSON string)
//   String jsonResponse = '{"id": 1, "name": "John Doe", "email": "johndoe@example.com"}';
//
//   // Step 5: Parse the JSON string and create a User object using the fromJson factory
//   Map<String, dynamic> jsonData = json.decode(jsonResponse);
//   User user = User.fromJson(jsonData);
//
//   // Step 6: Output the created User object
//   print('User ID: ${user.id}');
//   print('User Name: ${user.name}');
//   print('User Email: ${user.email}');
// }
// Key Points:
// fromJson() Factory Constructor:
//
// The User.fromJson() factory constructor takes a Map<String, dynamic> (which is typically how JSON data is parsed) and creates an instance of User.
// The method maps the JSON fields (id, name, email) to the constructor parameters and returns a new User object.
// To JSON (toJson()):
//
// The toJson() method is used to convert the Dart object back into a JSON map when you need to send it back to the API or serialize it for other uses.
// API Response Simulation:
//
// In the example, we simulate a simple API response by using a JSON string and then parsing it into a Dart Map<String, dynamic>.
// Afterward, the fromJson() factory constructor is used to create a User object.
// Why Use Factory with fromJson()?
// Separation of Concerns:
//
// Using a factory constructor with fromJson() allows you to keep the logic of creating objects
// based on raw JSON separate from other business logic in your application.
// Encapsulation:
//
// It hides the logic for creating objects, making your code more readable and maintainable.
// You don't have to directly call constructors or deal with any extra logic outside the model class.
// Data Integrity:
//
// It ensures that the object is correctly instantiated and initialized with valid data,
// especially useful when dealing with complex nested JSON structures.
// Example: Working with a List of Users
// In case you are fetching multiple users from an API and you need to handle a list of them,
// you can extend the fromJson pattern to handle lists as well.
//
// Example of List of Users:
// class User {
//   final int id;
//   final String name;
//   final String email;
//
//   User({required this.id, required this.name, required this.email});
//
//   // Factory constructor to create User from JSON
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//     );
//   }
//
//   // To JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'email': email,
//     };
//   }
// }
//
// // A function that takes a JSON List and returns a List of User objects
// List<User> parseUsers(List<dynamic> jsonList) {
//   return jsonList.map((json) => User.fromJson(json)).toList();
// }
//
// void main() {
//   // Simulating API response (JSON list of users)
//   String jsonResponse = '''
//   [
//     {"id": 1, "name": "John Doe", "email": "johndoe@example.com"},
//     {"id": 2, "name": "Jane Smith", "email": "janesmith@example.com"}
//   ]
//   ''';
//
//   List<dynamic> jsonData = json.decode(jsonResponse);
//
//   // Using the parseUsers function to convert JSON into a list of User objects
//   List<User> users = parseUsers(jsonData);
//
//   for (var user in users) {
//     print('User ID: ${user.id}');
//     print('User Name: ${user.name}');
//     print('User Email: ${user.email}');
//   }
// }
// Summary:
// Factory Pattern combined with fromJson() helps abstract the creation of objects from raw API data,
// allowing you to easily map JSON responses into Dart objects.
// This approach helps keep your code organized, especially when you need to work with large and complex API responses.
