# Dart-Flutter-interview-questions

### 1- What is a typedef ?
- In Dart , typedef or (function types alias) helps to define pointer to excute code within memory.
- typedef can be used as a pointer that references a function.
- It is a type alias allows you to provide a new name for an existing data type into your program.
- Type alias don't create a new types , they simply provide a new name to an existing type.
```
typedef IntList=List<int>;
IntList il=[1,2,3];
```
### 2- Difference between const and final ?

#### final.
- allows only a single assignment.
- It must have an initializer.
- once it has been initialized with a value, the variable cannot be reassigned.
- A final variable may rely on runtime excution of code to determine its state, but it must occur during initialization.
- :thumbsup:
    ```
  final Datetime datetime=Datetime.now();
  ```
#### const.
- are compile time const.
- A Constant's entire deep state must be determinable at compile time.
- the const value will be frozen and immutable while the program is running.
- :thumbsdown:
    ```
    const Datetime datetime=Datetime.now();     xxxxxx
    ```

### 3- Does Dart Single threaded language and why ?
   - Yes, Dart is a single threaded language .
   - Because it use only one thread.
   - It excutes one thing at a time with the support of isolates , event loop and asynchronous code.
   - The event loop handles the excution of multiple chunks of your program over time.
   - the event loop is what allows multiple operations in a non-blocking way.
   
### 4- What is the use of private keyword in dart ?
   - Private keyword doesn't exist in dart.
   - We use underScore before the variable name instead of private.
   - It is used for encapsulating and securing your code, It makes it accessible only within their respective classes or libraries.

### 5- What is the meaning of immutable ?
- immutable constructs that cannot be mutated (altered) after they have been initialized.
- Strings, numbers and boolean can't be mutated.
- a String variable doesn't contain data itself, it is a reference to the string data's location in memory.
- non final string variables can be reassigned.

#### advantages of using immutable data.
- it's inherently thread safe, because since no code can alter its content , it is guaranted to the same reference no matter what code is accessing it.

### 6- What is a singleton ?
- Singleton pattern ensures that a class has only one instance and also provides a global point of access to it.
```
class Singleton {
  static final Singleton _singleton = Singleton._internal();

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();
}

main() {
  var s1 = Singleton();
  var s2 = Singleton();
  print(identical(s1, s2));  // true
  print(s1 == s2);           // true
}
```
### 7- What is isolate in dart ?
- An isolate in Dart is an independent unit of execution that runs concurrently in a separate memory heap.
- It allows for parallel processing and better utilization of multi-core systems.
- Isolates don't share memory; they communicate with each other by passing messages (usually immutable data) using ports.
- This approach helps to avoid common issues related to shared-memory concurrency, like race conditions or deadlocks.
- Each isolate has its own event queue and event loop, which processes incoming messages and ensures that only one message is handled at a time, preserving sequential consistency within the isolate.

### 8- Difference between function and method ?
#### function.
- is a top-level function which is declared outside of a class or an inline function.
- doesn't need an object as independent.

#### method.
- is tied to an instance of a class and has an implicit reference to  this.
- is a function which is linked with an object
- we call it by the object's name.

### 9- What is a sealed class ?
- Can't be extended outside of its library "file".

### 10- What is an inhereted widget in flutter ?
- Base class of widgets that efficiently propaget information down the tree ( Scaffold, Theme ).
