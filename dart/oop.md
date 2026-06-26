# Object-Oriented Programming (OOP) Basics in Dart

- Object-Oriented Programming (OOP) is a programming paradigm that revolves around the concept of "objects," which are instances of classes. Dart, as an object-oriented language, supports key OOP principles:

- In Dart, the terms "object," "class," and "instance" are fundamental concepts related to object-oriented programming. Let's define each term:

## Object.
- An object is a real-world entity with both state (attributes or properties) and behavior (actions or methods).

- In programming, an object is an instance of a class that represents a particular entity or concept.

- Objects encapsulate data and methods that operate on that data.
```dart
// Object representing a person
class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void sayHello() {
    print('Hello, my name is $name and I am $age years old.');
  }
}

void main() {
  // Creating an object (instance) of the Person class
  Person person = Person('John', 25);

  // Using the object's methods and properties
  person.sayHello();
}
```
## Class
- A class is a blueprint or template for creating objects.

- It defines the structure (attributes and methods) that objects of the class will have.

- Classes in Dart are used to model and represent entities or concepts in your program.

```dart
// Class representing a person
class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void sayHello() {
    print('Hello, my name is $name and I am $age years old.');
  }
}
```

## Instance.
- An instance is a specific occurrence of an object, created from a class.

- It represents a unique realization of the blueprint defined by the class.

- Each instance has its own set of data (properties) and can execute the methods defined by the class.

```dart
// Creating an instance of the Person class
Person person = Person('John', 25);

// Using the instance's methods and properties
person.sayHello();
```
#### In summary, a class serves as a blueprint for creating objects, and an instance is a specific realization of that blueprint. Objects encapsulate both data and behavior, providing a way to model and represent entities in your Dart program.

# Encapsulation.
- Encapsulation in Dart refers to the concept of bundling the data (attributes) and the methods (functions) that operate on the data into a single unit, often known as a class. It also involves controlling access to the internal details of an object, typically by using access modifiers like private, public, or protected..
- In Dart, you can use underscores (_) to denote private members (variables or methods) within a class.
```dart
class Person {
  String _name; // Private variable

  // Constructor
  Person(this._name);

  // Getter for the private variable
  String get name => _name;

  // Setter for the private variable
  set name(String newName) {
    if (newName.length > 0) {
      _name = newName;
    } else {
      print("Name cannot be empty.");
    }
  }

  // Public method
  void introduceYourself() {
    print("Hello, I'm $_name.");
  }
}

void main() {
  // Creating an instance of Person
  var person = Person("John");

  // Accessing the private variable using the getter
  print("Original name: ${person.name}");

  // Attempting to set an empty name (will not change the name)
  person.name = "";

  // Setting a new name using the setter
  person.name = "Doe";

  // Accessing the private variable again using the getter
  print("Updated name: ${person.name}");

  // Calling a public method
  person.introduceYourself();
}

```
- in this example, Person is a class encapsulating data (name and age) and a method (sayHello).

# Inheritance.
- Inheritance allows a class to inherit properties and behaviors from another class. Dart supports single inheritance.
- Inheritance is a fundamental concept in object-oriented programming that allows a class (subclass or derived class) to inherit properties and behaviors from another class (superclass or base class). Dart supports single inheritance, meaning a class can inherit from only one superclass.


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
  // Creating an instance of Dog
  Dog myDog = Dog();

  // Inherited method and subclass-specific method
  myDog.makeSound();  // Output: Some generic sound
  myDog.bark();       // Output: Woof! Woof!
}
```
- Here, Dog inherits from Animal, gaining the makeSound method and introducing a specific method bark.

```dart
// Base class (superclass)
class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  void eat() {
    print("$name is eating.");
  }

  void makeSound() {
    print("$name makes a generic animal sound.");
  }
}

// Subclass inheriting from Animal
class Dog extends Animal {
  String breed;

  Dog(String name, int age, this.breed) : super(name, age);

  // Overriding the makeSound method in the subclass
  @override
  void makeSound() {
    print("$name barks!");
  }

  void fetch() {
    print("$name is fetching.");
  }
}

void main() {
  // Creating an instance of the subclass
  var myDog = Dog("Buddy", 3, "Golden Retriever");

  // Accessing inherited properties and methods
  print("Name: ${myDog.name}, Age: ${myDog.age}, Breed: ${myDog.breed}");

  // Calling inherited methods
  myDog.eat();         // Calls Animal's eat method
  myDog.makeSound();   // Calls Dog's overridden makeSound method

  // Calling subclass-specific method
  myDog.fetch();
}
```
##### In this example:

- Animal is the base class with common properties (name, age) and methods (eat, makeSound).
- Dog is a subclass of Animal that inherits its properties and methods. It also has its own property (breed) and a specific implementation of the makeSound method (method overriding).

##### Key points to note:
- The super keyword is used to refer to the superclass and invoke its constructor.
- The @override annotation indicates that the method in the subclass is intended to override a method in the superclass.
- Inherited methods and properties can be accessed and extended in the subclass, and the subclass can provide its own implementations.

##### Inheritance promotes code reuse, extensibility, and the creation of hierarchies in your codebase. However, it's important to use it judiciously to avoid creating overly complex or tightly coupled class hierarchies.

# Polymorphism.
- Polymorphism allows objects to be treated as instances of their parent class, providing a consistent interface. Dart supports polymorphism through method overriding.
- Polymorphism in Dart allows objects of different types to be treated as objects of a common type. There are two types of polymorphism: compile-time (or static) polymorphism and runtime (or dynamic) polymorphism.
```dart
class Shape {
  void draw() {
    print('Drawing a shape');
  }
}

class Circle extends Shape {
  @override
  void draw() {
    print('Drawing a circle');
  }
}

void main() {
  // Creating instances of Shape and Circle
  Shape shape = Circle();  // Polymorphism

  // Calls overridden method based on the actual object type
  shape.draw();  // Output: Drawing a circle
}
```
- In this case, Circle overrides the draw method of its superclass Shape.

### Compile-time Polymorphism:
##### Method Overloading:
- Dart supports method overloading by providing multiple methods with the same name but different parameter lists. The method called depends on the number and types of arguments during compile-time.
```dart
class MathOperations {
  int add(int a, int b) => a + b;

  double add(double a, double b) => a + b;
}

void main() {
  var mathOps = MathOperations();
  print(mathOps.add(2, 3));       // Calls int add(int a, int b)
  print(mathOps.add(2.5, 3.5));   // Calls double add(double a, double b)
}
```
### Runtime Polymorphism:
##### Method Overriding:
- Dart supports method overriding, where a subclass provides a specific implementation of a method that is already defined in its superclass. The method called is determined at runtime.
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

  dog.makeSound();  // Calls Dog's makeSound method
  cat.makeSound();  // Calls Cat's makeSound method
}
```
- In this example, makeSound is overridden in both Dog and Cat classes, and the method called is based on the actual type of the object at runtime.
##### Polymorphism simplifies code and makes it more flexible. It allows you to work with objects of different classes through a common interface, promoting code reuse and flexibility in design.

# Abstraction.

- Abstraction involves simplifying complex systems by modeling classes based on essential properties and behaviors. Dart supports abstraction through interfaces and abstract classes.
- Abstraction in Dart is a concept that allows you to define the essential features of an object while hiding the unnecessary details. It helps in simplifying complex systems by modeling classes based on their essential characteristics and behaviors. In Dart, abstraction is often achieved through abstract classes and interfaces.


```dart
abstract class Shape {
  void draw();  // Abstract method
}

class Circle implements Shape {
  @override
  void draw() {
    print('Drawing a circle');
  }
}

void main() {
  // Creating an instance of Circle
  Circle circle = Circle();

  // Using the abstraction
  circle.draw();  // Output: Drawing a circle
}
```
- Here, Shape is an abstract class with an abstract method draw, and Circle implements this method.

```dart
// Abstract class representing a shape
abstract class Shape {
  // Abstract method for calculating area
  double calculateArea();
  
  // Concrete method for displaying the shape type
  void displayType() {
    print("This is a generic shape.");
  }
}

// Concrete class representing a Circle
class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double calculateArea() {
    return 3.14 * radius * radius;
  }

  @override
  void displayType() {
    print("This is a Circle.");
  }
}

// Concrete class representing a Rectangle
class Rectangle extends Shape {
  double length;
  double width;

  Rectangle(this.length, this.width);

  @override
  double calculateArea() {
    return length * width;
  }

  @override
  void displayType() {
    print("This is a Rectangle.");
  }
}

void main() {
  // Using abstraction to create objects
  Shape circle = Circle(5.0);
  Shape rectangle = Rectangle(4.0, 6.0);

  // Calling abstract method
  print("Circle Area: ${circle.calculateArea()}");

  // Calling concrete method
  circle.displayType();

  // Calling abstract method
  print("Rectangle Area: ${rectangle.calculateArea()}");

  // Calling concrete method
  rectangle.displayType();
}
```
##### In this example:
- Shape is an abstract class with an abstract method calculateArea() that needs to be implemented by its concrete subclasses.
- Circle and Rectangle are concrete classes that extend the Shape abstract class, providing their own implementations of calculateArea().

##### Abstraction allows you to create a common interface (Shape) for different shapes, and clients can use this interface without worrying about the specific implementation details of each shape. It helps in managing complexity and building more modular and maintainable code.

## what is a factory constructor and how to use it.

- A factory constructor in Dart is a special type of constructor that is used to create an instance of a class. The key difference between a regular constructor and a factory constructor is that a factory constructor is not required to return a new instance of the class. It can return an existing instance or even a completely different type.
```dart
class Logger {
  final String name;
  static final Map<String, Logger> _cache = {};

  // Private constructor
  Logger._internal(this.name);

  // Factory constructor
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
  // Using the factory constructor to create Logger instances
  final logger1 = Logger('Logger1');
  final logger2 = Logger('Logger2');

  // Both instances refer to the same object in the cache
  print(identical(logger1, logger2));  // Output: true

  // Using the log method
  logger1.log('This is a log message.');
  logger2.log('Another log message.');
}
```
#### In this example:

- The Logger class has a private constructor _internal and a factory constructor Logger.
- The factory constructor checks a cache (_cache) to see if an instance with the given name already exists. If it does, it returns the existing instance; otherwise, it creates a new instance and adds it to the cache.
- The main function demonstrates creating instances of the Logger class using the factory constructor and shows that both instances refer to the same object in the cache.
#### Factory constructors are useful in scenarios where you want to control the creation of objects, reuse existing instances, or implement caching mechanisms.

## what is mixin in dart.
- In Dart, a mixin is a way to reuse a class's code in multiple class hierarchies without using inheritance. Mixins allow a class to include the code and functionality of another class, without creating a strict parent-child relationship.
```dart
// Define a mixin named LoggerMixin
mixin LoggerMixin {
  void log(String message) {
    print('Log: $message');
  }
}

// Create a class that uses the LoggerMixin
class DataService with LoggerMixin {
  void fetchData() {
    // Perform data fetching
    log('Fetching data from the server');
    // ... additional logic
  }
}

void main() {
  // Create an instance of DataService
  final dataService = DataService();

  // Use the methods from both DataService and LoggerMixin
  dataService.fetchData();
  // Output: Log: Fetching data from the server
}
```
#### In this example:

- LoggerMixin is a mixin that defines a log method.
- The DataService class uses the with keyword to include the functionality of LoggerMixin. This means that DataService can now use the log method from LoggerMixin.

### Key points about mixins in Dart:
- Use of mixin Keyword: The mixin keyword is used to define a mixin. You can then apply the mixin to a class using the with keyword.

- No Constructor Inheritance: Unlike traditional inheritance, mixins do not inherit constructors. Mixins cannot be instantiated on their own.

- Code Reusability: Mixins promote code reusability by allowing you to include functionality from multiple sources without creating deep class hierarchies.

- Avoiding Diamond Problem: Dart's mixin system is designed to avoid the "Diamond Problem" associated with multiple inheritance, where a class inherits from two classes that have a common ancestor.

#### Using mixins, you can compose classes with shared functionality in a flexible and modular way, enhancing code organization and maintainability.

## what is diamond problem.
- The "Diamond Problem" is a term used in the context of object-oriented programming languages that support multiple inheritance. It refers to a specific issue that arises when a class inherits from two classes that have a common ancestor. The problem gets its name from the shape of the class inheritance diagram, which forms a diamond shape.
```
      A
     / \
    B   C
     \ /
      D
```
#### In this diagram:

- Class A is the common ancestor.
- Classes B and C both inherit from A.
- Class D inherits from both B and C.

##### Now, the Diamond Problem occurs when there is a conflict in the inherited methods or attributes between B and C, and it's unclear which version should be used in D. This ambiguity can lead to unexpected behavior and challenges in maintaining the code.
- For example, if both B and C define a method with the same name but different implementations, and D inherits from both, it's unclear which implementation D should inherit. This can result in confusion, unpredictable behavior, and difficulties in code maintenance.
- While the Diamond Problem is more apparent in languages with direct support for multiple inheritance, it's essential to consider and manage class hierarchies carefully to avoid unexpected issues in any object-oriented programming language.
#### Dart (Interfaces and Mixins): Dart, which supports single inheritance but includes mixins and interfaces, provides a way to compose classes with shared functionality without introducing the Diamond Problem. Mixins allow code reuse without the need for direct multiple inheritance.

## what is types of Inheritance in dart

### Single Inheritance:

- Dart supports single inheritance, which means a class can inherit from only one superclass.

- The extends keyword is used to denote single inheritance.
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
```
### Mixin-based Inheritance:
- Dart provides mixins, which are a way to reuse a class's code in multiple class hierarchies without using traditional inheritance.

- Mixins are applied using the with keyword.
```dart
mixin LoggerMixin {
  void log(String message) {
    print('Log: $message');
  }
}

class DataService with LoggerMixin {
  void fetchData() {
    // Additional logic
    log('Fetching data from the server');
  }
}
```
### Interface-based Inheritance:
- Dart does not have explicit support for interfaces, but you can achieve a form of interface-like behavior using abstract classes.

- Abstract classes can define a set of methods that subclasses must implement.

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
- In Dart, the focus is on single inheritance, but mixins and abstract classes provide mechanisms for achieving some level of code reuse and abstraction similar to multiple inheritance and interfaces in other languages. Dart's approach emphasizes composition and flexibility in class composition, allowing developers to create modular and maintainable code.

## difference between implement, extend, with in dart.

- In Dart, implement, extend, and with are keywords used for different purposes in class declarations. Here are the main differences between them:

### extend:

- Purpose: Used to establish an inheritance relationship between a subclass and a superclass.
- Syntax: class Subclass extends Superclass { ... }
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
```
- Explanation: Dog is a subclass that extends the Animal superclass, inheriting its properties and methods.

### with:

- Purpose: Used to apply mixins, allowing a class to include the code and functionality of another class without a strict parent-child relationship.
- Syntax: class MyClass with MyMixin { ... }

```dart
mixin LoggerMixin {
  void log(String message) {
    print('Log: $message');
  }
}

class DataService with LoggerMixin {
  void fetchData() {
    log('Fetching data from the server');
    // Additional logic
  }
}
```
- Explanation: DataService uses the with keyword to include the functionality of LoggerMixin without a traditional inheritance relationship.

### implement:

- Purpose: Used to declare that a class must provide implementations for a set of methods defined by an interface (often implemented using an abstract class).
- Syntax: class MyClass implements MyInterface { ... }

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
- Explanation: The Circle class implements the Shape interface, providing the required implementation for the draw method.

#### In summary, extend is used for traditional inheritance, with is used for mixins to include functionality, and implement is used to declare that a class adheres to an interface by providing implementations for its methods. Each keyword serves a distinct purpose in Dart's class declaration and composition.


## how to achieve overloading in dart.
- In Dart, function overloading, as traditionally seen in some other languages like Java or C++, is not directly supported. Dart promotes a more flexible approach using named parameters and default values to achieve similar functionality.

- Here's an example of how you can simulate function overloading in Dart:

```dart
class Calculator {
  int add(int a, int b) {
    return a + b;
  }

  double addDouble(double a, double b) {
    return a + b;
  }

  int addThreeNumbers(int a, int b, int c) {
    return a + b + c;
  }
}

void main() {
  Calculator calculator = Calculator();

  // Using the different versions of the add method
  print(calculator.add(2, 3));                 // Output: 5
  print(calculator.addDouble(2.5, 3.5));       // Output: 6.0
  print(calculator.addThreeNumbers(1, 2, 3));  // Output: 6
}
```
#### In this example:
- The Calculator class has three methods named add, but each has a different set of parameters.
- The first add method takes two integers, the second addDouble method takes two doubles, and the third addThreeNumbers method takes three integers.
- The usage of these methods demonstrates a form of function overloading.

#### This approach takes advantage of Dart's flexibility with named parameters and allows you to create methods with different parameter lists based on your requirements. While it's not true function overloading in the classical sense, it achieves a similar result. Additionally, Dart's strong type system and optional parameters provide a clear and concise way to work with different types and numbers of parameters.

## what is the difference between abstract class and interface in general and in dart .
- In general object-oriented programming (OOP) terminology, abstract classes and interfaces are both mechanisms for abstraction and defining contracts for classes. However, there are key differences in their usage and characteristics. Let's explore the general concepts and then see how they are implemented in Dart.

### Abstract Class (General):
#### Can Have State:

- An abstract class can have instance variables (state) in addition to methods.
#### May Have Concrete Methods:

- It can contain both abstract methods (without implementation) and concrete methods (with implementation).
#### Cannot Be Instantiated:

- An abstract class cannot be instantiated on its own. It serves as a blueprint for other classes.


### Interface (General):
#### No State:

- An interface, in many languages, only defines method signatures and does not contain any state (instance variables).
#### No Concrete Methods:

- It only includes method signatures without any implementations. All methods are abstract by default.
#### Multiple Inheritance:

- Some languages support multiple interface inheritance, allowing a class to implement multiple interfaces.

### Dart's Implementation:
- In Dart, there are no explicit interfaces, but Dart provides a way to achieve similar behavior through abstract classes and mixins.

#### Abstract Class in Dart:
##### Can Have State and Methods:

- Dart's abstract classes can have both instance variables and methods.
##### May Have Concrete Methods:

- It can contain concrete methods in addition to abstract methods.
##### Cannot Be Instantiated:

- Dart's abstract classes cannot be instantiated directly.

```dart
abstract class Shape {
  double area(); // Abstract method
  void display() {
    print('Displaying the shape');
  }
}
```
#### Interface-like Behavior in Dart:
##### Mixin for Behavior Composition:

- Dart uses mixins to achieve behavior composition similar to interfaces.
##### No State in Mixins:

- Mixins in Dart do not allow the inclusion of state (instance variables).

 ```dart
mixin Loggable {
  void log(String message) {
    print('Log: $message');
  }
}

class DataService with Loggable {
  // ...
}
```
- In Dart, while there are no explicit interfaces, you can use abstract classes and mixins to achieve similar goals. Dart's design philosophy focuses on providing flexibility and expressive ways to achieve abstraction without being constrained by rigid interface definitions.

## explain super keyword and its usage in dart
- In Dart, the super keyword is used to refer to the superclass (parent class) from within a subclass. It allows you to access members (fields or methods) of the superclass and invoke its constructor. The super keyword is particularly useful in scenarios where a subclass wants to extend or override behavior defined in its superclass.

##### Here are the main usages of the super keyword in Dart:

### Invoking Superclass Constructor:
- When a subclass is created, it can invoke the constructor of its superclass using the super keyword. This is necessary to initialize the inherited members from the superclass.
```dart
class Animal {
  String name;

  Animal(this.name);
}

class Dog extends Animal {
  String breed;

  Dog(String name, this.breed) : super(name);
}

void main() {
  var myDog = Dog("Buddy", "Golden Retriever");
  print("Name: ${myDog.name}, Breed: ${myDog.breed}");
}
```
- In this example, Dog calls the constructor of the Animal superclass using super(name) to initialize the name property inherited from Animal.

### Invoking Superclass Methods:
- The super keyword can be used to invoke methods from the superclass when a method with the same name is overridden in the subclass.
```dart
class Animal {
  void makeSound() {
    print("Generic animal sound");
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    super.makeSound(); // Invoking the makeSound method of the superclass
    print("Woof! Woof!");
  }
}

void main() {
  var myDog = Dog();
  myDog.makeSound();
}
```
- Here, Dog overrides the makeSound method from Animal and uses super.makeSound() to invoke the superclass's implementation before adding its own behavior.

### Accessing Superclass Members:
- The super keyword can be used to access fields or methods of the superclass directly from within the subclass.
```dart
class Animal {
  String name;

  Animal(this.name);

  void printName() {
    print("Animal's name: $name");
  }
}

class Dog extends Animal {
  String breed;

  Dog(String name, this.breed) : super(name);

  void printDetails() {
    super.printName(); // Accessing the printName method from the superclass
    print("Dog's breed: $breed");
  }
}

void main() {
  var myDog = Dog("Buddy", "Golden Retriever");
  myDog.printDetails();
}
```
- In this example, Dog uses super.printName() to access the printName method from the Animal superclass.

#### The super keyword is crucial for maintaining a connection between the subclass and the superclass, enabling proper initialization and interaction within the class hierarchy.

#### Abstraction.
- The process of hiding the internal data and implementation details from the outer world.
- Its used to describe things in simple terms.
- It's used to create a boundary between the application and the client programs.
##### Abstract class.
- Cannot be instantiated and can contain abstract and non-abstract methods.
##### Interface class.
- Specifies a set of methods that a class must implement.
##### Benefits.
- Reduces boilerplate code (Code sections repeated throughout a program or software).
- Increase reuseability, maintainability and readability.
 
<br/>

#### Inheritance.
- One class inherits the attributes and methods of another class.
- Child class from parent class.

##### Benefits.
- Code reusability, save time and reduce code boilerplate.

##### Types.
- Single Inheritence.
- Multiple Inheritence (Dart doesn't support multiple inheritence but we can use mixins to inherit multiple classes).
- Multilevel Inheritence.

<br/>

#### Polymorphism.
- Multi form => the concept that you can access objects of different types through the same interface.
- The ability of any data to be processed in more than one form.
- the ability of an object to take many forms.
- Allows to compensate any reference of the super class by any object of the sub class.
- Allows to perform a single action in different ways.
- Reduces Coupling.
- Increase Reusability.
```
abstract class Person{}
class Me extends Person{}
class Him extends Person{}

Person me=new Me();

Person him=new Him();
```
<br/>

#### Encapsulation.
- bundling of data and methods that operate on that data within single unit (class).
- The method of hiding the implementation details of a class from outside access and only exposing a public interface.
- It's a protective shield that prevent data from being accessed by code outside this shield.
- In dart we use _var instead of private keyword.
- Getters => Read only.
- Setters => Write only.

##### Benefits.
- Data Hiding, increases flexibility and reusability.

## what is composition in oop?
- Like Inheritance, Composition is a concept in object-oriented programming that models the relationship between two classes. Composition involves using other classes to build more complex classes and there is no parent/child relationship exists in this case. Basically, complex objects are composed of other objects.
