// The Abstract Factory Design Pattern is a creational design pattern that provides
// an interface for creating families of related or dependent objects without specifying
// their concrete classes. This pattern is particularly useful when a system needs to
// support multiple product families and the product families need to work together.


// Key Features
// Factory of Factories: It defines a factory interface for creating families of related objects.
// Ensures Compatibility: Products created by one factory are designed to work well together.
// Encapsulation: The client code relies on the abstract factory interface and doesn't need to know the specific implementation.


// Example Use Case
// Imagine you are building a UI toolkit for two platforms: Material Design (Android) and Cupertino Design (iOS).
// Each platform has its own components,
// such as buttons and switches. The abstract factory ensures that the right components are created for a specific platform.

// Dart Implementation
// Step 1: Define Abstract Product Interfaces
// Define interfaces for the product families (e.g., Button and Switch).

// Abstract product: Button
abstract class Button {
  void render();
}

// Abstract product: Switch
abstract class Switch {
  void toggle();
}


// Step 2: Implement Concrete Products
// Create concrete implementations for each product family (e.g., Material and Cupertino).


// Concrete product: MaterialButton
class MaterialButton implements Button {
  @override
  void render() {
    print("Rendering a Material Button");
  }
}

// Concrete product: CupertinoButton
class CupertinoButton implements Button {
  @override
  void render() {
    print("Rendering a Cupertino Button");
  }
}

// Concrete product: MaterialSwitch
class MaterialSwitch implements Switch {
  @override
  void toggle() {
    print("Toggling a Material Switch");
  }
}

// Concrete product: CupertinoSwitch
class CupertinoSwitch implements Switch {
  @override
  void toggle() {
    print("Toggling a Cupertino Switch");
  }
}


// Step 3: Define the Abstract Factory
// Define an interface for creating families of related objects.
//

// Abstract factory
abstract class WidgetFactory {
  Button createButton();
  Switch createSwitch();
}



// Step 4: Implement Concrete Factories
// Create concrete factories for Material and Cupertino design systems.


// Concrete factory: MaterialWidgetFactory
class MaterialWidgetFactory implements WidgetFactory {
  @override
  Button createButton() {
    return MaterialButton();
  }

  @override
  Switch createSwitch() {
    return MaterialSwitch();
  }
}

// Concrete factory: CupertinoWidgetFactory
class CupertinoWidgetFactory implements WidgetFactory {
  @override
  Button createButton() {
    return CupertinoButton();
  }

  @override
  Switch createSwitch() {
    return CupertinoSwitch();
  }
}


// Step 5: Client Code
// The client code interacts with the factory and uses the products, unaware of their specific implementation.



void main() {
  // Select a widget factory based on the platform
  WidgetFactory widgetFactory;

  // Example: Switch between Material and Cupertino factories
  String platform = "ios"; // Try changing this to "android"
  if (platform == "android") {
    widgetFactory = MaterialWidgetFactory();
  } else if (platform == "ios") {
    widgetFactory = CupertinoWidgetFactory();
  } else {
    throw Exception("Unknown platform: $platform");
  }

  // Use the factory to create widgets
  Button button = widgetFactory.createButton();
  Switch switchWidget = widgetFactory.createSwitch();

  // Interact with the widgets
  button.render(); // Output depends on the platform
  switchWidget.toggle(); // Output depends on the platform
}
// Explanation
// Abstract Products (Button, Switch):
//
// Define common interfaces for product families.
// Concrete Products (MaterialButton, CupertinoButton, etc.):
//
// Provide specific implementations for each family.
// Abstract Factory (WidgetFactory):
//
// Declares methods to create objects belonging to the same family.
// Concrete Factories (MaterialWidgetFactory, CupertinoWidgetFactory):
//
// Implement the methods to create specific products.
// Client Code:
//
// Interacts with the abstract factory, ensuring independence from concrete implementations.


// Why Use Abstract Factory?
// Scalability: Easily add new product families (e.g., "Windows Design") by creating new factories and products.
// Encapsulation: The client code doesn't need to know which platform it is working with.
// Consistency: Ensures that products from the same family (e.g., Material or Cupertino) work together seamlessly.
// This pattern is widely used in frameworks and libraries to handle platform-specific implementations,
// like Flutter's widgets for iOS and Android.