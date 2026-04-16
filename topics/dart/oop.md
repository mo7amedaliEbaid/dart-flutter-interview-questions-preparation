# Object-Oriented Programming (OOP) in Dart

---

## 🟢 Beginner

### What is OOP?
Object-Oriented Programming is a paradigm based on the concept of "objects", which are instances of classes. Dart, as an object-oriented language, supports key OOP principles.

### Object, Class, Instance — what's the difference?

#### Object
An object is a real-world entity with both state (attributes/properties) and behavior (actions/methods). In programming, an object is an instance of a class.
```dart
class Person {
  String name;
  int age;
  Person(this.name, this.age);
  void sayHello() {
    print('Hello, my name is $name and I am $age years old.');
  }
}
void main() {
  Person person = Person('John', 25); // Creating an object
  person.sayHello();
}
```

#### Class
A class is a blueprint or template for creating objects. It defines the structure (attributes and methods) that objects of that class will have.

#### Instance
An instance is a specific occurrence of an object, created from a class. Each instance has its own set of data and can execute the methods defined by the class.

### Encapsulation
Encapsulation refers to bundling the data (attributes) and the methods that operate on that data into a single unit (class), and controlling access to the internal details.
- In Dart, use underscore (`_`) to denote private members
- Getters → Read only
- Setters → Write only

**Benefits**: Data Hiding, increases flexibility and reusability.
```dart
class Person {
  String _name; // Private variable
  Person(this._name);
  String get name => _name;
  set name(String newName) {
    if (newName.length > 0) {
      _name = newName;
    }
  }
  void introduceYourself() {
    print("Hello, I'm $_name.");
  }
}
```

### Inheritance
One class inherits the attributes and methods of another class. Dart supports single inheritance.
- **Child class** inherits from **parent class**
- **Benefits**: Code reusability, save time and reduce code boilerplate
```dart
class Animal {
  void makeSound() {
    print('Some generic sound');
  }
}
class Dog extends Animal {
  void bark() {
    print('Woof! Woof!');
  }
}
void main() {
  Dog myDog = Dog();
  myDog.makeSound();  // Output: Some generic sound
  myDog.bark();       // Output: Woof! Woof!
}
```

**Types of Inheritance:**
- Single Inheritance
- Multiple Inheritance (Dart doesn't support multiple inheritance but we can use mixins)
- Multilevel Inheritance

### Polymorphism
Multi-form — the concept that you can access objects of different types through the same interface.
- The ability of an object to take many forms
- Reduces Coupling, increases Reusability
```dart
abstract class Person {}
class Me extends Person {}
class Him extends Person {}

Person me = new Me();
Person him = new Him();
```

### Abstraction
The process of hiding the internal data and implementation details from the outer world. Used to describe things in simple terms and create a boundary between the application and client programs.
- **Abstract class**: Cannot be instantiated; can contain abstract and non-abstract methods.
- **Interface class**: Specifies a set of methods that a class must implement.
- **Benefits**: Reduces boilerplate code, increases reusability, maintainability, and readability.
```dart
abstract class Shape {
  void draw();
}
class Circle implements Shape {
  @override
  void draw() {
    print('Drawing a circle');
  }
}
```

### Method Overriding
Method overriding occurs when a subclass provides a specific implementation of a method defined in its superclass.
```dart
class Animal {
  void makeSound() => print('Generic sound');
}
class Dog extends Animal {
  @override
  void makeSound() => print('Woof!'); // Overridden
}
```

### The `super` keyword
`super` refers to the parent class instance. Used to call superclass constructors, invoke superclass methods, and access superclass properties.
```dart
class Animal {
  String name;
  Animal(this.name);
  void makeSound() => print('Sound');
}
class Dog extends Animal {
  String breed;
  Dog(String name, this.breed) : super(name); // Call super constructor
  @override
  void makeSound() {
    super.makeSound(); // Call super method
    print('Woof!');
  }
}
```

### Difference between extends, implements, and with?

#### extends
- Traditional inheritance
- Inherits implementation
- Can override methods
```dart
class Dog extends Animal {}
```

#### implements
- Must provide all method implementations
- No inherited implementation
```dart
class Robot implements Animal {
  @override
  void makeSound() => print('Beep');
}
```

#### with (mixins)
- Includes mixin's code
- Multiple mixins allowed
```dart
class Bird extends Animal with Flyable {}
```

### Override vs Overload in Dart
- Dart does **not** support method overloading.
- **Overriding**: Same method signature in superclass and subclass; subclass provides different implementation.
- **Overloading**: Not valid in Dart. Use optional/named parameters instead.

### The `this` keyword
Refers to the current instance of the class. Used to differentiate between instance variables and local variables when they have the same name.
```dart
class Rectangle {
  double width;
  double height;
  Rectangle(this.width, this.height);
  double calculateArea() {
    return this.width * this.height;
  }
}
```

### toString() Override
Overriding `toString()` allows providing a human-readable string representation of a class:
```dart
class BankAccount {
  double _balance = 0;
  BankAccount({double balance = 0}) : _balance = balance;
  double get balance => _balance;
  void deposit(double amount) { _balance += amount; }
  bool withdraw(double amount) {
    if (amount <= _balance) { _balance -= amount; return true; }
    return false;
  }
  @override
  String toString() => 'The balance is $_balance USD.';
}
void main() {
  var account = BankAccount(balance: 100);
  print(account); // The balance is 100.0 USD.
}
```

---

## 🟡 Mid Level

### What is a factory constructor and how to use it?
A factory constructor is a special type of constructor that doesn't always create a new instance of the class. It can return an existing instance or even a completely different type — useful for caching, singletons, or subtype creation.
```dart
class Logger {
  final String name;
  static final Map<String, Logger> _cache = {};

  Logger._internal(this.name);

  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name]!;
    } else {
      final logger = Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  void log(String message) {
    print('$name: $message');
  }
}
void main() {
  final logger1 = Logger('Logger1');
  final logger2 = Logger('Logger1');
  print(identical(logger1, logger2));  // true
}
```

### What is a mixin in Dart?
A mixin is a way to reuse a class's code in multiple class hierarchies without using inheritance.
```dart
mixin LoggerMixin {
  void log(String message) {
    print('Log: $message');
  }
}

class DataService with LoggerMixin {
  void fetchData() {
    log('Fetching data from the server');
  }
}
```
**Key points:**
- Use `mixin` keyword to define; apply with `with` keyword
- No constructor inheritance
- Avoids the Diamond Problem

### What is the Diamond Problem?
The Diamond Problem occurs in multiple inheritance when a class inherits from two classes that have a common ancestor, creating ambiguity about which implementation to use.
```
      A
     / \
    B   C
     \ /
      D
```
Dart avoids this by supporting only single inheritance while providing mixins for code reuse without the diamond problem.

### Types of Inheritance in Dart

#### Single Inheritance
Dart supports single inheritance using the `extends` keyword.

#### Mixin-based Inheritance
Dart provides mixins using the `with` keyword.

#### Interface-based Inheritance
Using abstract classes and `implements` for interface-like behavior.

### What is the difference between abstract class and interface?

#### Abstract Class (General)
- Can have instance variables (state)
- Can contain both abstract and concrete methods
- Cannot be instantiated on its own

#### Interface (General)
- Only defines method signatures without any implementations
- All methods are abstract by default
- Some languages support multiple interface inheritance

#### In Dart
- No explicit `interface` keyword (until Dart 3 class modifiers)
- Abstract classes can have both state and concrete methods
- Mixins provide interface-like behavior composition (no state in mixins)

```dart
abstract class Shape {
  double area(); // Abstract method
  void display() {
    print('Displaying the shape'); // Concrete method
  }
}
```

### How to achieve overloading in Dart?
Dart doesn't support traditional function overloading. Use named parameters and default values instead:
```dart
class Calculator {
  int add(int a, int b) => a + b;
  double addDouble(double a, double b) => a + b;
  int addThreeNumbers(int a, int b, int c) => a + b + c;
}
```

### What is composition in OOP?
Like Inheritance, Composition is a concept in OOP that models the relationship between two classes. Composition involves using other classes to build more complex classes without a parent/child relationship.
- More modular and flexible than inheritance
- "Favor composition over inheritance" is a common design principle

---

## 🔴 Senior

### Polymorphism: Compile-time vs Runtime

#### Compile-time Polymorphism (Method Overloading)
Dart supports different method names to simulate overloading. The method called depends on arguments at compile-time.

#### Runtime Polymorphism (Method Overriding)
Dart supports method overriding. The method called is determined at runtime based on the actual type of the object.
```dart
class Animal {
  void makeSound() => print("Generic Animal Sound");
}
class Dog extends Animal {
  @override
  void makeSound() => print("Woof! Woof!");
}
class Cat extends Animal {
  @override
  void makeSound() => print("Meow!");
}
void main() {
  Animal dog = Dog();
  Animal cat = Cat();
  dog.makeSound();  // Woof! Woof!
  cat.makeSound();  // Meow!
}
```

### SOLID Principles in OOP (overview)
- **S** — Single Responsibility: A class should have only one reason to change
- **O** — Open/Closed: Open for extension but closed for modification
- **L** — Liskov Substitution: Objects of a superclass should be replaceable with objects of its subclass
- **I** — Interface Segregation: No client should be forced to depend on methods it doesn't use
- **D** — Dependency Inversion: Abstractions should not depend on details; depend on abstractions

### When to use composition vs inheritance?
- **Inheritance** (is-a relationship): Use when the subclass truly IS a type of the parent. Dog IS-A Animal.
- **Composition** (has-a relationship): Use when a class USES another class. Car HAS-A Engine.
- Composition is more flexible — changing the composed object doesn't break the containing class.
- Inheritance creates tight coupling; changes to the superclass ripple through all subclasses.
- Prefer composition for code reuse; use inheritance when modeling true IS-A relationships.

### Abstract Class vs Interface: Trade-offs in Dart
- Use **abstract class** when you want to provide partial implementations and share state across subclasses.
- Use **`abstract interface`** (Dart 3) or plain **`abstract class` with `implements`** when you want to define a contract with no shared implementation.
- Interfaces are more flexible (a class can implement many but extend only one), while abstract classes allow a richer contract with shared code.
- In production code, repository patterns often use abstract classes as interfaces: the domain layer defines the abstract, the data layer provides the concrete implementation.
