# Inherited Widget:
- Type: Structural
- Explanation: Inherited Widget is a Flutter-specific design pattern that allows you to propagate information down the widget tree efficiently. It's often used for passing data that needs to be accessible by multiple widgets without having to pass it explicitly.
```dart
class MyInheritedWidget extends InheritedWidget {
  final String data;

  MyInheritedWidget({required this.data, required Widget child})
      : super(child: child);

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!;
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return oldWidget.data != data;
  }
}
```
# Singleton:
- Type: Creational
- Explanation: Ensures that a class has only one instance and provides a global point to access it.
```dart
class Singleton {
  static Singleton? _instance;

  factory Singleton() {
    _instance ??= Singleton._();
    return _instance!;
  }

  Singleton._();
}
```
# Dependency Injection:
- Type: Structural
- Explanation: It's a design pattern where a class receives its dependencies from external sources rather than creating them itself. This promotes code reusability, testability, and flexibility.
```dart
class SomeService {
  // Some service implementation
}

class MyClass {
  final SomeService _service;

  MyClass(this._service);

  // Use _service in the class
}
```
# Adapter:
- Type: Structural
- Explanation: Allows the interface of an existing class to be used as another interface. It's often used to make existing classes work with others without modifying their source code.
```dart
class OldClass {
  void doSomethingOld() {
    // Old implementation
  }
}

class Adapter {
  final OldClass _oldClass;

  Adapter(this._oldClass);

  void doSomethingNew() {
    _oldClass.doSomethingOld();
    // Add new functionality if needed
  }
}
```
# Decorator:
- Type: Structural
- Explanation: Attaches additional responsibilities to an object dynamically. It provides a flexible alternative to subclassing for extending functionality.
```dart
abstract class Component {
  void operation();
}

class ConcreteComponent implements Component {
  @override
  void operation() {
    // Basic operation
  }
}

class Decorator implements Component {
  final Component _component;

  Decorator(this._component);

  @override
  void operation() {
    _component.operation();
    // Additional operation
  }
}
```
# Observer:
- Type: Behavioral
- Explanation: Defines a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically.
```dart
class Observer {
  void update(String message) {
    // Update logic
  }
}

class Subject {
  List<Observer> _observers = [];

  void addObserver(Observer observer) {
    _observers.add(observer);
  }

  void removeObserver(Observer observer) {
    _observers.remove(observer);
  }

  void notifyObservers(String message) {
    for (var observer in _observers) {
      observer.update(message);
    }
  }
}
```
# Repository Pattern:
- Type: Architectural
- Explanation: Separates the logic that retrieves data from the underlying storage, allowing a clean separation between domain code and data access code.
```dart
class UserRepository {
  Future<User> getUserById(String userId) {
    // Logic to fetch user from storage
  }

  Future<void> saveUser(User user) {
    // Logic to save user to storage
  }
}
```
