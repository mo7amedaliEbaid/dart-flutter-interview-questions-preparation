class Animal {
  String name;

  Animal(this.name);

  void makeSound() {
    print('Generic animal sound $name');
  }
}

class Dog extends Animal {
  int age;

  Dog(String name, this.age) : super(name); // Call superclass constructor

  @override // This annotation indicates we're overriding the method
  void makeSound() {
    super.makeSound(); // Call superclass makeSound method
    print('Woof!');
  }
}

void main() {
  Dog myDog = Dog('Fido', 3);
  myDog.makeSound(); // Output: Generic animal sound Woof!
  print(myDog.name);
}
// This example demonstrates how the super keyword can be used to:
//
// Call the constructor of the parent class.
// Access and call methods defined in the parent class.
// Achieve code reusability and avoid redundancy.