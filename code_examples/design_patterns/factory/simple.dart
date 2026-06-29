// The Simple Factory Design Pattern is a creational design pattern
// used to create objects without exposing the instantiation logic to the client.
// It provides a single method, often referred to as a factory method,
// to create and return instances of different types of objects based on input parameters.


// Benefits of the Simple Factory Pattern
// Encapsulation: The object creation logic is encapsulated in one place, making it easy to manage.
// Flexibility: The client code doesn't need to worry about the exact class of the object being created.
// Code Reuse: Reuse the factory logic across the application.

// Example in Dart
// Let’s say we are building a factory that creates different types of shapes (e.g., Circle, Square, and Rectangle).
// Here's how the Simple Factory Pattern can be implemented:


// Abstract class for Shape
abstract class Shape {
  void draw();
}

// Concrete class: Circle
class Circle implements Shape {
  @override
  void draw() {
    print("Drawing a Circle");
  }
}

// Concrete class: Square
class Square implements Shape {
  @override
  void draw() {
    print("Drawing a Square");
  }
}

// Concrete class: Rectangle
class Rectangle implements Shape {
  @override
  void draw() {
    print("Drawing a Rectangle");
  }
}

// Simple Factory class
class ShapeFactory {
  // Factory method to create Shape objects
  static Shape createShape(String shapeType) {
    switch (shapeType.toLowerCase()) {
      case 'circle':
        return Circle();
      case 'square':
        return Square();
      case 'rectangle':
        return Rectangle();
      default:
        throw ArgumentError("Invalid shape type: $shapeType");
    }
  }
}

void main() {
  // Using the factory to create shapes
  Shape circle = ShapeFactory.createShape('circle');
  Shape square = ShapeFactory.createShape('square');
  Shape rectangle = ShapeFactory.createShape('rectangle');

  // Drawing shapes
  circle.draw();     // Output: Drawing a Circle
  square.draw();     // Output: Drawing a Square
  rectangle.draw();  // Output: Drawing a Rectangle
}
// Key Points
// ShapeFactory acts as the factory that hides the creation logic.
// The createShape method in the factory decides which object to create based on the input.
// The client (e.g., main) interacts with the factory and doesn't need to know about the concrete classes (Circle, Square, etc.).
// This approach makes it easier to add new shapes in the future without modifying the client code.
// For example, you can add a Triangle class and extend the factory method with a new case.