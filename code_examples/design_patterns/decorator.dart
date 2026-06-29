// The Decorator Design Pattern is a structural pattern used to add new functionality to an object dynamically,
// without modifying its structure or creating subclasses. This pattern is beneficial when you want to add features to
// certain instances of a class but not to others, or when you want to add or remove behavior dynamically at runtime.

// Open Closed Principle

// Component: The interface or abstract class that defines the structure for objects
// that can have responsibilities added to them.
abstract class Coffee {
  String getDescription();

  double getCost();
}

// Concrete Component: The base object to which new responsibilities can be added.
class SimpleCoffee implements Coffee {
  @override
  String getDescription() => "Simple coffee";

  @override
  double getCost() => 5.0;
}

// Decorator: Abstract class or interface that wraps a Component and provides additional behavior.
abstract class CoffeeDecorator implements Coffee {
  final Coffee coffee;

  CoffeeDecorator(this.coffee);

  @override
  String getDescription() => coffee.getDescription();

  @override
  double getCost() => coffee.getCost();
}

// Concrete Decorator: Implements the Decorator to add specific functionalities to the component.
class MilkDecorator extends CoffeeDecorator {
  MilkDecorator(super.coffee);

  @override
  String getDescription() => "${coffee.getDescription()}, milk";

  @override
  double getCost() => coffee.getCost() + 1.5;
}

class SugarDecorator extends CoffeeDecorator {
  SugarDecorator(super.coffee);

  @override
  String getDescription() => "${coffee.getDescription()}, sugar";

  @override
  double getCost() => coffee.getCost() + 0.5;
}

void main() {
  Coffee coffee = SimpleCoffee();
  print("${coffee.getDescription()} costs \$${coffee.getCost()}");

  coffee = MilkDecorator(coffee);
  print("${coffee.getDescription()} costs \$${coffee.getCost()}");

  coffee = SugarDecorator(coffee);
  print("${coffee.getDescription()} costs \$${coffee.getCost()}");
}
// Simple coffee costs $5.0
// Simple coffee, milk costs $6.5
// Simple coffee, milk, sugar costs $7.0

// The Decorator Design Pattern is a structural pattern used to add new functionality to an object dynamically,
// without modifying its structure or creating subclasses. This pattern is beneficial when you want to add features to
// certain instances of a class but not to others, or when you want to add or remove behavior dynamically at runtime.
//
// Key Concepts of the Decorator Pattern
// Component: The interface or abstract class that defines the structure for objects that can have responsibilities added to them.
// Concrete Component: The base object to which new responsibilities can be added.
// Decorator: Abstract class or interface that wraps a Component and provides additional behavior.
// Concrete Decorator: Implements the Decorator to add specific functionalities to the component.

// Example in Dart
// Let’s create a simple example in Dart where a Coffee class represents a coffee beverage. We will add decorators
// to dynamically add different toppings, like Milk and Sugar.
//
// Step 1: Define the Component Interface

// abstract class Coffee {
//   String getDescription();
//   double getCost();
// }
// Step 2: Create a Concrete Component

// class SimpleCoffee implements Coffee {
//   @override
//   String getDescription() => "Simple coffee";
//
//   @override
//   double getCost() => 5.0;
// }
// Step 3: Create the Decorator
// abstract class CoffeeDecorator implements Coffee {
//   final Coffee coffee;
//
//   CoffeeDecorator(this.coffee);
//
//   @override
//   String getDescription() => coffee.getDescription();
//
//   @override
//   double getCost() => coffee.getCost();
// }
// Step 4: Create Concrete Decorators

// class MilkDecorator extends CoffeeDecorator {
//   MilkDecorator(Coffee coffee) : super(coffee);
//
//   @override
//   String getDescription() => "${coffee.getDescription()}, milk";
//
//   @override
//   double getCost() => coffee.getCost() + 1.5;
// }
//
// class SugarDecorator extends CoffeeDecorator {
//   SugarDecorator(Coffee coffee) : super(coffee);
//
//   @override
//   String getDescription() => "${coffee.getDescription()}, sugar";
//
//   @override
//   double getCost() => coffee.getCost() + 0.5;
// }
// Step 5: Using the Decorators
// Now, we can create a SimpleCoffee object and decorate it with MilkDecorator and SugarDecorator to add milk and sugar.

// void main() {
//   Coffee coffee = SimpleCoffee();
//   print("${coffee.getDescription()} costs \$${coffee.getCost()}");
//
//   coffee = MilkDecorator(coffee);
//   print("${coffee.getDescription()} costs \$${coffee.getCost()}");
//
//   coffee = SugarDecorator(coffee);
//   print("${coffee.getDescription()} costs \$${coffee.getCost()}");
// }
// Output
// Simple coffee costs $5.0
// Simple coffee, milk costs $6.5
// Simple coffee, milk, sugar costs $7.0
// Explanation
// SimpleCoffee is the base component with a cost of $5.
// MilkDecorator and SugarDecorator add functionality to the SimpleCoffee dynamically by wrapping it and modifying its description
// and cost.
// The Decorator pattern provides a flexible alternative to subclassing by combining objects with decorators,
// allowing you to add responsibilities at runtime in a clean, maintainable way.
