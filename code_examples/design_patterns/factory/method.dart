
// The Factory Method Design Pattern is a creational design pattern that provides an interface for creating objects
// in a superclass but allows subclasses to alter the type of objects that will be created.
// Unlike the Simple Factory Pattern, the Factory Method pattern relies on inheritance and
// lets the subclasses decide which object to create.
//
// Benefits of the Factory Method Pattern
// Flexibility: Subclasses can provide their own implementation for object creation.
// Extensibility: New types of objects can be introduced without modifying existing code.
// Encapsulation: Creation logic is encapsulated in subclasses.


// Key Characteristics
// A base class defines an abstract method (the factory method) that subclasses must implement.
// Subclasses determine the specific type of object to instantiate.

// Example in Dart
// Let’s create an example where a Transport class defines a factory method to create vehicles like Car and Bike.

// Abstract product
abstract class Vehicle {
  void deliver();
}

// Concrete product: Car
class Car implements Vehicle {
  @override
  void deliver() {
    print("Delivering goods by Car");
  }
}

// Concrete product: Bike
class Bike implements Vehicle {
  @override
  void deliver() {
    print("Delivering goods by Bike");
  }
}

// Creator (abstract class)
abstract class Transport {
  // Factory method
  Vehicle createVehicle();

  // Common logic for delivery
  void startDelivery() {
    final vehicle = createVehicle();
    vehicle.deliver();
  }
}

// Concrete Creator: CarTransport
class CarTransport extends Transport {
  @override
  Vehicle createVehicle() {
    return Car();
  }
}

// Concrete Creator: BikeTransport
class BikeTransport extends Transport {
  @override
  Vehicle createVehicle() {
    return Bike();
  }
}

void main() {
  // Using the Factory Method Pattern
  Transport carTransport = CarTransport();
  carTransport.startDelivery(); // Output: Delivering goods by Car

  Transport bikeTransport = BikeTransport();
  bikeTransport.startDelivery(); // Output: Delivering goods by Bike
}

// Explanation
// Abstract Class (Transport):
//
// It defines the factory method createVehicle() that subclasses must implement.
// Provides a common method (startDelivery) that uses the product created by the factory method.
// Concrete Classes (CarTransport, BikeTransport):
//
// These classes override the createVehicle() method to specify which object to instantiate.
// Abstract Product (Vehicle):
//
// Defines a common interface for all products (deliver() in this case).
// Concrete Products (Car, Bike):
//
// Implement the Vehicle interface.
// Why Use Factory Method?
// It adheres to the Open/Closed Principle: You can add new vehicle types (e.g., Truck, Boat)
// by creating new Transport subclasses without changing the base code.
// It separates object creation from its usage, making code easier to maintain and test.