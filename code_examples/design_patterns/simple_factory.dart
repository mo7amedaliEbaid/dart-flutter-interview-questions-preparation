// Types of Factory Pattern
// Simple Factory (Static Factory Method)
// Provides a single method to create different types of objects.
// The method is usually static.
// Factory Method (Polymorphic Factory)
// Relies on inheritance: the superclass defines a method that subclasses override to create specific objects.
// Abstract Factory
// Provides an interface to create families of related or dependent objects without specifying their concrete classes.

// 1. Simple Factory
// The simplest form where a static method returns different types of objects.

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

class AnimalFactory {
  static Animal getAnimal(String type) {
    switch (type) {
      case 'dog':
        return Dog();
      case 'cat':
        return Cat();
      default:
        throw Exception('Unknown animal type');
    }
  }
}

void main() {
  Animal dog = AnimalFactory.getAnimal('dog');
  dog.speak(); // Output: Woof! Woof!

  Animal cat = AnimalFactory.getAnimal('cat');
  cat.speak(); // Output: Meow! Meow!
}
// Dart provides several built-in examples of the Factory Pattern in its core libraries.
// These implementations follow the factory pattern principles by providing controlled ways to instantiate objects
// without exposing the constructors directly.
//
// 1. Factory Constructors in Dart
// Dart allows the use of factory constructors, which are special constructors that don't always create a new instance of a class.
// Instead, they can return an existing instance or perform additional logic before creating the object.
//
// Example: DateTime
// The DateTime class in Dart uses a factory constructor to create DateTime objects.
//
// dart
// Copy code
// void main() {
//   var now = DateTime.now(); // Factory constructor
//   var specificDate = DateTime(2022, 5, 30);
//
//   print('Current Date and Time: $now');
//   print('Specific Date: $specificDate');
// }
// DateTime.now(): Uses a factory constructor to return the current date and time.
//
// DateTime.utc() and DateTime.fromMillisecondsSinceEpoch(): These constructors encapsulate the creation logic based on different inputs.
//
// 2. Abstract Factories in Dart Collections
// Dart collections such as List, Map, and Set use factory constructors to provide flexible creation methods.
//
// Example: List
// dart
// Copy code
// void main() {
//   List<int> growableList = List<int>.empty(growable: true); // Factory constructor
//   growableList.add(5);
//   growableList.add(10);
//
//   print('Growable List: $growableList'); // Output: [5, 10]
//
//   List<int> filledList = List<int>.filled(3, 0); // Factory constructor
//   print('Filled List: $filledList'); // Output: [0, 0, 0]
// }
// List.empty(): Creates an empty list with optional growability.
//
// List.filled(): Creates a list of fixed length filled with a default value.
//
// 3. Map Factory Constructors
// Dart’s Map provides factory constructors for different types of maps.
//
// dart
// Copy code
// void main() {
//   Map<String, int> map = Map<String, int>(); // Factory constructor
//   map['one'] = 1;
//   map['two'] = 2;
//
//   print('Map: $map'); // Output: {one: 1, two: 2}
//
//   Map<String, int> identityMap = Map.identity(); // Factory constructor
//   identityMap['three'] = 3;
//
//   print('Identity Map: $identityMap'); // Output: {three: 3}
// }
// Map(): Creates a growable map.
//
// Map.identity(): Creates a map using identity for equality and hash code.
//
// 4. Stream Factory
// The Stream class provides factory constructors for creating different types of streams.
//
// dart
// Copy code
// void main() async {
//   Stream<int> stream = Stream<int>.fromIterable([1, 2, 3, 4, 5]); // Factory constructor
//   await for (var value in stream) {
//     print('Stream value: $value');
//   }
//
//   Stream<int> periodicStream = Stream<int>.periodic(Duration(seconds: 1), (x) => x);
//   var subscription = periodicStream.take(3).listen((value) => print('Periodic value: $value'));
//   await subscription.asFuture(); // Wait until the subscription is done
// }
// Stream.fromIterable(): Creates a stream from an iterable.
//
// Stream.periodic(): Creates a stream that emits events periodically.
//
// 5. Uri Factory
// The Uri class provides factory constructors for parsing and creating URIs.
//
// dart
// Copy code
// void main() {
//   Uri uri = Uri.parse('https://example.com/path?query=dart'); // Factory constructor
//   print('Scheme: ${uri.scheme}'); // Output: https
//   print('Host: ${uri.host}'); // Output: example.com
//
//   Uri customUri = Uri(
//     scheme: 'https',
//     host: 'api.example.com',
//     path: 'v1/users',
//     queryParameters: {'page': '1', 'limit': '10'},
//   );
//   print('Custom URI: $customUri'); // Output: https://api.example.com/v1/users?page=1&limit=10
// }
// Uri.parse(): Parses a URI string and creates a Uri object.
//
// Uri constructor: Creates a Uri from individual components like scheme, host, and query parameters.
//
// Summary of Built-in Factory Pattern Usage in Dart
// Class	Factory Methods/Constructors	Purpose
// DateTime	now(), utc(), fromMillisecondsSinceEpoch()	Creates date-time instances.
// List	empty(), filled(), generate()	Creates lists with different configurations.
// Map	identity(), from()	Provides various map types.
// Stream	fromIterable(), periodic()	Creates streams with different sources.
// Uri	parse(), https(), http()	Parses or creates URI objects.
// These built-in examples follow the Factory Pattern to simplify object creation and ensure flexibility in managing object instances.