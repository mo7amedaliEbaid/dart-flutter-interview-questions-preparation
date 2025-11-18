### 1. Difference between `const` and `final`?
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
### 2. What is a `typedef`?
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
### 3. Private Members in Dart
Dart doesn't have a `private` keyword. Instead, use an underscore (`_`) prefix:
- `_variableName` - private variable
- `_methodName()` - private method
Private members are accessible only within their respective library (file).
### 4. Difference between `var` and `dynamic`?
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
### 5. What is an Enum?
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

### 6. Difference between `.map()` and `.forEach()`?
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
### 7. Spread Operator (`...`) and Null-aware Spread (`...?`)
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
### 8. Difference between `.then()` and `.whenComplete()`?
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
### 9. What is a Mixin?
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
### 10. What is a Stream?
A stream represents an asynchronous sequence of data events.
**Characteristics:**
- Series of asynchronous occurrences
- Like a pipe with data flowing through it
- Can be listened to and transformed
**Types:**
- **Single Subscription Stream**: Events are parts of a larger whole, must be delivered in order
- **Broadcast Stream**: Individual messages that can be handled one at a time, multiple listeners allowed
### 11. Static Keyword
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
### 12. Extensions
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
### 13. Named Constructors
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
### 14. Factory Constructor
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
### 15. What is Flutter?
Flutter is a cross-platform UI toolkit that allows code reuse across iOS, Android, web, and desktop. It compiles to native machine code for high performance.
**Key Features:**
- Hot reload for fast development
- Single codebase for multiple platforms
- Direct compilation to native code
- Rich widget library
### 16. Flutter Architecture Overview
**Three Main Layers:**
1. **Embedder**: Bridge between Flutter and host platform (Android/iOS)
   - Manages communication with OS (Operating System)
   - Handles rendering surfaces, accessibility, input
2. **Engine** (C++): Core runtime
   - Handles rendering, input, threading
   - Executes Dart code
   - Manages communication with Embedder
3. **Framework** (Dart): UI and app logic
   - Widget system
   - Material and Cupertino libraries
   - Animation, painting, gestures
### 17. What is a Widget?
A widget is a blueprint or recipe describing part of the UI.
**Characteristics:**
- Immutable (غير قابل للتغيير) description of part of user interface
- Widgets compose to create complete UI
- Central class hierarchy in Flutter framework
- Can be inflated into elements
### 18. Difference between StatelessWidget and StatefulWidget?
**StatelessWidget:**
- Immutable, no mutable state
- Used for UI elements that don't change over time
- `build()` method called once (unless parent rebuilds)
**StatefulWidget:**
- Can hold mutable (متغيرة) state
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
### 19. What is BuildContext?
`BuildContext` is a handle to the location of a widget in the widget tree.
**Uses:**
- Access theme, locale, screen size
- Navigate between screens
- Access inherited widgets (like `MediaQuery`, `Theme`)
- Find parent widgets
### 20. What is a Key?
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
### 21. What is `runApp()`?
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
### 22. What is `MaterialApp`?
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
### 23. What is `Scaffold`?
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
### 24. `WidgetsFlutterBinding.ensureInitialized()`
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
### 25. Difference between Row and Column?
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
### 26. Difference between Expanded and Flexible?
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
### 27. Difference between Container and Padding?
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
### 28. Difference between ListView and GridView?
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
### 29. ListView vs ListView.builder?
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
### 30. Difference between Stack and Column?
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
### 31. Difference between Visibility, Opacity, and OffStage?
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
### 32. Difference between TextField and TextFormField?
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
### 33. Difference between InkWell and GestureDetector?
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
### 34. Difference between Image.asset and AssetImage?
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
### 35. Difference between FutureBuilder and StreamBuilder?
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
### 36. Difference between Align and Positioned?
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
### 37. What is Spacer?
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
### 38. Difference between ClipRect, ClipRRect, and ClipOval?
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
### 39. What is OOP?
Object-Oriented Programming is a paradigm (نموذج) based on objects containing data (attributes) and code (methods).
### 40. Four Pillars of OOP
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
### 41. Difference between `extends`, `implements`, and `with`?
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
### 42. What is Method Overriding?
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
### 43. What is the `super` keyword?
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
### 44. What is an API?
**API** (Application Programming Interface) is a software intermediary that allows two applications to communicate.
**Characteristics:**
- Defines how software components interact
- Allows products/services to communicate without knowing implementation
- Common way to extract and share data
### 45. What is an SDK?
**SDK** (Software Development Kit) is a comprehensive set of development tools.
**Includes:**
- Libraries
- Debugger
- Emulator
- Documentation
- Code samples
### 46. What is JSON?
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
### 47. HTTP Methods: GET, POST, PUT, PATCH, DELETE
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
### 48. What is a Callback?
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
### 49. What is an Anonymous Function?
A function without a name, also called a lambda (=>) or closure( (){} ).
**Example:**
```dart
List<int> numbers = [1, 2, 3];
numbers.forEach((item) { // Anonymous function
  print(item);
});
```
### 50. What is an Iterable?
An iterable is a collection of elements that can be accessed sequentially.
**Types:**
- **List**: Read elements by index `[1,2,3,5,6,6]`
- **Set**: Contains unique elements `{1,2,3,4,5,6,7,9}`
- **Map**: Read elements using keys `Map<String, int> scores = {'Mohamed': 95,'Ali': 88,'Sara': 76,};`
**Example:**
```dart
Iterable<int> numbers = [1, 2, 3];
for (var number in numbers) {
  print(number);
}
```
### 51.What is the lifecycle of StatefulWidget?
In Flutter, a **StatefulWidget** actually has *two* lifecycles:
- 1. The widget object (`MyWidget` – immutable, short-lived)
- 2. The state object (`_MyWidgetState` – where most of the logic lives)
When people say “StatefulWidget lifecycle,” they usually mean the **State** object lifecycle.
#### 1. Widget vs State (quick reminder)
```dart
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```
* `MyWidget` (the widget) is immutable.
* `_MyWidgetState` (the state) is persistent and has the lifecycle methods.

#### 2. State lifecycle – in order
##### 1️⃣ `createState()`
* Called **once** when Flutter needs a State for this widget.
* Defined in the `StatefulWidget` class (not in the State).
* You rarely override this beyond `=> _MyWidgetState();`.
##### 2️⃣ `initState()`
* First method called in the **State** object.
* Called **once** when the state is inserted into the widget tree.
* Good for:
  * Initializing controllers, animations, focus nodes
  * Setting up `Stream` / `Listener`
  * One-time logic
```dart
@override
void initState() {
  super.initState();
  // setup
}
```
> Important: always call `super.initState()` **first**.
##### 3️⃣ `didChangeDependencies()`
* Called **after** `initState()`, and:
  * Whenever an **inherited widget** it depends on changes
    (e.g. `MediaQuery`, `Theme`, `Localizations`, `Provider`, `BlocProvider.of`, etc.).
* Common use:
  * Using `context.dependOnInheritedWidgetOfExactType`
  * Subscribing to things that depend on `context`.
```dart
@override
void didChangeDependencies() {
  super.didChangeDependencies();
  // runs after initState and when dependencies change
}
```
### 4️⃣ `build(BuildContext context)`
* Called:
  * After `initState` + `didChangeDependencies`
  * After every `setState(...)`
  * After `didUpdateWidget` if needed
* Should be **pure UI** (no heavy logic, no API calls directly).
```dart
@override
Widget build(BuildContext context) {
  return Text('Hello');
}
```
##### 5️⃣ `didUpdateWidget(covariant MyWidget oldWidget)`
* Called when the **parent** rebuilds and gives this State a **new widget instance** with possibly new properties.
* Common when constructor parameters change.
```dart
@override
void didUpdateWidget(covariant MyWidget oldWidget) {
  super.didUpdateWidget(oldWidget);
  if (widget.someId != oldWidget.someId) {
    // react to changed props
  }
}
```
##### 6️⃣ `setState(fn)`
* Not a lifecycle callback, but **central to the State lifecycle**.
* Tells Flutter: “rebuild this widget with new data”.
```dart
setState(() {
  counter++;
});
```
* Triggers `build()` again.
* Must only be called when the State is **mounted** (not yet disposed).
##### 7️⃣ `deactivate()`
* Called when the State is **removed** from the tree **temporarily**.
* Example: moving the widget to another part of the tree within the same frame.
* Rarely used in normal apps.
```dart
@override
void deactivate() {
  super.deactivate();
}
```
##### 8️⃣ `dispose()`
* Called when the State is **permanently removed** from the widget tree.
* Last chance to clean up:
  * Dispose controllers, animations
  * Cancel timers, streams, subscriptions
```dart
@override
void dispose() {
  // clean up
  myController.dispose();
  myAnimation.dispose();
  super.dispose();
}
```
> Important: always call `super.dispose()` **last**.
##### 3. Summary flow (State object)
In order:
1. `createState()`  *(on the widget)*
2. `initState()`
3. `didChangeDependencies()`
4. `build()`
5. `didUpdateWidget()`  *(when parent passes new props)*
6. `setState()` → `build()` → (can repeat many times)
7. `deactivate()`
8. `dispose()`
### What is InheritedWidget
An **InheritedWidget** in Flutter is a special widget used to **share data down the widget tree** efficiently, so that **descendant widgets can read it and rebuild when it changes**.
Think of it like a **“data provider” at the top of a subtree**.
#### 1. Why do we need InheritedWidget?
Without it, you’d have to:
* Pass data down **through every widget constructor** (prop drilling):
  ```dart
  Home(user: user)
  → Profile(user: user)
    → Avatar(user: user)
  ```
This becomes messy.
With **InheritedWidget**, you can put data high in the tree and any descendant can access it by using the `BuildContext`.
#### 2. Key characteristics
* It is **immutable** (like any widget).
* It **stores data** you want to share (e.g. theme, settings, user, locale).
* Children access it with something like:
  ```dart
  MyInherited.of(context)
  ```
* When the data inside changes (via the widget being rebuilt), Flutter calls:
  ```dart
  bool updateShouldNotify(oldWidget)
  ```
  If this returns true, **dependents rebuild**.
#### 3. Classic example structure
A simplified custom InheritedWidget:
```dart
class CounterProvider extends InheritedWidget {
  final int counter;

  const CounterProvider({
    super.key,
    required this.counter,
    required Widget child,
  }) : super(child: child);

  static CounterProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>()!;
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return counter != oldWidget.counter;
  }
}
```
Usage:
```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      counter: 5,
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = CounterProvider.of(context).counter;

    return Text('Counter: $counter');
  }
}
```
* `CounterProvider` wraps `HomeScreen`
* `HomeScreen` gets `counter` using `of(context)`
#### 4. How children “depend” on it
There are **two ways** to access an InheritedWidget:
- 1. **With dependency** (the normal way):
   ```dart
   context.dependOnInheritedWidgetOfExactType<CounterProvider>()
   ```
   * Widget **subscribes** to changes.
   * It will **rebuild** when `updateShouldNotify` returns true.

- 2. **Without dependency** (just read once):

   ```dart
   context.getInheritedWidgetOfExactType<CounterProvider>()
   ```
   * No rebuild on changes.
   * Just fetch current value.
#### 5. Where do we use this in real life?
You already use InheritedWidget indirectly:
* `MediaQuery.of(context)` → uses InheritedWidget internally
* `Theme.of(context)`
* `Navigator.of(context)`
* State management libraries like:
  * `Provider`
  * `BlocProvider` (from flutter_bloc)
  * Riverpod (conceptually similar, but different implementation)
These are basically **nice wrappers around InheritedWidget**.
#### 6. How to answer in an interview (short version)
You can say something like:
> *“InheritedWidget is a special widget in Flutter that allows data to be efficiently propagated down the widget tree. Descendant widgets can access it using the BuildContext (e.g. `MyInherited.of(context)`), and they automatically rebuild when the InheritedWidget updates and `updateShouldNotify` returns true. Flutter’s `Theme.of`, `MediaQuery.of`, and many state management solutions like Provider are built on top of InheritedWidget.”*
### 1. What is State Management?
State management is the process of managing and sharing application state across widgets in a predictable and efficient way.
**Why needed:**
- Share data between widgets
- Maintain UI consistency
- Handle complex app state
- Improve code organization
### 2. BLoC Pattern
#### What is BLoC?
**BLoC** (Business Logic Component) is a design pattern that separates business logic from presentation.
**Key Concepts:**
- **Events**: User actions or triggers
- **States**: Application state at a point in time
- **Bloc**: Handles events and emits states
**Example:**
```dart
// Events
sealed class CounterEvent {}
final class CounterIncrementPressed extends CounterEvent {}

// States
sealed class CounterState {}
final class CounterInitial extends CounterState {}
final class CounterLoaded extends CounterState {
  final int count;
  CounterLoaded(this.count);
}

// BLoC
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrementPressed>((event, emit) {
      final currentCount = state is CounterLoaded 
        ? (state as CounterLoaded).count 
        : 0;
      emit(CounterLoaded(currentCount + 1));
    });
  }
}
```
#### BLoC Widgets
**BlocProvider:**
- Provides BLoC to widget tree
- Dependency injection widget
- Creates and closes BLoC automatically
```dart
BlocProvider(
  create: (context) => CounterBloc(),
  child: MyWidget(),
)
```
**BlocBuilder:**
- Rebuilds widget when state changes
- Receives current state
- Can use `buildWhen` for conditional rebuilds
```dart
BlocBuilder<CounterBloc, CounterState>(
  builder: (context, state) {
    if (state is CounterLoaded) {
      return Text('Count: ${state.count}');
    }
    return Text('Initial');
  },
)
```
**BlocListener:**
- Listens to state changes for side effects
- Called once per state change
- Use for navigation, dialogs, snackbars
```dart
BlocListener<CounterBloc, CounterState>(
  listener: (context, state) {
    if (state is CounterLoaded && state.count == 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Reached 10!')),
      );
    }
  },
  child: MyWidget(),
)
```
**BlocConsumer:**
- Combines BlocBuilder and BlocListener
- Use when you need both UI updates and side effects
```dart
BlocConsumer<CounterBloc, CounterState>(
  listener: (context, state) {
    // Side effects
  },
  builder: (context, state) {
    // UI updates
    return MyWidget();
  },
)
```
**BlocSelector:**
- Filters updates by selecting specific state
- Prevents unnecessary rebuilds
- Only rebuilds when selected value changes
```dart
BlocSelector<CounterBloc, CounterState, int>(
  selector: (state) => state is CounterLoaded ? state.count : 0,
  builder: (context, count) {
    return Text('Count: $count');
  },
)
```
### 3. Cubit vs BLoC
**Cubit:**
- Simpler subset of BLoC
- No events, uses methods directly
- Synchronous state updates
- Less boilerplate
**BLoC:**
- Event-driven
- More structured
- Better for complex state management
- Easier to test event flow
**Example:**
```dart
// Cubit
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  
  void increment() => emit(state + 1);
}

// BLoC
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<IncrementEvent>((event, emit) => emit(state + 1));
  }
}
```
### 4. Provider Pattern
**ChangeNotifier:**
- Simple class for change notification
- Extends or mix in for state management
- Call `notifyListeners()` to update listeners
```dart
class CounterModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  
  void increment() {
    _count++;
    notifyListeners();
  }
}
```
**ChangeNotifierProvider:**
- Provides ChangeNotifier to widget tree
- Automatically disposes when no longer needed
```dart
ChangeNotifierProvider(
  create: (_) => CounterModel(),
  child: MyApp(),
)
```
**Consumer:**
- Rebuilds when ChangeNotifier changes
- Receives model instance
```dart
Consumer<CounterModel>(
  builder: (context, counter, child) {
    return Text('Count: ${counter.count}');
  },
)
```
**Provider.of:**
- Access provider without rebuilding
- Use when you need to call methods but don't need UI updates
```dart
Provider.of<CounterModel>(context, listen: false).increment();
```
## SOLID Principles
### 18. Single Responsibility Principle (SRP)
A class should have only one reason to change, A class should be responsible for one thing.
**Bad:**
```dart
class FileHandler {
  void saveToFile(String data) { }
  void processUserData(String data) { } // Different responsibility
}
```
**Good:**
```dart
class FileSaver {
  void saveToFile(String data) { }
}
class UserDataProcessor {
  void processUserData(String data) { }
}
```
### 19. Open/Closed Principle (OCP)
A class or a code entity should be Open for extension, closed for modification.
**Bad:**
```dart
class Rectangle {
  double width;
  double height;
  double area() => width * height;
}
// Adding new shapes requires modifying existing code
```
**Good:**
```dart
abstract class Shape {
  double area();
}
class Rectangle implements Shape {
  double width;
  double height;
  @override
  double area() => width * height;
}
class Circle implements Shape {
  double radius;
  @override
  double area() => 3.14 * radius * radius;
}
// New shapes can be added without modifying existing code
```
### 20. Liskov Substitution Principle (LSP)
Subtypes must be substitutable for their base types. We should be able to interchange between subclasses with their superclasses without breaking the app.
**Bad:**
```dart
class Bird {
  void fly() { }
}
class Penguin extends Bird {
  @override
  void fly() {
    throw Exception('Penguins cannot fly'); // Violates LSP
  }
}
```
**Good:**
```dart
abstract class Bird { }
abstract class FlyingBird extends Bird {
  void fly();
}
class Sparrow extends FlyingBird {
  @override
  void fly() { }
}
class Penguin extends Bird {
  // No fly method - correct behavior
}
```
### 21. Interface Segregation Principle (ISP)
Clients should not be forced to depend on methods they don't use.
**Bad:**
```dart
abstract class Worker {
  void work();
  void eat(); // Not all workers eat
}
class Robot implements Worker {
  @override
  void work() { }
  @override
  void eat() {
    // Robots don't eat - forced to implement
  }
}
```
**Good:**
```dart
abstract class Worker {
  void work();
}
abstract class Eater {
  void eat();
}
class Robot implements Worker {
  @override
  void work() { }
}
class Human implements Worker, Eater {
  @override
  void work() { }
  @override
  void eat() { }
}
```
### 22. Dependency Inversion Principle (DIP)
Depend on abstractions, not concrete implementations.
**Bad:**
```dart
class LightBulb {
  void turnOn() { }
}
class Switch {
  LightBulb bulb; // Depends on concrete class
  Switch(this.bulb);
}
```
**Good:**
```dart
abstract class Switchable {
  void turnOn();
  void turnOff();
}
class LightBulb implements Switchable {
  @override
  void turnOn() { }
  @override
  void turnOff() { }
}
class Switch {
  Switchable device; // Depends on abstraction
  Switch(this.device);
}
```
### 30. Async/Await
**Future:**
- Represents a value that will be available in the future
- Single value or error
**Stream:**
- Sequence of asynchronous events
- Multiple values over time
**Example:**
```dart
// Future
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



