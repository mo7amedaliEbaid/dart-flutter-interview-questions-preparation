# Flutter & Dart Interview Questions - Beginner Level
---

## Dart Fundamentals

### 1. What is Dart?
Dart is a client-optimized programming language developed by Google, designed for building mobile, desktop, server, and web applications. It's the primary language used for Flutter development.

### 2. Difference between `const` and `final`?

**`final`:**
- Allows only a single assignment
- Must have an initializer
- Once initialized, the variable cannot be reassigned
- Can be determined at runtime
- Example:
```dart
final DateTime dateTime = DateTime.now(); // ✅ Valid
```

**`const`:**
- Compile-time constant
- The entire deep state must be determinable at compile time
- The value is frozen and immutable while the program is running
- Example:
```dart
const int value = 42; // ✅ Valid
const DateTime dateTime = DateTime.now(); // ❌ Error - runtime value
```

### 3. Is Dart Single-Threaded?
Yes, Dart is primarily a single-threaded language. It uses:
- **Event Loop**: Handles execution of multiple chunks of code over time
- **Isolates**: Independent units of execution for parallel processing
- **Asynchronous Programming**: `Future` and `Stream` for non-blocking operations

The event loop allows multiple operations in a non-blocking way without explicit multi-threading.

### 4. What is a `typedef`?
A `typedef` (type alias) allows you to provide a new name for an existing data type. It doesn't create a new type, just provides an alias.

**Example:**
```dart
typedef IntList = List<int>;
IntList numbers = [1, 2, 3];

// Function type alias
typedef String GreetFunction(String name);

String greetSomeone(GreetFunction greeter, String name) {
  return greeter(name);
}
```

### 5. Private Members in Dart
Dart doesn't have a `private` keyword. Instead, use an underscore (`_`) prefix:
- `_variableName` - private variable
- `_methodName()` - private method

Private members are accessible only within their respective library (file).

### 6. What is Immutability?
Immutability means objects cannot be mutated (altered) after initialization.

**Immutable types in Dart:**
- `String`, `int`, `double`, `bool` - cannot be mutated
- A `String` variable is a reference to string data in memory
- Non-final string variables can be reassigned to point to different strings

**Benefits:**
- Thread-safe (no code can alter content)
- Guaranteed same reference regardless of accessing code

### 7. Difference between `var` and `dynamic`?

**`var`:**
- Type is inferred at compile time
- Cannot change the TYPE of the variable
- Can change the VALUE of the variable

**`dynamic`:**
- Can change both TYPE and VALUE
- Bypasses static type checking
- Use sparingly as it reduces type safety

**Example:**
```dart
var name = "John"; // Type: String
// name = 123; // ❌ Error - cannot change type

dynamic value = "Hello";
value = 123; // ✅ Valid - can change type
```

### 8. What is a Singleton?
A singleton pattern ensures a class has only one instance and provides a global access point.

**Example:**
```dart
class Singleton {
  static final Singleton _instance = Singleton._internal();
  
  factory Singleton() {
    return _instance;
  }
  
  Singleton._internal();
}

void main() {
  var s1 = Singleton();
  var s2 = Singleton();
  print(identical(s1, s2)); // true
  print(s1 == s2); // true
}
```

### 9. Difference between Function and Method?

**Function:**
- Top-level function declared outside a class
- Independent, doesn't need an object

**Method:**
- Function tied to an instance of a class
- Has implicit reference to `this`
- Called using the object's name

### 10. What is an Enum?
An enum (enumerated type) represents a fixed set of constant values.

**Example:**
```dart
enum OperatingSystem { macOS, windows, linux }

void main() {
  final favSystem = OperatingSystem.linux;
  if (favSystem == OperatingSystem.linux) {
    print('Linux is the best!');
  }
}
```

**Characteristics:**
- All enums automatically extend the `Enum` class
- They are sealed (cannot be subclassed, implemented, or instantiated)
- Makes code readable and reusable

### 11. Difference between `.map()` and `.forEach()`?

**`.map()`:**
- Returns a new iterable/collection
- Transforms each element
- Doesn't modify the original collection

**`.forEach()`:**
- Returns nothing (`void`)
- Iterates over elements for side effects
- Doesn't return a new collection

**Example:**
```dart
List<int> numbers = [1, 2, 3, 4, 5];

// map() returns a new list
var doubled = numbers.map((x) => x * 2).toList(); // [2, 4, 6, 8, 10]

// forEach() returns nothing
numbers.forEach((x) {
  if (x == 3) print("Found 3!");
});
```

### 12. Spread Operator (`...`) and Null-aware Spread (`...?`)

**Spread Operator (`...`):**
- Inserts multiple elements into a collection
- Example:
```dart
List<int> list1 = [1, 2, 3];
List<int> list2 = [4, 5, ...list1]; // [4, 5, 1, 2, 3]
```

**Null-aware Spread (`...?`):**
- Performs spread only if the operand is non-null
- Example:
```dart
List<int>? numbers = [1, 2, 3];
List<int> moreNumbers = [4, 5, ...?numbers]; // [4, 5, 1, 2, 3]

List<int>? nullList = null;
List<int> safe = [1, 2, ...?nullList]; // [1, 2] - no error
```

### 13. Difference between `.then()` and `.whenComplete()`?

**`.then()`:**
- Executes when Future completes successfully
- Receives the result value

**`.whenComplete()`:**
- Executes regardless of success or failure
- Runs after `.then()` or `.catchError()`
- Doesn't receive the result or error

**Example:**
```dart
someFuture()
  .then((value) {
    print('Success: $value');
  })
  .catchError((error) {
    print('Error: $error');
  })
  .whenComplete(() {
    print('Always runs');
  });
```

### 14. What is a Mixin?
A mixin is a way to reuse code in multiple class hierarchies without using inheritance.

**Example:**
```dart
mixin LoggerMixin {
  void log(String message) {
    print('Log: $message');
  }
}

class DataService with LoggerMixin {
  void fetchData() {
    log('Fetching data');
  }
}
```

**Key Points:**
- Use `mixin` keyword to define
- Apply with `with` keyword
- No constructor inheritance
- Avoids the diamond problem

### 15. What is a Stream?
A stream represents an asynchronous sequence of data events.

**Characteristics:**
- Series of asynchronous occurrences
- Like a pipe with data flowing through it
- Can be listened to and transformed

**Types:**
- **Single Subscription Stream**: Events are parts of a larger whole, must be delivered in order
- **Broadcast Stream**: Individual messages that can be handled one at a time, multiple listeners allowed

### 16. What is `this` keyword?
`this` refers to the current instance of the class.

**Uses:**
- Remove ambiguity between class attributes and parameters
- Access current class instance
- Invoke current class constructors or methods

**Example:**
```dart
class Person {
  String name;
  
  Person(this.name); // Constructor parameter
  
  void updateName(String name) {
    this.name = name; // 'this' clarifies instance variable
  }
}
```

### 17. Static Keyword
`static` is used for class-level variables and methods.

**Characteristics:**
- Belongs to the class, not instances
- Same for every instance
- Cannot be overridden
- Accessed via class name: `ClassName.staticMember`

**Example:**
```dart
class Counter {
  static int count = 0;
  
  Counter() {
    count++;
  }
  
  static int getCount() => count;
}

void main() {
  Counter c1 = Counter();
  Counter c2 = Counter();
  print(Counter.getCount()); // 2
}
```

### 18. Records (Dart 3.0+)
Records are anonymous, immutable, aggregate types.

**Characteristics:**
- Fixed-sized, heterogeneous, and typed
- Can be stored in variables, nested, passed to functions
- Stored in data structures

**Example:**
```dart
var record = ('first', a: 2, b: true, 'last');
print(record.$1); // 'first'
print(record.a);  // 2
print(record.b);  // true
print(record.$2); // 'last'
```

### 19. Extensions
Extensions add functionality to existing libraries without modifying them.

**Example:**
```dart
extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }
}

void main() {
  String number = "42";
  int value = number.parseInt(); // Using extension
}
```

### 20. Named Constructors
Named constructors provide different ways to create instances of a class.

**Example:**
```dart
class Image {
  String source;
  
  Image(this.source);
  
  Image.network(String url) : source = url;
  Image.asset(String path) : source = path;
}

// Usage
var networkImage = Image.network('https://example.com/image.jpg');
var assetImage = Image.asset('assets/image.png');
```

### 21. Factory Constructor
A factory constructor doesn't always create a new instance. It might return:
- A cached instance
- An instance of a subtype
- An instance initialized with logic

**Example:**
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

---

## Flutter Basics

### 22. What is Flutter?
Flutter is a cross-platform UI toolkit that allows code reuse across iOS, Android, web, and desktop. It compiles to native machine code for high performance.

**Key Features:**
- Hot reload for fast development
- Single codebase for multiple platforms
- Direct compilation to native code
- Rich widget library

### 23. Flutter Architecture Overview

**Three Main Layers:**

1. **Embedder**: Bridge between Flutter and host platform (Android/iOS)
   - Manages communication with OS
   - Handles rendering surfaces, accessibility, input

2. **Engine** (C++): Core runtime
   - Handles rendering, input, threading
   - Executes Dart code
   - Manages communication with Embedder

3. **Framework** (Dart): UI and app logic
   - Widget system
   - Material and Cupertino libraries
   - Animation, painting, gestures

### 24. What is a Widget?
A widget is a blueprint or recipe describing part of the UI.

**Characteristics:**
- Immutable description of part of user interface
- Widgets compose to create complete UI
- Central class hierarchy in Flutter framework
- Can be inflated into elements

### 25. Difference between StatelessWidget and StatefulWidget?

**StatelessWidget:**
- Immutable, no mutable state
- Used for UI elements that don't change over time
- `build()` method called once (unless parent rebuilds)

**StatefulWidget:**
- Can hold mutable state
- Rebuilds dynamically when state changes
- Used for interactive UI elements
- Has a separate `State` object

**Example:**
```dart
// StatelessWidget
class MyText extends StatelessWidget {
  final String text;
  
  const MyText(this.text);
  
  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}

// StatefulWidget
class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => setState(() => count++),
      child: Text('Count: $count'),
    );
  }
}
```

### 26. What is BuildContext?
`BuildContext` is a handle to the location of a widget in the widget tree.

**Uses:**
- Access theme, locale, screen size
- Navigate between screens
- Access inherited widgets (like `MediaQuery`, `Theme`)
- Find parent widgets

### 27. What is a Key?
A key preserves state when widgets move around in the widget tree.

**Types:**
- **`Key`**: Base type for all keys
- **`ValueKey<T>`**: Uses actual value as identifier
- **`ObjectKey`**: Uses object identity
- **`GlobalKey`**: Globally unique, can access widget state

**When to use:**
- ListViews with dynamic lists
- StatefulWidgets that need state preservation
- Animations and page transitions

**Example:**
```dart
ListView.builder(
  itemBuilder: (context, index) {
    return ListTile(
      key: ValueKey(items[index].id), // Preserves state
      title: Text(items[index].name),
    );
  },
)
```

### 28. What is `runApp()`?
`runApp()` inflates the given widget and attaches it to the screen.

**Characteristics:**
- Entry point for Flutter apps
- Widget is forced to fill entire screen
- Creates `WidgetsFlutterBinding`
- Calling again replaces previous root widget

**Example:**
```dart
void main() {
  runApp(MyApp());
}
```

### 29. What is `MaterialApp`?
`MaterialApp` is a convenience widget wrapping commonly required Material Design widgets.

**Provides:**
- Material Design theming
- Navigation
- Localization
- Text direction
- App-level configuration

**Example:**
```dart
MaterialApp(
  title: 'My App',
  theme: ThemeData(primarySwatch: Colors.blue),
  home: HomeScreen(),
)
```

### 30. What is `Scaffold`?
`Scaffold` implements the basic Material Design visual layout structure.

**Provides:**
- AppBar
- Body
- FloatingActionButton
- Drawer
- BottomNavigationBar
- SnackBar

**Example:**
```dart
Scaffold(
  appBar: AppBar(title: Text('My App')),
  body: Center(child: Text('Hello')),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
)
```

### 31. `WidgetsFlutterBinding.ensureInitialized()`
Ensures the binding is initialized before calling `runApp()`.

**When to use:**
- Before async operations in `main()`
- When using plugins that need platform channels
- Before `Firebase.initializeApp()`

**Example:**
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
```

---

## Widgets

### 32. Difference between Row and Column?

**Row:**
- Arranges children horizontally
- Main axis: horizontal
- Cross axis: vertical

**Column:**
- Arranges children vertically
- Main axis: vertical
- Cross axis: horizontal

**Example:**
```dart
Row(
  children: [
    Text('A'),
    Text('B'),
    Text('C'),
  ],
)

Column(
  children: [
    Text('A'),
    Text('B'),
    Text('C'),
  ],
)
```

### 33. Difference between Expanded and Flexible?

**Expanded:**
- Takes all available space
- Shorthand for `Flexible(flex: 1)`
- Forces child to match parent size

**Flexible:**
- Takes only needed space (by default)
- More fine-grained control
- Can use `fit` parameter to change behavior

**Example:**
```dart
Row(
  children: [
    Expanded(child: Container(color: Colors.red)), // Takes all space
    Flexible(child: Container(color: Colors.blue)), // Takes needed space
  ],
)
```

### 34. Difference between Container and Padding?

**Container:**
- Versatile box model widget
- Can apply padding, margin, decoration, constraints
- Can contain other widgets

**Padding:**
- Simple wrapper that adds padding
- Only handles padding, nothing else

**Example:**
```dart
// Container - can do more
Container(
  padding: EdgeInsets.all(16),
  margin: EdgeInsets.all(8),
  decoration: BoxDecoration(color: Colors.blue),
  child: Text('Hello'),
)

// Padding - just padding
Padding(
  padding: EdgeInsets.all(16),
  child: Text('Hello'),
)
```

### 35. Difference between ListView and GridView?

**ListView:**
- Displays scrollable list of widgets
- Single column (or row if horizontal)
- Use for linear lists

**GridView:**
- Displays 2D array of widgets
- Multiple columns/rows
- Use for grid layouts

**Example:**
```dart
// ListView
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) => ListTile(title: Text(items[index])),
)

// GridView
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
  itemCount: items.length,
  itemBuilder: (context, index) => Card(child: Text(items[index])),
)
```

### 36. ListView vs ListView.builder?

**ListView:**
- Creates all items at once
- Good for small lists
- All items visible on screen

**ListView.builder:**
- Creates items on-demand (lazy loading)
- Only renders visible items
- Best practice for long lists
- More efficient memory usage

**Example:**
```dart
// ListView - creates all at once
ListView(
  children: items.map((item) => ListTile(title: Text(item))).toList(),
)

// ListView.builder - creates on demand
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) => ListTile(title: Text(items[index])),
)
```

### 37. Difference between Stack and Column?

**Column:**
- Arranges children vertically
- Children don't overlap
- Each child takes its own space

**Stack:**
- Positions children on top of each other
- Last child is topmost
- Children can overlap
- Used for layered layouts

**Example:**
```dart
// Column
Column(
  children: [
    Text('Top'),
    Text('Middle'),
    Text('Bottom'),
  ],
)

// Stack
Stack(
  children: [
    Container(color: Colors.blue, width: 200, height: 200),
    Positioned(
      top: 50,
      left: 50,
      child: Container(color: Colors.red, width: 100, height: 100),
    ),
  ],
)
```

### 38. Difference between Visibility, Opacity, and OffStage?

**Visibility:**
- Shows/hides widgets
- When `visible: false`, child is replaced with zero-sized box
- Still in widget tree but takes no space

**Opacity:**
- Makes child transparent
- Range: 0.0 (invisible) to 1.0 (opaque)
- Child still takes space and is interactive

**OffStage:**
- Lays out child but doesn't render it
- Takes no space on screen
- Used to measure widget dimensions without showing

**Example:**
```dart
// Visibility
Visibility(
  visible: isVisible,
  child: Text('Hello'),
)

// Opacity
Opacity(
  opacity: isVisible ? 1.0 : 0.0,
  child: Text('Hello'),
)

// OffStage
Offstage(
  offstage: !isVisible,
  child: Text('Hello'),
)
```

### 39. Difference between TextField and TextFormField?

**TextField:**
- Simple text input widget
- No form integration
- Use for simple user input

**TextFormField:**
- Integrates with `Form` widget
- Has validation, save, reset capabilities
- Use when you need form validation

**Example:**
```dart
// TextField
TextField(
  decoration: InputDecoration(labelText: 'Name'),
)

// TextFormField
TextFormField(
  decoration: InputDecoration(labelText: 'Email'),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email';
    }
    return null;
  },
)
```

### 40. Difference between InkWell and GestureDetector?

**InkWell:**
- Provides Material ripple effect
- Specifically for taps
- Material Design compliant

**GestureDetector:**
- More generic gesture handler
- Can handle taps, swipes, drags, etc.
- No ripple effect
- More control options

**Example:**
```dart
// InkWell - with ripple
InkWell(
  onTap: () {},
  child: Container(child: Text('Tap me')),
)

// GestureDetector - more gestures
GestureDetector(
  onTap: () {},
  onLongPress: () {},
  onDoubleTap: () {},
  child: Text('Tap me'),
)
```

### 41. Difference between Image.asset and AssetImage?

**Image.asset:**
- Creates a widget directly
- Can be used in widget tree
- Convenient constructor

**AssetImage:**
- Image provider (not a widget)
- Provides image from path
- Used with `Image` widget

**Example:**
```dart
// Image.asset - widget
Image.asset('assets/image.png')

// AssetImage - provider
Image(image: AssetImage('assets/image.png'))
```

### 42. Difference between FutureBuilder and StreamBuilder?

**FutureBuilder:**
- Builds widget once when Future completes
- Single value/error
- Use for one-time async operations

**StreamBuilder:**
- Builds widget in response to stream events
- Multiple values over time
- Use for continuous data streams

**Example:**
```dart
// FutureBuilder
FutureBuilder<String>(
  future: fetchData(),
  builder: (context, snapshot) {
    if (snapshot.hasData) return Text(snapshot.data!);
    return CircularProgressIndicator();
  },
)

// StreamBuilder
StreamBuilder<int>(
  stream: counterStream(),
  builder: (context, snapshot) {
    return Text('Count: ${snapshot.data ?? 0}');
  },
)
```

### 43. Difference between Align and Positioned?

**Align:**
- Positions child using fractional values (0.0 to 1.0)
- Relative positioning within parent
- Works in any widget

**Positioned:**
- Absolute positioning with explicit coordinates
- Only works inside Stack
- Uses top, bottom, left, right, width, height

**Example:**
```dart
// Align
Align(
  alignment: Alignment.center,
  child: Text('Centered'),
)

// Positioned (inside Stack)
Stack(
  children: [
    Positioned(
      top: 50,
      left: 50,
      child: Text('Positioned'),
    ),
  ],
)
```

### 44. What is Spacer?
`Spacer` creates an adjustable empty space in a Flex container (Row/Column).

**Characteristics:**
- Takes up available space
- Used to tune spacing between widgets
- More flexible than `SizedBox`

**Example:**
```dart
Row(
  children: [
    Text('Left'),
    Spacer(), // Takes all available space
    Text('Right'),
  ],
)
```

### 45. Difference between ClipRect, ClipRRect, and ClipOval?

**ClipRect:**
- Clips child to rectangle shape
- Sharp corners

**ClipRRect:**
- Clips child to rounded rectangle
- Can create circles if width == height

**ClipOval:**
- Clips child to oval/circle shape
- Uses widget's bounding box

**Example:**
```dart
// ClipRect
ClipRect(
  child: Image.network('url'),
)

// ClipRRect
ClipRRect(
  borderRadius: BorderRadius.circular(20),
  child: Image.network('url'),
)

// ClipOval
ClipOval(
  child: Image.network('url'),
)
```

---

## Object-Oriented Programming

### 46. What is OOP?
Object-Oriented Programming is a paradigm based on objects containing data (attributes) and code (methods).

### 47. Four Pillars of OOP

#### Abstraction
- Hiding internal details, showing only essential features
- Achieved through abstract classes and interfaces
- Reduces complexity, increases reusability

**Example:**
```dart
abstract class Shape {
  double area(); // Abstract method
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);
  
  @override
  double area() => 3.14 * radius * radius;
}
```

#### Inheritance
- One class inherits attributes and methods from another
- Promotes code reusability
- Dart supports single inheritance (use mixins for multiple)

**Example:**
```dart
class Animal {
  void makeSound() => print('Some sound');
}

class Dog extends Animal {
  @override
  void makeSound() => print('Woof!');
}
```

#### Polymorphism
- Ability of objects to take many forms
- Same interface, different implementations
- Reduces coupling, increases reusability

**Example:**
```dart
abstract class Person {}
class Me extends Person {}
class Him extends Person {}

Person person1 = Me(); // Polymorphism
Person person2 = Him();
```

#### Encapsulation
- Bundling data and methods within a class
- Hiding implementation details
- In Dart: use `_` prefix for private members

**Example:**
```dart
class BankAccount {
  double _balance = 0; // Private
  
  double get balance => _balance; // Getter
  
  void deposit(double amount) {
    _balance += amount;
  }
}
```

### 48. Difference between `extends`, `implements`, and `with`?

**`extends`:**
- Traditional inheritance
- Inherits implementation
- Can override methods

**`implements`:**
- Implements interface
- Must provide all method implementations
- No inherited implementation

**`with`:**
- Applies mixin
- Includes mixin's code
- Multiple mixins allowed

**Example:**
```dart
class Animal {
  void makeSound() => print('Sound');
}

mixin Flyable {
  void fly() => print('Flying');
}

class Bird extends Animal with Flyable {
  // Inherits makeSound, includes fly
}

class Robot implements Animal {
  @override
  void makeSound() => print('Beep'); // Must implement
}
```

### 49. What is Method Overriding?
Method overriding occurs when a subclass provides a specific implementation of a method defined in the superclass.

**Example:**
```dart
class Animal {
  void makeSound() => print('Generic sound');
}

class Dog extends Animal {
  @override
  void makeSound() => print('Woof!'); // Overridden
}
```

**Note:** Dart doesn't support method overloading (same method name, different parameters).

### 50. What is the `super` keyword?
`super` refers to the parent class instance.

**Uses:**
- Call superclass constructor
- Invoke superclass methods
- Access superclass properties

**Example:**
```dart
class Animal {
  String name;
  Animal(this.name);
  
  void makeSound() => print('Sound');
}

class Dog extends Animal {
  String breed;
  
  Dog(String name, this.breed) : super(name); // Call super constructor
  
  @override
  void makeSound() {
    super.makeSound(); // Call super method
    print('Woof!');
  }
}
```

---

## Basic Concepts

### 51. What is an API?
**API** (Application Programming Interface) is a software intermediary that allows two applications to communicate.

**Characteristics:**
- Defines how software components interact
- Allows products/services to communicate without knowing implementation
- Common way to extract and share data

### 52. What is an SDK?
**SDK** (Software Development Kit) is a comprehensive set of development tools.

**Includes:**
- Libraries
- Debugger
- Emulator
- Documentation
- Code samples

### 53. What is JSON?
**JSON** (JavaScript Object Notation) is a standard text-based format for representing structured data.

**Characteristics:**
- Based on JavaScript object syntax
- Commonly used for transmitting data in web applications
- Human-readable and machine-parseable

**Example:**
```json
{
  "name": "John",
  "age": 30,
  "city": "New York"
}
```

### 54. HTTP Methods: GET, POST, PUT, PATCH, DELETE

**GET:**
- Retrieve data from server
- Read-only, no side effects
- Data in URL parameters

**POST:**
- Send data to server
- Creates new resource
- Data in request body

**PUT:**
- Update entire resource
- Replaces existing resource
- Complete resource in body

**PATCH:**
- Partial update
- Only sends changes
- More efficient than PUT

**DELETE:**
- Delete resource
- Specified by URI

### 55. What is Dependency Injection?
Design pattern implementing inversion of control.

**Characteristics:**
- Dependencies provided from outside
- Not created inside the class
- Promotes testability and flexibility

**Example:**
```dart
class UserService {
  final ApiClient _apiClient;
  
  UserService(this._apiClient); // Dependency injected
}
```

### 56. What is a Callback?
A callback is a function passed as an argument to another function.

**Example:**
```dart
void processData(String data, void Function(String) callback) {
  String processed = data.toUpperCase();
  callback(processed); // Call the callback
}

void main() {
  processData('hello', (result) {
    print(result); // 'HELLO'
  });
}
```

### 57. What is an Anonymous Function?
A function without a name, also called a lambda or closure.

**Example:**
```dart
List<int> numbers = [1, 2, 3];
numbers.forEach((item) { // Anonymous function
  print(item);
});
```

### 58. What is an Iterable?
An iterable is a collection of elements that can be accessed sequentially.

**Types:**
- **List**: Read elements by index
- **Set**: Contains unique elements
- **Map**: Read elements using keys

**Example:**
```dart
Iterable<int> numbers = [1, 2, 3];
for (var number in numbers) {
  print(number);
}
```

---

