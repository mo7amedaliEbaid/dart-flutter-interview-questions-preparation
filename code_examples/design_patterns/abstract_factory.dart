// 3. Abstract Factory
// Used when you want to create families of related objects.

abstract class Button {
  void render();
}

abstract class Checkbox {
  void render();
}

class WindowsButton implements Button {
  @override
  void render() {
    print('Rendering Windows Button');
  }
}

class MacOSButton implements Button {
  @override
  void render() {
    print('Rendering MacOS Button');
  }
}

class WindowsCheckbox implements Checkbox {
  @override
  void render() {
    print('Rendering Windows Checkbox');
  }
}

class MacOSCheckbox implements Checkbox {
  @override
  void render() {
    print('Rendering MacOS Checkbox');
  }
}

abstract class GUIFactory {
  Button createButton();
  Checkbox createCheckbox();
}

class WindowsFactory implements GUIFactory {
  @override
  Button createButton() {
    return WindowsButton();
  }

  @override
  Checkbox createCheckbox() {
    return WindowsCheckbox();
  }
}

class MacOSFactory implements GUIFactory {
  @override
  Button createButton() {
    return MacOSButton();
  }

  @override
  Checkbox createCheckbox() {
    return MacOSCheckbox();
  }
}

void main() {
  GUIFactory factory = WindowsFactory();
  Button button = factory.createButton();
  Checkbox checkbox = factory.createCheckbox();

  button.render();  // Output: Rendering Windows Button
  checkbox.render(); // Output: Rendering Windows Checkbox
}
// Summary of Types:
// Type	Purpose	Example
// Simple Factory	Centralized object creation with a single method.	AnimalFactory.getAnimal()
// Factory Method	Subclasses decide which object to create, ensuring polymorphism.	DogFactory.createAnimal()
// Abstract Factory	Provides an interface to create families of related or dependent objects without concretes.	WindowsFactory.createButton
// Benefits of Factory Pattern:
// Encapsulation: Hides object creation details.
// Flexibility: Easy to introduce new types.
// Decoupling: Reduces coupling between client and concrete classes.