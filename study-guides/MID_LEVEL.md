# Flutter & Dart Interview Questions - Mid Level
---

## State Management

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
- Uses `emit()` instead of `yield`
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

### 5. Riverpod

**What is Riverpod?**
Riverpod is a reactive caching framework for Flutter/Dart.

**Key Features:**
- Compile-time safe
- Better performance than Provider
- Auto-dispose
- Testable
- Can override providers

**Provider Types:**
```dart
// Provider - simple value
final counterProvider = Provider<int>((ref) => 0);

// StateProvider - mutable state
final countProvider = StateProvider<int>((ref) => 0);

// StateNotifierProvider - complex state
class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);
  void increment() => state++;
}

final counterNotifierProvider = 
  StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier());

// FutureProvider - async data
final userProvider = FutureProvider<User>((ref) async {
  return fetchUser();
});

// StreamProvider - stream data
final messagesProvider = StreamProvider<List<Message>>((ref) {
  return messageStream();
});
```

**Using in Widgets:**
```dart
class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider);
    return Text('Count: $count');
  }
}

// Or with hooks
class MyWidget extends ConsumerStatefulWidget {
  @override
  ConsumerState<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<MyWidget> {
  @override
  Widget build(BuildContext context) {
    final count = ref.watch(countProvider);
    ref.listen(countProvider, (previous, next) {
      // Handle state changes
    });
    return Text('Count: $count');
  }
}
```

### 6. GetX

**GetX Widgets:**

**Obx:**
- Reactive widget
- Minimal code
- Use when controller already registered

```dart
Obx(() => Text('Count: ${controller.count.value}'))
```

**GetX:**
- Reactive widget with controller registration
- More explicit
- Can run initState calls

```dart
GetX<CounterController>(
  init: CounterController(),
  builder: (controller) => Text('Count: ${controller.count}'),
)
```

**GetBuilder:**
- Manual rebuild control
- Doesn't use streams
- Use for grouped state updates

```dart
GetBuilder<CounterController>(
  builder: (controller) => Text('Count: ${controller.count}'),
)
```

**Key Differences:**
- Obx and GetX use streams (reactive)
- GetBuilder doesn't use streams (manual)
- GetX and GetBuilder extend StatefulWidget

### 7. ValueNotifier and ListenableBuilder

**ValueNotifier:**
- ChangeNotifier that holds a single value
- Notifies when value changes (by identity)
- Best with immutable data types

```dart
final counter = ValueNotifier<int>(0);

// Listen
counter.addListener(() {
  print(counter.value);
});

// Update
counter.value = 1;
```

**ListenableBuilder:**
- Rebuilds when Listenable changes
- Works with any Listenable (ChangeNotifier, ValueNotifier, Animation)

```dart
ListenableBuilder(
  listenable: counter,
  builder: (context, child) {
    return Text('Count: ${counter.value}');
  },
)
```

---

## Architecture Patterns

### 8. MVC (Model-View-Controller)

**Components:**
- **Model**: Data and business logic
- **View**: UI representation
- **Controller**: Handles user input, updates model and view

**Flow:**
1. User interacts with View
2. View sends input to Controller
3. Controller updates Model
4. Controller updates View

**Example:**
```dart
// Model
class CounterModel {
  int count = 0;
}

// Controller
class CounterController {
  CounterModel _model = CounterModel();
  int get count => _model.count;
  
  void increment() {
    _model.count++;
  }
}

// View
class CounterView extends StatelessWidget {
  final CounterController controller;
  
  CounterView({required this.controller});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: ${controller.count}'),
        ElevatedButton(
          onPressed: controller.increment,
          child: Text('Increment'),
        ),
      ],
    );
  }
}
```

### 9. MVP (Model-View-Presenter)

**Components:**
- **Model**: Data and business logic
- **View**: Passive UI, delegates to Presenter
- **Presenter**: Handles logic, updates model, instructs view

**Flow:**
1. User interacts with View
2. View delegates to Presenter
3. Presenter updates Model
4. Presenter instructs View to update

**Example:**
```dart
// Model
class CounterModel {
  int count = 0;
}

// Presenter
class CounterPresenter {
  CounterModel _model = CounterModel();
  late CounterView _view;
  
  void attachView(CounterView view) {
    _view = view;
    _view.updateCount(_model.count);
  }
  
  void increment() {
    _model.count++;
    _view.updateCount(_model.count);
  }
}

// View
class CounterView extends StatelessWidget {
  final CounterPresenter presenter;
  int count = 0;
  
  CounterView({required this.presenter});
  
  void updateCount(int newCount) {
    count = newCount;
    // Update UI
  }
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: presenter.increment,
      child: Text('Count: $count'),
    );
  }
}
```

### 10. MVVM (Model-View-ViewModel)

**Components:**
- **Model**: Data and business logic
- **View**: UI, binds to ViewModel
- **ViewModel**: Presentation logic, exposes data and commands

**Flow:**
1. View binds to ViewModel properties
2. User input triggers ViewModel commands
3. ViewModel updates Model
4. View updates via data binding

**Example:**
```dart
// Model
class CounterModel {
  int count = 0;
}

// ViewModel
class CounterViewModel extends ChangeNotifier {
  CounterModel _model = CounterModel();
  
  int get count => _model.count;
  
  void increment() {
    _model.count++;
    notifyListeners();
  }
}

// View
class CounterView extends StatelessWidget {
  final CounterViewModel viewModel;
  
  CounterView({required this.viewModel});
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<CounterViewModel>(
        builder: (context, vm, _) {
          return Column(
            children: [
              Text('Count: ${vm.count}'),
              ElevatedButton(
                onPressed: vm.increment,
                child: Text('Increment'),
              ),
            ],
          );
        },
      ),
    );
  }
}
```

### 11. Key Differences: MVC vs MVP vs MVVM

| Aspect | MVC | MVP | MVVM |
|--------|-----|-----|------|
| **View** | Active, can access Model | Passive, delegates to Presenter | Passive, binds to ViewModel |
| **Data Binding** | Less common | Manual | Heavy reliance |
| **Testability** | Controllers harder to test | Presenters easy to test | ViewModels easy to test |
| **Dependency** | Controller depends on both | Presenter updates both | ViewModel updates Model, View binds |

### 12. Clean Architecture Overview

**Layers:**

1. **Domain Layer** (Inner):
   - Entities (business objects)
   - Use cases (business logic)
   - Repository interfaces
   - No dependencies on other layers

2. **Data Layer**:
   - Repository implementations
   - Data sources (API, database)
   - Data models
   - Depends on Domain layer

3. **Presentation Layer** (Outer):
   - UI (Widgets, Pages)
   - State management (BLoC, Provider)
   - Depends on Domain layer

**Dependency Rule:**
- Dependencies point inward
- Outer layers depend on inner layers
- Inner layers don't know about outer layers

**Example Structure:**
```
lib/
  domain/
    entities/
      user.dart
    repositories/
      user_repository.dart
    usecases/
      get_user_usecase.dart
  data/
    repositories/
      user_repository_impl.dart
    datasources/
      user_remote_datasource.dart
    models/
      user_model.dart
  presentation/
    bloc/
      user_bloc.dart
    pages/
      user_page.dart
```

---

## Design Patterns

### 13. Creational Patterns

#### Singleton
Ensures a class has only one instance.

**Benefits:**
- Reduces memory usage
- Global access point
- Instance control

**Example:**
```dart
class Database {
  static final Database _instance = Database._internal();
  
  factory Database() => _instance;
  
  Database._internal();
  
  void connect() {
    // Connection logic
  }
}
```

### 14. Structural Patterns

#### Adapter
Converts interface of a class into another interface clients expect.

**Example:**
```dart
// Old interface
class OldService {
  void doSomethingOld() {
    print('Old way');
  }
}

// Adapter
class NewService {
  final OldService _oldService;
  
  NewService(this._oldService);
  
  void doSomethingNew() {
    _oldService.doSomethingOld();
    // Add new functionality
  }
}
```

#### Decorator
Attaches additional responsibilities to an object dynamically.

**Example:**
```dart
abstract class Component {
  void operation();
}

class ConcreteComponent implements Component {
  @override
  void operation() {
    print('Basic operation');
  }
}

class Decorator implements Component {
  final Component _component;
  
  Decorator(this._component);
  
  @override
  void operation() {
    _component.operation();
    print('Additional operation');
  }
}
```

### 15. Behavioral Patterns

#### Observer
Defines one-to-many dependency between objects.

**Example:**
```dart
abstract class Observer {
  void update(String message);
}

class Subject {
  final List<Observer> _observers = [];
  
  void addObserver(Observer observer) {
    _observers.add(observer);
  }
  
  void notifyObservers(String message) {
    for (var observer in _observers) {
      observer.update(message);
    }
  }
}
```

**Note:** Flutter's `InheritedWidget` and state management solutions implement the Observer pattern.

#### Strategy
Defines a family of algorithms and makes them interchangeable.

**Example:**
```dart
abstract class PaymentStrategy {
  void pay(double amount);
}

class CreditCardStrategy implements PaymentStrategy {
  @override
  void pay(double amount) {
    print('Paid $amount with credit card');
  }
}

class PayPalStrategy implements PaymentStrategy {
  @override
  void pay(double amount) {
    print('Paid $amount with PayPal');
  }
}

class PaymentContext {
  PaymentStrategy _strategy;
  
  PaymentContext(this._strategy);
  
  void setStrategy(PaymentStrategy strategy) {
    _strategy = strategy;
  }
  
  void executePayment(double amount) {
    _strategy.pay(amount);
  }
}
```

### 16. Repository Pattern

Separates data access logic from business logic.

**Example:**
```dart
// Interface (Domain layer)
abstract class UserRepository {
  Future<User> getUserById(String id);
  Future<void> saveUser(User user);
}

// Implementation (Data layer)
class UserRepositoryImpl implements UserRepository {
  final UserDataSource _dataSource;
  
  UserRepositoryImpl(this._dataSource);
  
  @override
  Future<User> getUserById(String id) {
    return _dataSource.fetchUser(id);
  }
  
  @override
  Future<void> saveUser(User user) {
    return _dataSource.saveUser(user);
  }
}
```

### 17. Dependency Injection

Design pattern implementing inversion of control.

**Benefits:**
- Testability
- Flexibility
- Loose coupling

**Example with get_it:**
```dart
final sl = GetIt.instance;

void setup() {
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(sl()),
  );
  
  sl.registerLazySingleton<UserBloc>(
    () => UserBloc(sl()),
  );
}

// Usage
final bloc = sl<UserBloc>();
```

---

## SOLID Principles

### 18. Single Responsibility Principle (SRP)
A class should have only one reason to change.

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
Open for extension, closed for modification.

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
Subtypes must be substitutable for their base types.

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

---

## Advanced Widgets

### 23. InheritedWidget

Efficiently propagates information down the widget tree.

**Example:**
```dart
class UserDataWidget extends InheritedWidget {
  final UserData data;
  
  UserDataWidget({
    required this.data,
    required Widget child,
  }) : super(child: child);
  
  static UserDataWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserDataWidget>()!;
  }
  
  @override
  bool updateShouldNotify(UserDataWidget oldWidget) {
    return oldWidget.data != data;
  }
}

// Usage
UserDataWidget(
  data: UserData(name: 'John'),
  child: MyApp(),
)

// Access
final userData = UserDataWidget.of(context).data;
```

### 24. CustomScrollView and Slivers

**CustomScrollView:**
- Combines multiple slivers
- Custom scrolling effects
- Parallax, sticky headers

**Common Slivers:**
- `SliverAppBar`: Material app bar
- `SliverList`: Linear list
- `SliverGrid`: 2D grid
- `SliverToBoxAdapter`: Single box widget
- `SliverPersistentHeader`: Pinned header

**Example:**
```dart
CustomScrollView(
  slivers: [
    SliverAppBar(
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('Title'),
      ),
    ),
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(title: Text('Item $index')),
        childCount: 20,
      ),
    ),
  ],
)
```

### 25. showBottomSheet vs showModalBottomSheet

**showBottomSheet:**
- Persistent bottom sheet
- User can interact with app behind it
- Can be dragged down

**showModalBottomSheet:**
- Modal bottom sheet
- Blocks interaction with app
- Must be dismissed to continue

**Example:**
```dart
// Persistent
showBottomSheet(
  context: context,
  builder: (context) => Container(
    height: 200,
    child: Text('Persistent'),
  ),
);

// Modal
showModalBottomSheet(
  context: context,
  builder: (context) => Container(
    height: 200,
    child: Text('Modal'),
  ),
);
```

### 26. WillPopScope (Deprecated) / PopScope (Flutter 3.12+)

**PopScope:**
- Handles back button press
- Can prevent navigation
- Returns `Future<bool>`

**Example:**
```dart
PopScope(
  canPop: false,
  onPopInvoked: (didPop) {
    if (!didPop) {
      // Show dialog or handle back press
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Exit?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text('Exit'),
            ),
          ],
        ),
      );
    }
  },
  child: Scaffold(
    // Your content
  ),
)
```

---

## Class Modifiers

### 27. Class Modifiers in Dart 3.0+

#### No Modifier
- Can be constructed
- Can be extended
- Can be implemented
- Can be mixed in

#### `abstract`
- Cannot be instantiated
- Can have abstract methods
- Can be extended or implemented

```dart
abstract class Vehicle {
  void moveForward(int meters);
}
```

#### `base`
- Can be extended, not implemented (outside library)
- Guarantees constructor called
- All private members exist in subtypes

```dart
base class Vehicle {
  void moveForward(int meters) { }
}
```

#### `interface`
- Can be implemented, not extended (outside library)
- Prevents fragile base class problem

```dart
interface class Vehicle {
  void moveForward(int meters) { }
}
```

#### `abstract interface`
- Pure interface
- Cannot be instantiated
- Can be implemented, not extended

```dart
abstract interface class Vehicle {
  void moveForward(int meters);
}
```

#### `final`
- Cannot be extended or implemented (outside library)
- Can be extended/implemented within same library
- Prevents subtyping

```dart
final class Vehicle {
  void moveForward(int meters) { }
}
```

#### `sealed`
- Cannot be extended or implemented (outside library)
- Known, enumerable set of subtypes
- Enables exhaustive switching

```dart
sealed class Vehicle {}

class Car extends Vehicle {}
class Truck extends Vehicle {}

String getSound(Vehicle vehicle) {
  return switch (vehicle) {
    Car() => 'vroom',
    Truck() => 'VROOOOMM',
    // Compiler ensures all cases covered
  };
}
```

---

## Advanced Dart Concepts

### 28. Sealed Classes vs Enums

**Sealed Classes:**
- Can have properties and methods
- Can create hierarchies
- More flexible structure
- Pattern matching support

**Enums:**
- Fixed set of values
- No hierarchy
- Simple, distinct values
- No additional properties

**Example:**
```dart
// Sealed Class
sealed class Result {}
class Success extends Result {
  final String data;
  Success(this.data);
}
class Error extends Result {
  final String message;
  Error(this.message);
}

// Enum
enum Status { success, error }
```

### 29. Generics

Generic programming allows algorithms to be written in terms of types to be specified later.

**Example:**
```dart
class Box<T> {
  T value;
  Box(this.value);
}

Box<int> intBox = Box(42);
Box<String> stringBox = Box('Hello');
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

### 31. Isolates

Independent units of execution for parallel processing.

**Characteristics:**
- Separate memory heap
- No shared memory
- Communicate via message passing
- Each has own event loop

**Example:**
```dart
import 'dart:isolate';

void main() async {
  ReceivePort receivePort = ReceivePort();
  
  await Isolate.spawn(isolateFunction, receivePort.sendPort);
  
  receivePort.listen((message) {
    print('Received: $message');
  });
}

void isolateFunction(SendPort sendPort) {
  sendPort.send('Hello from isolate!');
}
```

### 32. Runes

Runes represent Unicode code points.

**Example:**
```dart
String text = 'Hello';
print(text.codeUnits); // [72, 101, 108, 108, 111]
print(text.runes); // (72, 101, 108, 108, 111)

// Emoji
String emoji = '😀';
print(emoji.runes); // (128512)
```

---



