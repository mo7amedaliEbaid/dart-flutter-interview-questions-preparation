class Person {
  String? name;
  int? age;

  Person( this.name,  age); // Using this in the constructor

  void printInfo() {
    print("Name: $name, Age: $age");
  }
}

void main() {
  Person person = Person("Alice", 30);
  person.printInfo(); // Output: Name: Alice, Age: null
}
