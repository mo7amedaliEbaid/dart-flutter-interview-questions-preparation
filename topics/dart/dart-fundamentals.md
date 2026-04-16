# Dart Fundamentals

---

## 🟢 Beginner

### What is a typedef?
In Dart, `typedef` (type alias) allows you to provide a new name for an existing data type. It doesn't create a new type, just provides an alias.
```dart
typedef IntList = List<int>;
IntList il = [1, 2, 3];

// Function type alias
typedef String GreetFunction(String name);

String greetSomeone(GreetFunction greeter, String name) {
  return greeter(name);
}

String englishGreeting(String name) => 'Hello, $name!';
String spanishGreeting(String name) => '¡Hola, $name!';

void main() {
  print(greetSomeone(englishGreeting, 'John'));
  print(greetSomeone(spanishGreeting, 'Juan'));
}
```

### Difference between const and final?

#### final
- Allows only a single assignment
- Must have an initializer
- Once initialized, cannot be reassigned
- Can be determined at runtime
```dart
final DateTime datetime = DateTime.now(); // ✅ Valid
```

#### const
- Compile-time constant
- The entire deep state must be determinable at compile time
- Value is frozen and immutable while the program is running
```dart
const int value = 42; // ✅ Valid
const DateTime datetime = DateTime.now(); // ❌ Error - runtime value
```

### Difference between var and dynamic?

#### var
- Type is inferred at compile time
- Cannot change the TYPE of the variable
- Can change the VALUE of the variable

#### dynamic
- Can change both TYPE and VALUE
- Bypasses static type checking
- Use sparingly as it reduces type safety

```dart
var name = "John"; // Type: String
// name = 123; // ❌ Error - cannot change type

dynamic value = "Hello";
value = 123; // ✅ Valid - can change type
```

### What is the use of private keyword in Dart?
Dart doesn't have a `private` keyword. Instead, use an underscore (`_`) prefix:
- `_variableName` — private variable
- `_methodName()` — private method

Private members are accessible only within their respective library (file). It is used for encapsulating and securing your code.

### What is the meaning of immutable?
Immutable constructs cannot be mutated (altered) after they have been initialized. Strings, numbers, and booleans can't be mutated.

In Dart, "immutable" refers to objects whose state cannot be changed after they are created. The `final` keyword is often used to create variables that, once assigned, cannot be reassigned to a different object.

Advantages of immutable data:
- Inherently thread safe — no code can alter its content, so it's guaranteed to be the same reference regardless of what code is accessing it.

### What is an Enum?
An enum (enumerated type) represents a fixed set of constant values. In Dart, `Enum` is a special kind of class used to represent a fixed number of constant values.
```dart
enum OperatingSystem { macOS, windows, linux }

void main() {
  final favsystem = OperatingSystem.linux;
  if (favsystem == OperatingSystem.linux) {
    print('Linux!');
  }
}
```
- All enums automatically extend the `Enum` class
- They are sealed (cannot be subclassed, implemented, or instantiated)
- Makes code readable and reusable

### Difference between function and method?

#### Function
- Top-level function declared outside a class or inline function
- Doesn't need an object; is independent

#### Method
- Tied to an instance of a class and has an implicit reference to `this`
- Is a function linked to an object
- Called via the object's name

### What is a mixin class in Dart?
A way of defining code that can be reused in multiple class hierarchies.
```dart
mixin Mixin {}

class Me extends Person with Mixin {}
```

### What is a stream in Dart?
A stream provides an asynchronous sequence of data. A stream can be thought of as a pipe and the water inside it is the data.

#### Types of Streams:
- **Single Subscription Stream**: Contains a sequence of events that are parts of a larger whole. Events need to be delivered in the correct order. Such a stream can only be listened to once.
- **Broadcast Stream**: Intended for individual messages that can be handled one at a time (e.g., mouse events in a browser). More than one listener can listen at the same time.

### What is Records in Dart?
Records are an anonymous, immutable, aggregate type. Like other collection types, they let you bundle multiple objects into a single object. Unlike other collection types, records are fixed-sized, heterogeneous, and typed.
```dart
var record = ('first', a: 2, b: true, 'last');
```

### What is the difference between .map() and .forEach()?
- `.map()` returns a new iterable/collection; `.forEach()` returns nothing (`void`).
- `forEach` iterates over each element for side effects and won't return.
```dart
List<int> numbers = [1, 2, 3, 4, 5];
// map() returns a new list
var doubled = numbers.map((x) => x * 2).toList(); // [2, 4, 6, 8, 10]
// forEach() returns nothing
numbers.forEach((x) {
  if (x == 3) print("Found 3!");
});
```

### Spread Operator and Null-aware Spread Operator
- **Spread Operator (`...`)**: Inserts multiple elements into a collection.
- **Null-aware Spread (`...?`)**: Performs spread only if the operand is non-null.
```dart
List<int> list1 = [1, 2, 3];
List<int> list2 = [4, 5, ...list1]; // [4, 5, 1, 2, 3]

List<int>? nullList = null;
List<int> safe = [1, 2, ...?nullList]; // [1, 2] - no error
```

### Difference between .then() and .whenComplete()?
- `.then()` executes when Future completes successfully (receives the result value).
- `.whenComplete()` executes regardless of success or failure (runs after `.then()` or `.catchError()`).
```dart
someFuture()
  .then((value) {
    print('Future finished successfully');
  })
  .catchError((error) {
    print('Future finished with error');
  })
  .whenComplete(() {
    print('Always runs');
  });
```

### Static keyword in Dart
`static` is used for class-level variables and methods.
- Belongs to the class, not instances
- Same for every instance
- Cannot be overridden
- Accessed via class name: `ClassName.staticMember`

### Extensions in Dart
Extensions add functionality to existing libraries without modifying them.
```dart
extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }
}
void main() {
  String number = "42";
  int value = number.parseInt();
}
```

### Named Constructor
Named constructors provide different ways to create instances of a class.
```dart
// Image.asset(), Image.network()
factory CurrentUser.fromSnapshot(DocumentSnapshot snap) {
  return CurrentUser(
    id: snap.id,
    email: snap['email'],
    userName: snap['userName'],
  );
}
```

### Factory constructor
`factory` keyword is used when implementing a constructor that doesn't always create a new instance. It might return an existing instance or a subtype.
```dart
class Logger {
  final String name;
  static final Map<String, Logger> _cache = {};

  Logger._internal(this.name);

  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name]!;
    }
    final logger = Logger._internal(name);
    _cache[name] = logger;
    return logger;
  }
}
```

### What is generic programming?
A style of computer programming in which algorithms are written in terms of types to be specified later, then instantiated when needed for specific types provided.
```dart
class Box<T> {
  T value;
  Box(this.value);
}

Box<int> intBox = Box(42);
Box<String> stringBox = Box('Hello');
```

### Iterables
An iterable is a collection of elements that can be accessed sequentially. `Iterable` is an abstract class.
- **List**: Read elements by their index
- **Set**: Contains unique elements
- **Map**: Read elements using key

### Types of Parameters in Dart
- **Positional Parameters**: Passed based on their position in the function call.
- **Named Parameters**: Specified by name, enclosed in curly braces `{}`.
- **Default Values**: Both positional and named parameters can have default values.
- **Required Parameters**: Mark with `required` keyword (null safety).
- **Optional Positional Parameters**: Use `[]` syntax.
- **Function Parameters**: Pass functions as parameters.
```dart
void printDetails(String name, {int age = 30}) {
  print('Name: $name, Age: $age');
}

void performOperation(int x, int y, int Function(int, int) operation) {
  print('Result: ${operation(x, y)}');
}
```

### What is a callback and anonymous function?
- **Callback**: A function passed as an argument into another function.
- **Anonymous function**: A function without a name (lambda/closure).
```dart
// Callback
typedef VoidCallback = void Function();

// Anonymous function
list.forEach((item) {});
```

### Difference between Override and Overload in programming?
- Dart does **not** support overloading.
- **Overriding**: When the method signature is the same in the superclass and subclass; the subclass provides a different implementation.
- **Overloading**: Two or more methods with the same name but different parameters (not valid in Dart).

### What is `this` keyword?
Used to remove ambiguity when class attributes and parameters have the same name. Represents an implicit object pointing to the current class instance.

### Dart – Runes
In Dart, strings are a sequence of UTF-16 code units. A rune is an integer used to represent any Unicode code point.
```dart
String gfg = 'GeeksforGeeks';
print(gfg.codeUnits); // [71, 101, 101, 107, 115, ...]
```

### Difference between where() and takeWhile()?
- **`where()`**: Filters all elements satisfying a condition throughout the entire iterable.
- **`takeWhile()`**: Takes elements from the beginning until the condition is no longer satisfied; stops at the first failing element.
```dart
var numbers = [1, 2, 3, 4, 5, 2];
print(numbers.where((n) => n < 4).toList());      // [1, 2, 3, 2]
print(numbers.takeWhile((n) => n < 4).toList());  // [1, 2, 3]
```

### Types of Scope in Dart
Dart uses **lexical scoping** — scope is determined by location in source code.
- **Global Scope**: Declared outside any function or class.
- **Local Scope**: Declared within a function or block.
- **Class Scope**: Members of a class, accessible within the class.
- **Block Scope**: Declared in a block (`if`, `for`, `while`).

### The Range of int and double in Dart
- **int**: -2^63 to 2^63 - 1 on 64-bit systems.
- **double**: IEEE 754 double-precision; approximately ±4.9 × 10^-324 to ±1.8 × 10^308.

### What is the difference between test API and production API?
- **Test API (Sandbox)**: Designed for testing/development; uses dummy/simulated data; more permissive access controls.
- **Production API**: Live version used by real users; handles real, sensitive data; strict access controls and authentication.

---

## 🟡 Mid Level

### Does Dart use a single thread and why?
Yes, Dart is primarily a single-threaded language. It executes one thing at a time with the support of isolates, event loop, and asynchronous code. The event loop handles execution of multiple chunks over time, allowing multiple operations in a non-blocking way.

Dart does provide support for asynchronous programming through `Future` and `Stream` classes using the single-threaded event loop model, so I/O operations don't block the main thread.

### What is an Isolate in Dart?
An isolate in Dart is an independent unit of execution that runs concurrently in a separate memory heap.
- Allows for parallel processing and better utilization of multi-core systems
- Isolates don't share memory; they communicate by passing messages (usually immutable data) using ports
- Each isolate has its own event queue and event loop
- Use `SendPort` and `ReceivePort` for communication
```dart
import 'dart:isolate';

void main() async {
  ReceivePort mainReceivePort = ReceivePort();
  Isolate.spawn(isolateFunction, mainReceivePort.sendPort);

  mainReceivePort.listen((message) {
    print('Received message from isolate: $message');
  });
}

void isolateFunction(SendPort sendPort) {
  ReceivePort isolateReceivePort = ReceivePort();
  sendPort.send(isolateReceivePort.sendPort);
  sendPort.send('Hello from the spawned isolate!');
}
```

### What is asynchronous programming?
Allows tasks to be executed independently and concurrently without waiting for each other to complete. It enables non-blocking operations, allowing a program to continue processing other tasks while waiting for certain operations to finish.

### Difference between .then() and .whenCompleted() with Future/async-await?
```dart
// Async/await approach
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Data';
}

// Stream
Stream<int> countStream() async* {
  for (int i = 0; i < 5; i++) {
    yield i;
    await Future.delayed(Duration(seconds: 1));
  }
}
```

### Types of Streams in Dart
```dart
// Single subscription
Stream<String> singleStream() async* {
  yield 'event 1';
  yield 'event 2';
}

// Broadcast
StreamController<String> broadcastController = StreamController.broadcast();
broadcastController.stream.listen((event) { /* listener 1 */ });
broadcastController.stream.listen((event) { /* listener 2 */ });
```

### JIT vs AOT in Flutter

#### Just-In-Time (JIT)
- Used **during development** for faster development cycle
- Enables **hot reload**: see code changes instantly without a full restart
- Run with: `flutter run` (default in debug mode)

#### Ahead-Of-Time (AOT)
- Used for **production builds**
- Compiles Dart code to native machine code ahead of time
- Results in smaller, more optimized binary and better startup performance
- Build with: `flutter build <platform> --release`

**Summary**: JIT for development speed; AOT for production performance.

### Debug, Profile, and Release Modes in Flutter

#### Debug Mode
- For development. Enables hot reload, extensive debugging tools, and additional checks.
- Run: `flutter run` (default)

#### Profile Mode
- Middle ground between Debug and Release
- Retains debugging info for performance profiling while including some optimizations
- Run: `flutter run --profile`

#### Release Mode
- For production deployment. Aggressive optimizations, stripped-down binary, best performance
- Build: `flutter build <platform> --release`

### count(), custom(), builder(), extent() in GridView / SliverGrid
- **GridView.count()**: Fixed `crossAxisCount` (columns).
- **GridView.builder()**: Lazily builds items on-demand.
- **GridView.custom()**: Custom delegate for layout control.
- **GridView.extent()**: Fixed `maxCrossAxisExtent` for each item.

### Composition in Programming
Composition is a design principle where a class is built from other classes/objects rather than inheriting from them.

- **Object Composition (OOP)**: Creating instances of other classes within a class to reuse functionality without parent/child relationships.
- **Function Composition (Functional Programming)**: Combining multiple functions where each takes the output of the previous as input.

Both forms promote code reuse, maintainability, and flexibility.

### Runes and Unicode
Runes represent Unicode code points as integers.
```dart
String text = 'Hello';
print(text.codeUnits); // [72, 101, 108, 108, 111]
print(text.runes);     // (72, 101, 108, 108, 111)

// Emoji
String emoji = '😀';
print(emoji.runes); // (128512)
```

---

## 🔴 Senior

### What is a singleton?
Singleton pattern ensures that a class has only one instance and provides a global point of access to it.
```dart
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

### Flutter Architecture Overview

Flutter is a cross-platform UI toolkit designed to allow code reuse across operating systems (iOS, Android, web, desktop) while allowing applications to interface directly with underlying platform services.

#### Architectural Layers

**Embedder**: Acts as a bridge between Flutter and the host platform, coordinating with the OS for rendering surfaces, accessibility, and input. Written in platform-appropriate language (Java/C++ for Android, Objective-C/C++ for iOS/macOS, C++ for Windows/Linux).

**Engine** (C++): Core runtime that handles rendering (via Impeller, Flutter's default renderer since Flutter 3.10 on iOS and 3.16 on Android), input handling, threading, Dart runtime, and compile toolchain.

**Framework** (Dart): Comprehensive set of pre-designed widgets and abstractions following a reactive and declarative paradigm. Includes animation, painting, gestures, rendering layer, widgets layer, Material and Cupertino libraries.

### JIT vs AOT: When and Why?
- **JIT** is essential during development: hot reload works because the Dart VM can recompile and re-inject code without restarting the app. This allows stateful hot reload.
- **AOT** is critical for production: the compiled native code has no startup overhead from JIT compilation, smaller binary (no VM overhead), and is typically 2-3x faster for cold starts compared to JIT.
- The tradeoff: JIT sacrifices runtime performance for developer velocity; AOT sacrifices developer velocity for end-user performance.

### What is CI/CD and DevOps?

#### Continuous Integration (CI)
- Code changes from multiple contributors are automatically integrated into a shared repository multiple times a day
- Involves automated builds, testing, and code analysis
- Goal: detect integration issues early

#### Continuous Deployment (CD)
- Extends CI by automatically deploying code changes to production after passing automated tests
- Reduces manual intervention and accelerates the release cycle

#### DevOps
- Cultural and organizational approach improving collaboration between software development (Dev) and IT operations (Ops)
- Emphasizes automation, CI/CD, infrastructure as code (IaC), monitoring, and feedback loops
- Goal: shorter development lifecycle, frequent releases, higher quality

### Development and Production branches in Git
- **Development branch** (`develop` or `dev`): Where ongoing work takes place. Feature branches are created from and merged into this branch.
- **Production branch** (`main` or `master`): Stable branch representing the latest release.

Typical workflow: Create feature branches from `develop` → merge back → merge `develop` into `main` for a stable release.

### Gradle in Android Development
Gradle is a build automation tool used in Android development. It manages project dependencies, build processes, and task automation.
- Uses Groovy (or Kotlin DSL) for build scripts
- Uses a directed acyclic graph (DAG) to determine task execution order
- Supports multi-project builds, highly scalable

### What is the iOS build tool?
**Xcode** is the primary build tool for iOS. Apple's Xcode build system manages tools that transform your code and resource files into a finished app.

### How is Flutter considered native?
Flutter achieves native-like performance because:
- Uses compiled programming language (Dart) that compiles to native machine code
- Doesn't rely on web views (unlike Cordova or React Native)
- Apps run directly on the device without an intermediary web-based rendering engine
- The rendering pipeline (via Impeller/Skia) draws directly to the GPU without going through platform UI components

### Difference between sealed class and enum?

#### Sealed Class
- Allows defining a **hierarchy of types** (subtypes)
- Subtypes can have **properties, methods, and constructors**
- Can be instantiated via subtype constructors
- Used with **pattern matching** for expressive control flow
- Subtypes can only be defined within the same library

#### Enum
- Represents a **fixed set of named constants**
- No subtype hierarchy
- Simpler; best for predefined constant values

**Summary**: Sealed classes are for type hierarchies with behavior; enums are for simple fixed sets of named values.
