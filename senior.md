## 1.How can I count the instances created from a class in dart?
- In Dart, you can create a static counter to track the number of instances created from a class.
- Static variables are shared across all instances of the class and can be accessed without creating an instance.
```dart
class MyClass {
  // Static counter to track instances
  static int instanceCount = 0;

  // Constructor
  MyClass() {
    // Increment the counter every time a new instance is created
    instanceCount++;
  }

  // Static method to get the number of instances
  static int getInstanceCount() {
    return instanceCount;
  }
}

void main() {
  MyClass obj1 = MyClass(); // instanceCount becomes 1
  MyClass obj2 = MyClass(); // instanceCount becomes 2
  MyClass obj3 = MyClass(); // instanceCount becomes 3

  print('Number of instances created: ${MyClass.getInstanceCount()}');
}
```
