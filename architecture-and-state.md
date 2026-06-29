# Architecture & State Management

<!-- merged from: architecture/architectural-patterns.md | architecture/clean-arch.md | architecture/design-patterns.md | state-management/bloc.md | state-management/overview.md | state-management/riverpod.md | state-management/getx.md -->



---

- https://www.educba.com/mvp-vs-mvvm/
- https://medium.com/@samra.sajjad0001/unleashing-creativity-exploring-architecture-patterns-in-flutter-12b7465bc927
- https://www.geeksforgeeks.org/difference-between-mvp-and-mvvm-architecture-pattern-in-android/

- Todo MVI

# architectural-patterns

### MVVM (Model-View-ViewModel), MVP (Model-View-presenter), and MVC (Model-View-Controller) are architectural patterns used to structure code in software development, Here's a brief comparison of the three.

##### 1. MVC:
- Model : Represents the data or business logic.
- View : Displays the user interface and presents information to the user.
- Controller : Manages the presentation logic, handles user interactions, updates the model, and updates the view. It acts as an intermediary between the model and the view.
- Communication Flow : The view sends user input to the controller, which then updates the model and the view this can be achieved in flutter using `statefulwidget` or any state management.

##### 2. MVP:
- Model: Represents the data or business logic.
- View: Displays the user interface. It is more passive than the view in MVC, as it delegates user input handling to the presenter.
- Presenter: Handles user input, updates the model, and updates the view. It acts as an intermediary between the model and the view. It can use Flutter's `StatefulWidget` or other state management solutions.
- Communication Flow: The view sends user input to the presenter, which then updates the model and instructs the view to update itself.

##### 3. MVVM:
- Model: Represents the data or business logic.
- View: Displays the user interface. It is more passive than the view in MVC, as it delegates data presentation to the view model.
- ViewModel: Manages the presentation logic and state of the view. It exposes data and commands for the view to bind to. It can use providers like `ChangeNotifier` or packages like `provider` or `riverpod` for state management.
- Communication Flow: The view binds to the properties and commands of the view model. User input directly triggers commands in the view model, which then updates the model and may update the view through data binding.

#### Key Differences:

##### Data Binding:
- MVC: Typically, data binding is less common in MVC.
- MVP: Data binding is often manual; the presenter is responsible for updating the view.
- MVVM: Relies heavily on data binding between the view and the view model.

##### Dependency Direction:
- MVC: The controller updates both the model and the view.
- MVP: The presenter updates the model and instructs the view to update itself.
- MVVM: The view model updates the model, and the view updates itself based on data binding.

##### Testability:
- MVC: Controllers can be harder to test in isolation.
- MVP: Presenters are easier to test in isolation because they don't directly manipulate the view.
- MVVM: View models can be easily tested in isolation due to their separation from the view.

### MVVM (Model-View-ViewModel) is a design pattern that separates an application into three main components: Model, View, and ViewModel. Here's a simple MVVM example in Flutter:

```dart
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('MVVM Counter Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Count: ${viewModel.count}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                viewModel.increment();
              },
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

// App
class MyApp extends StatelessWidget {
  final CounterViewModel _viewModel = CounterViewModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => _viewModel,
        child: CounterView(viewModel: _viewModel),
      ),
    );
  }
}
```

Explanation:

- `CounterModel` represents the data or state of the application.
- `CounterViewModel` acts as an intermediary between the model and the view. It contains the business logic and notifies the view when the data changes.
- `CounterView` is the user interface. It observes the changes in the `CounterViewModel` and updates the UI accordingly.
- In the `main` function, the `MyApp` widget uses the `ChangeNotifierProvider` to provide the `CounterViewModel` to the widget tree. This allows the `CounterView` to access and observe the `CounterViewModel`.

This example demonstrates a simple counter app following the MVVM pattern in Flutter.


### Here's a simple example of MVC (Model-View-Controller) architecture in Flutter:

```dart
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('MVC Counter Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Count: ${controller.count}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.increment();
              },
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

// App
class MyApp extends StatelessWidget {
  final CounterController _controller = CounterController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterView(controller: _controller),
    );
  }
}
```

Explanation:

- `CounterModel` represents the data or state of the application.
- `CounterController` contains the business logic and manages the state (model). It handles user input and updates the model accordingly.
- `CounterView` is the user interface. It displays the current count and handles user actions, delegating them to the controller.

In the `main` function, the `MyApp` widget creates an instance of `CounterController` and passes it to the `CounterView`. This way, the view and the controller are connected, following the MVC pattern.

### Here's a simple example of MVP (Model-View-Presenter) architecture in Flutter:

```dart
import 'package:flutter/material.dart';

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

  CounterView({required this.presenter});

  void updateCount(int count) {
    // Update UI with the new count
    // For simplicity, we'll just print it to the console
    print('Count: $count');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVP Counter Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                presenter.increment();
              },
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

// App
class MyApp extends StatelessWidget {
  final CounterPresenter _presenter = CounterPresenter();

  @override
  Widget build(BuildContext context) {
    final counterView = CounterView(presenter: _presenter);
    _presenter.attachView(counterView);

    return MaterialApp(
      home: counterView,
    );
  }
}
```

Explanation:

- `CounterModel` represents the data or state of the application.
- `CounterPresenter` contains the business logic and communicates with both the model and the view. It updates the model and notifies the view to update the UI.
- `CounterView` is the user interface. It displays the UI elements and delegates user actions to the presenter. It also has a method (`updateCount`) that the presenter calls to update the UI.

In the `main` function, the `MyApp` widget creates an instance of `CounterPresenter` and `CounterView`. It then attaches the view to the presenter, establishing the connection between the presenter and the view, following the MVP pattern.

### Following are key differences between MVP vs MVVM:

- Data is retrieved and manipulated from the data state, which is present in the Model layer. This data is transferred to the presenter layer. There is no interaction with View state in MVP. MVVM has a model located in the business logic itself where data is stored in a repository. Requests are received from a View model, and data are located accordingly.
- There is a ViewModel in MVVM where the business logic is located. This helps to create a bridge between View and business logic and is good at testing and coupling. UI has to be updated in between. However, this ViewModel is not present in MVP, and business logic is present directly in View.
- Data from the model is presented through a presenter, and it controls the behaviour in the application in MVP architecture. It directs the View layer and manages the interaction between model and view. Data is also saved back to the model. The presenter layer is not present in MVVM, and observables are created in each UI component.
- View in MVP is not important or tightly coupled with itself so that the user can ignore the view layer easily. The view layer is important as it makes the bridge of view and view model in MVVM so that it is not possible to swipe away the view layer in MVVM.
- View and Presenter layers in MVP are reusable, and hence it is easy to maintain this architecture. Also, it can be maintained with the help of readable codes written in either markup language or other coding language. There is no interaction between view and model in MVVM, and hence the code is run by units. This helps to do unit testing in MVVM.
- The whole unit can be done integration testing in MVP, while only unit testing can be done in MVVM. This is because codes are easily maintainable in MVP, while in MVVM, it is not.
- The size of the code is huge and cannot be managed easily in MVVM. This creates issues while doing testing and creating interactions between the layers. But in MVP, the codes are small and are easily manageable.


---

<p float="left">
   <img src="https://miro.medium.com/v2/resize:fit:772/1*wOmAHDN_zKZJns9YDjtrMw.jpeg" width="770" />
</p>

### Domain
- Domain. The Domain layer contains the enterprise logic and types. This layer should not depend on anything outside of itself. This layer typically defines the models and data structures that represent the business entities and concepts.
### UseCases
- In Clean Architecture, a use case is a piece of business logic that represents a single task that the system needs to perform. The use case encapsulates the rules and logic required to perform the task, and defines the inputs and outputs required for the operation.


- Let's break down the Flutter counter app using BLoC state management and clean architecture principles, explaining each layer and concept:

# 1. Project Structure:

```
- lib/
  - data/
    - repositories/
      - counter_repository.dart
    - datasources/
      - counter_datasource.dart
  - domain/
    - entities/
      - counter.dart
    - repositories/
      - counter_repository.dart
    - usecases/
      - get_counter_usecase.dart
      - increment_counter_usecase.dart
  - presentation/
    - bloc/
      - counter_bloc.dart
    - pages/
      - counter_page.dart
    - widgets/
      - counter_display.dart
      - increment_button.dart
  - main.dart
```

# 2. Clean Architecture Layers:

## a. Domain Layer:

### Entities:
- Represents the core data models of the application, in this case, the Counter entity.

### Repositories:
- Defines interfaces for data access operations. CounterRepository is an abstract class specifying methods for getting and incrementing the counter.

### Use Cases:
- Implements business logic operations. GetCounterUseCase and IncrementCounterUseCase are responsible for getting and incrementing the counter, respectively.

## b. Data Layer:
### Repositories:
- Concrete implementations of the repository interfaces defined in the domain layer. CounterRepositoryImpl implements data access methods.

### Data Sources:
- Provides the raw data from external sources or databases. CounterDataSource simulates a simple in-memory data source for the counter.

## Presentation Layer:
### BLoC (Business Logic Component):
- Manages the application's state and business logic. CounterBloc handles events, processes them using use cases, and emits states.

### Pages:
- UI components representing different screens or pages. CounterPage is the main page of the app.

### Widgets:
- Reusable UI components. CounterDisplay displays the counter value, and IncrementButton is a button to increment the counter.

# 3. Key Concepts:
## a. BLoC State Management:
- Utilizes the BLoC pattern to manage the state of the application.
- CounterBloc handles events (GetCounterEvent and IncrementCounterEvent) and emits states (CounterInitial, CounterLoaded, CounterError).

## b. Clean Architecture:
- Separation of concerns into layers: Domain, Data, and Presentation.
- Dependency inversion: High-level modules (use cases) depend on abstractions (repositories) from low-level modules.

## c. Use Cases:
- Encapsulate application-specific business logic.
- GetCounterUseCase and IncrementCounterUseCase provide clear, isolated functionalities.

# 4. Running the App:
- main.dart initializes the app by creating a CounterBloc and wrapping the main UI components in a BlocProvider.

### This structure and architecture promote maintainability, testability, and scalability by separating concerns and adhering to clean architecture principles. Each layer has a distinct responsibility, making it easier to modify or extend the app without affecting other parts of the codebase.






---

### Design patterns?
#### 1- Creational design patterns?    
- Creational design patterns abstract the instantiation process. They help make a system independent of how its objects are created, composed, and represented. A class creational pattern uses inheritance to vary the class that's instantiated, whereas an object creational pattern will delegate instantiation to another object.
- Singleton => Ensure a class only has one instance, and provide a global point of access to it.
- One of the main advantages of using the singleton pattern is that it can reduce the memory usage of your application. By creating only one instance of a class, you can avoid allocating and deallocating memory for multiple objects of the same type.
- Instance control: Singleton prevents other objects from instantiating their own copies of the Singleton object, ensuring that all objects access the single instance.
- Instance control: Singleton prevents other objects from instantiating their own copies of the Singleton object, ensuring that all objects access the single instance.
- The singleton class provides a global access point to get the instance of the class.
#### 2- Structural patterns?
- Adapter or Wrapper.
Convert the interface of a class into another interface clients expect. Adapter lets classes work together that
couldn't otherwise because of incompatible interfaces.
- Decorator or Wrapper.
Attach additional responsibilities to an object dynamically. Decorators provide a flexible alternative to subclassing
for extending functionality
#### 3- Behavioral patterns?
- Behavioral patterns are concerned with algorithms and the assignment of responsibilities between
objects. Behavioral patterns describe not just patterns of objects or classes but also the patterns of
communication between them. These patterns characterize complex control flow that's difficult to follow
at run-time. They shift your focus away from flow of control to let you concentrate just on the way
objects are interconnected.
- Observer.
Define a one-to-many dependency between objects so that when one object changes state, all its dependents are
notified and updated automatically.

# Inherited Widget:
- Type: Structural
- Explanation: Inherited Widget is a Flutter-specific design pattern that allows you to propagate information down the widget tree efficiently. It's often used for passing data that needs to be accessible by multiple widgets without having to pass it explicitly.
```dart
class MyInheritedWidget extends InheritedWidget {
  final String data;

  MyInheritedWidget({required this.data, required Widget child})
      : super(child: child);

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!;
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return oldWidget.data != data;
  }
}
```
# Singleton:
- Type: Creational
- Explanation: Ensures that a class has only one instance and provides a global point to access it.
```dart
class Singleton {
  static Singleton? _instance;

  factory Singleton() {
    _instance ??= Singleton._();
    return _instance!;
  }

  Singleton._();
}
```
# Dependency Injection:
- Type: Structural
- Explanation: It's a design pattern where a class receives its dependencies from external sources rather than creating them itself. This promotes code reusability, testability, and flexibility.
```dart
class SomeService {
  // Some service implementation
}

class MyClass {
  final SomeService _service;

  MyClass(this._service);

  // Use _service in the class
}
```
# Adapter:
- Type: Structural
- Explanation: Allows the interface of an existing class to be used as another interface. It's often used to make existing classes work with others without modifying their source code.
```dart
class OldClass {
  void doSomethingOld() {
    // Old implementation
  }
}

class Adapter {
  final OldClass _oldClass;

  Adapter(this._oldClass);

  void doSomethingNew() {
    _oldClass.doSomethingOld();
    // Add new functionality if needed
  }
}
```
# Decorator:
- Type: Structural
- Explanation: Attaches additional responsibilities to an object dynamically. It provides a flexible alternative to subclassing for extending functionality.
```dart
abstract class Component {
  void operation();
}

class ConcreteComponent implements Component {
  @override
  void operation() {
    // Basic operation
  }
}

class Decorator implements Component {
  final Component _component;

  Decorator(this._component);

  @override
  void operation() {
    _component.operation();
    // Additional operation
  }
}
```
# Observer:
- Type: Behavioral
- Explanation: Defines a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically.
```dart
class Observer {
  void update(String message) {
    // Update logic
  }
}

class Subject {
  List<Observer> _observers = [];

  void addObserver(Observer observer) {
    _observers.add(observer);
  }

  void removeObserver(Observer observer) {
    _observers.remove(observer);
  }

  void notifyObservers(String message) {
    for (var observer in _observers) {
      observer.update(message);
    }
  }
}
```
# Strategy pattern:
- The strategy pattern is a behavioral design pattern in software development that defines a family of algorithms, encapsulates each algorithm, and makes them interchangeable. The strategy pattern allows a client to choose an algorithm from a family of algorithms at runtime, and it lets the algorithm vary independently from the clients that use it.

- Here's a breakdown of the key components of the strategy pattern:

- Context: This is the class that maintains a reference to the chosen strategy. It is the client that uses the algorithm but does not implement it directly.

- Strategy: This is an interface or an abstract class that defines the common interface for all concrete algorithms. Strategies typically have a single method that the context uses to execute the algorithm.

- Concrete Strategies: These are the implementations of the strategy interface. Each concrete strategy provides a different algorithm that can be used by the context.

- By encapsulating each algorithm in a separate strategy class, you can make the algorithms interchangeable without modifying the client code. The client can switch between different strategies at runtime.


# Repository Pattern:
- Type: Architectural
- Explanation: Separates the logic that retrieves data from the underlying storage, allowing a clean separation between domain code and data access code.
```dart
class UserRepository {
  Future<User> getUserById(String userId) {
    // Logic to fetch user from storage
  }

  Future<void> saveUser(User user) {
    // Logic to save user to storage
  }
}
```

# Factory Pattern:
- Type: Creational
- Explanation: Provides a way to create objects without specifying the exact class of the object being created, delegating instantiation to a factory. There are three common forms:

**1. Simple Factory (Static Factory Method)** — a single (usually static) method returns different types of objects.
```dart
abstract class Animal {
  void speak();
}

class Dog implements Animal {
  @override
  void speak() => print('Woof! Woof!');
}

class Cat implements Animal {
  @override
  void speak() => print('Meow! Meow!');
}

class AnimalFactory {
  static Animal getAnimal(String type) {
    switch (type) {
      case 'dog':
        return Dog();
      case 'cat':
        return Cat();
      default:
        throw Exception('Unknown animal type');
    }
  }
}

void main() {
  AnimalFactory.getAnimal('dog').speak(); // Woof! Woof!
  AnimalFactory.getAnimal('cat').speak(); // Meow! Meow!
}
```

**2. Factory Method (Polymorphic Factory)** — relies on inheritance: subclasses decide which class to instantiate.
```dart
abstract class AnimalFactory {
  Animal createAnimal();
}

class DogFactory extends AnimalFactory {
  @override
  Animal createAnimal() => Dog();
}

class CatFactory extends AnimalFactory {
  @override
  Animal createAnimal() => Cat();
}

void main() {
  AnimalFactory dogFactory = DogFactory();
  dogFactory.createAnimal().speak(); // Woof! Woof!
}
```

**3. Abstract Factory** — provides an interface to create *families* of related objects without specifying their concrete classes.
```dart
abstract class Button { void render(); }
abstract class Checkbox { void render(); }

class WindowsButton implements Button {
  @override
  void render() => print('Rendering Windows Button');
}
class WindowsCheckbox implements Checkbox {
  @override
  void render() => print('Rendering Windows Checkbox');
}

abstract class GUIFactory {
  Button createButton();
  Checkbox createCheckbox();
}

class WindowsFactory implements GUIFactory {
  @override
  Button createButton() => WindowsButton();
  @override
  Checkbox createCheckbox() => WindowsCheckbox();
}

void main() {
  GUIFactory factory = WindowsFactory();
  factory.createButton().render();   // Rendering Windows Button
  factory.createCheckbox().render(); // Rendering Windows Checkbox
}
```
- **In Dart:** `factory` constructors implement this pattern natively. Core classes use it too — `DateTime.now()`, `List.filled()`, `Map.identity()`, `Stream.fromIterable()`, `Uri.parse()` — and the common `Model.fromJson()` factory constructor is the Factory Pattern applied to API parsing.
- **Benefits:** encapsulates object-creation details, makes adding new types easy, and decouples the client from concrete classes.

# Builder Pattern:
- Type: Creational
- Explanation: Separates the construction of a complex object from its representation, letting you build it step-by-step. A *Director* orchestrates a *Builder* to produce different configurations of the same product.
```dart
class House {
  String? foundation;
  String? structure;
  String? roof;
  bool? hasSwimmingPool;
  bool? hasGarage;
}

abstract class HouseBuilder {
  void buildFoundation();
  void buildStructure();
  void buildRoof();
  void addSwimmingPool();
  House getHouse();
}

class LuxuryHouseBuilder implements HouseBuilder {
  final House _house = House();

  @override
  void buildFoundation() => _house.foundation = "Concrete, steel, reinforced beams";
  @override
  void buildStructure() => _house.structure = "Modern steel and glass structure";
  @override
  void buildRoof() => _house.roof = "Glass and solar panels";
  @override
  void addSwimmingPool() => _house.hasSwimmingPool = true;
  @override
  House getHouse() => _house;
}

class HouseDirector {
  final HouseBuilder builder;
  HouseDirector(this.builder);

  House constructLuxuryHouse() {
    builder.buildFoundation();
    builder.buildStructure();
    builder.buildRoof();
    builder.addSwimmingPool();
    return builder.getHouse();
  }
}
```
- **Use case:** objects with many optional parameters/configurations, where a telescoping constructor would be unwieldy.

# Iterator Pattern:
- Type: Behavioral
- Explanation: Provides a way to access elements of a collection sequentially **without exposing its underlying structure**. An *Aggregate* creates an *Iterator* that exposes `hasNext()` / `next()`.
```dart
abstract class Iterator<T> {
  bool hasNext();
  T next();
}

abstract class IterableCollection<T> {
  Iterator<T> createIterator();
}

class Book {
  final String title;
  Book(this.title);
}

class BookCollection implements IterableCollection<Book> {
  final List<Book> _books = [];
  void addBook(Book book) => _books.add(book);

  @override
  Iterator<Book> createIterator() => BookIterator(_books);
}

class BookIterator implements Iterator<Book> {
  final List<Book> _books;
  int _currentIndex = 0;
  BookIterator(this._books);

  @override
  bool hasNext() => _currentIndex < _books.length;

  @override
  Book next() {
    if (!hasNext()) throw Exception('No more books.');
    return _books[_currentIndex++];
  }
}
```
- **Benefits:** encapsulates traversal logic and lets you iterate different collection types uniformly. Dart's own `Iterable`/`Iterator` interfaces (used by `for-in`) are a built-in implementation.

> Runnable implementations of all these patterns (plus Adapter, Decorator, Facade, Observer, Strategy, Singleton, IoC) live in [`code_examples/design_patterns/`](./code_examples/design_patterns/).


---

# Bloc

## What is Bloc and How it works?
- In Flutter, a **Bloc** (short for Business Logic Component) is a design pattern that helps manage state in your application in a predictable and efficient way. It's commonly used to separate the presentation layer from the business logic layer. Here's a brief overview of how Bloc works in Flutter:
#### 1- State Management:
- Bloc helps manage the state of your application. Instead of managing state directly in your widgets, you delegate this responsibility to the Bloc.
#### 2- Events and States:
- Bloc operates based on events and states. An event is a signal that something has happened (e.g., a button click), and a state represents the condition of your application at a specific point in time.
#### 3- Bloc Class:
- Typically, you create a class that extends the Bloc or Cubit class from the bloc package. This class will handle incoming events, update the state, and notify the UI.
```dart
class MyBloc extends Bloc<MyEvent, MyState> {
  // Logic for handling events and updating state
}
```
#### 4- Events and States Classes:
- You'll define classes for events and states. Events are triggered by user actions or other inputs, and states represent the different conditions your UI can be in.
```dart
// Define events
abstract class MyEvent {}

// Define states
abstract class MyState {}
```
#### 5- State Changes
- Bloc requires us to register event handlers via the on<Event> API, An event handler is responsible for converting any incoming events into zero or more outgoing states.
```dart
sealed class CounterEvent {}

final class CounterIncrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) {
      // handle incoming `CounterIncrementPressed` event
    });
  }
}
```
#### 6-UI Integration
- Connect your Bloc to your UI using widgets like **BlocBuilder** or **BlocListener**. These widgets rebuild parts of your UI in response to changes in the Bloc's state.
```dart
BlocBuilder<MyBloc, MyState>(
  builder: (context, state) {
    // Rebuild UI based on the current state
    return YourWidget(state.data);
  },
)
```
# Cubit
- A Cubit is a class which extends BlocBase and can be extended to manage any type of state.
<p float="left">
  <img src="https://bloclibrary.dev/assets/cubit_architecture_full.png" width="480" alt="cubit"/>
</p>
- A Cubit can expose functions which can be invoked to trigger state changes.
- States are the output of a Cubit and represent a part of your application's state. UI components can be notified of states and redraw portions of themselves based on the current state.

# BlocBuilder
- BlocBuilder is a Flutter widget which requires a Bloc and a builder function. BlocBuilder handles building the widget in response to new states. BlocBuilder is very similar to StreamBuilder but has a more simple API to reduce the amount of boilerplate code needed. The builder function will potentially be called many times and should be a pure function that returns a widget in response to the state.
```dart
BlocBuilder<BlocA, BlocAState>(
  builder: (context, state) {
    // return widget here based on BlocA's state
  }
)
```
- For fine-grained control over when the builder function is called an optional buildWhen can be provided. buildWhen takes the previous bloc state and current bloc state and returns a boolean. If buildWhen returns true, builder will be called with state and the widget will rebuild. If buildWhen returns false, builder will not be called with state and no rebuild will occur.
```dart
BlocBuilder<BlocA, BlocAState>(
  buildWhen: (previousState, state) {
    // return true/false to determine whether or not
    // to rebuild the widget with state
  },
  builder: (context, state) {
    // return widget here based on BlocA's state
  }
)
```
# BlocSelector
- BlocSelector is a Flutter widget which is analogous to BlocBuilder but allows developers to filter updates by selecting a new value based on the current bloc state. Unnecessary builds are prevented if the selected value does not change. The selected value must be immutable in order for BlocSelector to accurately determine whether builder should be called again.
- If the bloc parameter is omitted, BlocSelector will automatically perform a lookup using BlocProvider and the current BuildContext.
```dart
BlocSelector<BlocA, BlocAState, SelectedState>(
  selector: (state) {
    // return selected state based on the provided state.
  },
  builder: (context, state) {
    // return widget here based on the selected state.
  },
)
```
# BlocProvider
- BlocProvider is a Flutter widget which provides a bloc to its children via BlocProvider.of<T>(context). It is used as a dependency injection (DI) widget so that a single instance of a bloc can be provided to multiple widgets within a subtree.
- In most cases, BlocProvider should be used to create new blocs which will be made available to the rest of the subtree. In this case, since BlocProvider is responsible for creating the bloc, it will automatically handle closing the bloc.
```dart
BlocProvider(
  create: (BuildContext context) => BlocA(),
  child: ChildA(),
);
```
- By default, BlocProvider will create the bloc lazily, meaning create will get executed when the bloc is looked up via BlocProvider.of<BlocA>(context).
- To override this behavior and force create to be run immediately, lazy can be set to false.
```dart
BlocProvider(
  lazy: false,
  create: (BuildContext context) => BlocA(),
  child: ChildA(),
);
```
# MultiBlocProvider.
- MultiBlocProvider is a Flutter widget that merges multiple BlocProvider widgets into one. MultiBlocProvider improves the readability and eliminates the need to nest multiple BlocProviders. By using MultiBlocProvider we can go from:
```dart
BlocProvider<BlocA>(
  create: (BuildContext context) => BlocA(),
  child: BlocProvider<BlocB>(
    create: (BuildContext context) => BlocB(),
    child: BlocProvider<BlocC>(
      create: (BuildContext context) => BlocC(),
      child: ChildA(),
    )
  )
)
```
-to
```dart
MultiBlocProvider(
  providers: [
    BlocProvider<BlocA>(
      create: (BuildContext context) => BlocA(),
    ),
    BlocProvider<BlocB>(
      create: (BuildContext context) => BlocB(),
    ),
    BlocProvider<BlocC>(
      create: (BuildContext context) => BlocC(),
    ),
  ],
  child: ChildA(),
)
```
# BlocListener.
- BlocListener is a Flutter widget which takes a BlocWidgetListener and an optional Bloc and invokes the listener in response to state changes in the bloc. It should be used for functionality that needs to occur once per state change such as navigation, showing a SnackBar, showing a Dialog, etc...
- listener is only called once for each state change (NOT including the initial state) unlike builder in BlocBuilder and is a void function.
- If the bloc parameter is omitted, BlocListener will automatically perform a lookup using BlocProvider and the current BuildContext.
```dart
BlocListener<BlocA, BlocAState>(
  listener: (context, state) {
    // do stuff here based on BlocA's state
  },
  child: Container(),
)
```
## Difference between flutter-bloc and bloc packages?
### bloc Package:

- The bloc package provides the core functionality for implementing the BLoC (Business Logic Component) pattern in Dart, which is a design pattern for managing state in Flutter applications.
- It includes the Bloc and Cubit classes, which are the building blocks for creating and managing business logic components in your application.

### flutter_bloc Package:
- The flutter_bloc package is an extension of the bloc package specifically tailored for Flutter applications.
- It introduces additional Flutter-specific features and widgets that work seamlessly with the bloc package. For example, it includes the BlocBuilder and BlocProvider widgets, which simplify the integration of BLoC pattern into Flutter UI.
- It provides tools to easily connect your BLoCs with your Flutter widgets, making it more convenient for managing the state in a Flutter application.
##### In summary, while the bloc package offers the core BLoC functionality in Dart, the flutter_bloc package builds on top of it to provide Flutter-specific utilities and widgets for a more seamless integration of the BLoC pattern into your Flutter app.






---

# Obx
- when my controller is already registered elsewhere and I want minimal code/noise a reactive widget
# GetX
- when my controller isn't yet registered or I want to be very explicit/obvious which controller is being used or I need to run some initState calls during creation and I want a reactive widget
# GetBuilder
- I want to manually decide when a widget rebuilds
- I have several state variables that make sense to refresh together as a group
### Under the hood, both Obx and GetX use streams, subscribing to controller observable variables change streams to know when to reactively rebuild. GetBuilder does not.
### GetX and GetBuilder both extend StatefulWidget

# ChangeNotifier
- ChangeNotifier is a simple class included in the Flutter SDK which provides change notification to its listeners. In other words, if something is a ChangeNotifier, you can subscribe to its changes. (It is a form of Observable, for those familiar with the term.)

- In provider, ChangeNotifier is one way to encapsulate your application state. For very simple apps, you get by with a single ChangeNotifier. In complex ones, you’ll have several models, and therefore several ChangeNotifiers. (You don’t need to use ChangeNotifier with provider at all, but it’s an easy class to work with.)

# ChangeNotifierProvider
- ChangeNotifierProvider is the widget that provides an instance of a ChangeNotifier to its descendants. It comes from the provider package.

# Consumer
- The only required argument of the Consumer widget is the builder. Builder is a function that is called whenever the ChangeNotifier changes. (In other words, when you call notifyListeners() in your model, all the builder methods of all the corresponding Consumer widgets are called.)

- The builder is called with three arguments. The first one is context, which you also get in every build method.
- The second argument of the builder function is the instance of the ChangeNotifier. It’s what we were asking for in the first place. You can use the data in the model to define what the UI should look like at any given point.

- The third argument is child, which is there for optimization. If you have a large widget subtree under your Consumer that doesn’t change when the model changes, you can construct it once and get it through the builder.
# Provider.of
- Sometimes, you don’t really need the data in the model to change the UI but you still need to access it. For example, a ClearCart button wants to allow the user to remove everything from the cart. It doesn’t need to display the contents of the cart, it just needs to call the clear() method.

# What is Riverpod?
- Riverpod (anagram of Provider) is a reactive caching framework for Flutter/Dart.

- Using declarative and reactive programming, Riverpod takes care of a large part of your application's logic for you. It can perform network-requests with built-in error handling and caching, while automatically re-fetching data when necessary.
### Providers are the most important part of a Riverpod application. A provider is an object that encapsulates a piece of state and allows listening to that state.
### ProviderObserver ProviderObserver listens to the changes of a ProviderContainer.To use it, extend the class ProviderObserver and override the method you want to use.
### A few of the things that scoping enables are:
- Override the state of providers for a specific subtree (similar to how theming and InheritedWidgets work in flutter) (see example)
- Creating synchronous providers for normally async APIs (see example)
- Allowing Dialogs and Overlays to inherit the state of providers from the widget subtree that cause them to be shown (see example)
- Optimizing rebuilds of widgets by removing parameters from Widget constructors allowing you to make them const
### Why do we need to extend ConsumerWidget instead of using the raw StatelessWidget?
- This is due to an unfortunate limitation in the API of InheritedWidget.

- There are a few problems:

- It is not possible to implement an "on change" listener with InheritedWidget. That means that something such as ref.listen cannot be used with BuildContext.

- State.didChangeDependencies is the closest thing to it, but it is not reliable. One issue is that the life-cycle can be triggered even if no dependency changed, especially if your widget tree uses GlobalKeys (and some Flutter widgets already do so internally).

- Widgets listening to an InheritedWidget never stop listening to it. This is usually fine for pure metadata, such as "theme" or "media query".

- For business logic, this is a problem. Say you use a provider to represent a paginated API. When the page offset changes, you wouldn't want your widget to keep listening to the previously visible pages.

- InheritedWidget has no way to track when widgets stop listening to them. Riverpod sometimes relies on tracking whether or not a provider is being listened to.

- This functionality is crucial for both the auto dispose mechanism and the ability to pass arguments to providers.
- Those features are what make Riverpod so powerful.
## WidgetRef class abstract
An object that allows widgets to interact with providers.


---

## 1. What is Riverpod in Flutter, and why use it?
- Riverpod is a reactive caching and dependency injection framework for Flutter and Dart apps.
- It's a successor to the Provider package, offering a safer and more testable way to manage app state.
- Riverpod solves issues with Provider like better support for dependency injection, global access to state, and eliminating context dependency.

## 2. What are the key differences between Riverpod and Provider?
- No BuildContext: Riverpod doesn't rely on BuildContext to retrieve providers.
- Compile-time safety: It helps catch errors at compile time, like unregistered providers.
- Global access: Riverpod enables access to providers anywhere in the app.
- Scoped providers: Unlike Provider, which works with InheritedWidget, Riverpod allows easier scoping of providers.

## 3. What are the core types of providers in Riverpod?
- Provider: A read-only provider for synchronous values.
- StateProvider: A provider for simple state management, holding mutable state.
- FutureProvider: Manages asynchronous values, returning a Future.
- StreamProvider: Manages a stream of values.
- ChangeNotifierProvider: Manages objects that extend ChangeNotifier.

## 4. How do you define and read a simple provider in Riverpod?
```dart
final greetingProvider = Provider((ref) => 'Hello, Riverpod!');

// Reading the provider in a widget
Consumer(
  builder: (context, ref, child) {
    final greeting = ref.watch(greetingProvider);
    return Text(greeting);
  },
);
```


---

## 1. What is GetX in Flutter?
- GetX is a lightweight and powerful Flutter framework that provides state management, dependency injection, and route management.
- It is known for its simplicity, high performance, and minimal boilerplate.

## 2. What are the main features of GetX?
- GetX offers three main features:
  - `State Management:` Efficient and reactive state management.
  - `Dependency Injection:` Easy dependency injection without the need for context.
  - `Route Management:` Powerful routing system that allows for navigation without context.

## 3. How does GetX state management differ from other state management solutions in Flutter?
- GetX is more lightweight, has a simpler syntax, and does not require context or InheritedWidgets.
- It also combines state management, dependency injection, and routing, which are often separated in other solutions.

## 4. Explain the difference between `GetBuilder`, `Obx`, and `GetX` widgets.
### GetBuilder:
- It is a simple state management widget that rebuilds when update() is called on the controller.
- I want to manually decide when a widget rebuilds
- I have several state variables that make sense to refresh together as a group
```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0;

  void increment() {
    counter++;
    update(); // Notify GetBuilder to rebuild
  }
}

class GetBuilderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initializing the controller
    final CounterController controller = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(title: Text("GetBuilder Example")),
      body: Center(
        child: GetBuilder<CounterController>(
          builder: (_) {
            return Text("Count: ${controller.counter}",
                style: TextStyle(fontSize: 24));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
```

### Obx
- `Obx` is used to create a reactive widget that automatically updates when an observable variable changes.
- when my controller is already registered elsewhere and I want minimal code/noise a reactive widget.

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

  void increment() {
    counter++;
  }
}

class ObxExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initializing the controller
    final CounterController controller = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(title: Text("Obx Example")),
      body: Center(
        child: Obx(() => Text("Count: ${controller.counter.value}",
            style: TextStyle(fontSize: 24))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
```
### Getx
- It is a combination of both `GetBuilder` and `Obx`, providing both non-reactive and reactive updates in a single widget.
- when my controller isn't yet registered or I want to be very explicit/obvious which controller is being used or I need to run some initState calls during creation and I want a reactive widget.
- `GetX` widget combines both reactive and non-reactive updates. It allows you to directly use the controller's properties and update the UI.

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

  void increment() {
    counter++;
  }
}

class GetXExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initializing the controller
    final CounterController controller = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(title: Text("GetX Example")),
      body: Center(
        child: GetX<CounterController>(
          builder: (_) {
            return Text("Count: ${controller.counter.value}",
                style: TextStyle(fontSize: 24));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
```

## 5. What are reactive and non-reactive state management in GetX?
- `Reactive:` Reactive state management listens to changes in observable variables (Rx types) and updates the UI automatically (e.g., using Obx).
- `Non-Reactive:` Non-reactive state management uses explicit methods like update() to trigger UI updates (e.g., using GetBuilder).

## 6. How do you create a reactive variable in GetX?
- You can create a reactive variable by using the `.obs` property.
```dart
var counter = 0.obs;
```

## 7. How do you update a reactive variable in GetX?
- You update a reactive variable by assigning a new value to it:
```dart
counter.value++;
```
## 8. How do you listen to changes in a reactive variable?
- Use the Obx widget to listen to changes and rebuild the UI when the variable changes:
```dart
Obx(() => Text("Count: ${counter.value}"));
```

## 9. How does dependency injection work in GetX?
- GetX uses lazy dependency injection. You can initialize dependencies using `Get.put()`, `Get.lazyPut()`, or `Get.find()` .
```dart
Get.put<MyController>(MyController());
```
## 10. Explain the difference between `Get.put()` and `Get.lazyPut()`.
- **Answer**: 
  - `Get.put()`: Instantiates the dependency immediately and makes it available for injection.
  - `Get.lazyPut()`: Instantiates the dependency only when it is accessed for the first time.
## 11. How do you use GetX for navigation?
- **Answer**: GetX provides `Get.to()`, `Get.back()`, and `Get.off()` for navigation without needing `context`. For example:
  ```dart
  Get.to(NextScreen());
  ```
## 12. What is `Get.back()` used for?
- **Answer**: `Get.back()` is used to pop the current route from the navigation stack, returning to the previous screen.
## 13. What is the use of `Get.off()` and `Get.offAll()` in navigation?
- **Answer**:
  - `Get.off()`: Replaces the current screen with the new screen, removing the previous screen from the stack.
  - `Get.offAll()`: Clears the entire navigation stack and pushes the new screen.
## 14. What is Bindings in GetX?
- **Answer**: `Bindings` are used to manage the dependency injection of controllers. They allow you to lazily load controllers and other dependencies when a route is accessed.
## 15. How do you use Bindings in GetX?
- **Answer**: Create a class that extends `Bindings` and override the `dependencies()` method:
  ```dart
  class HomeBinding extends Bindings {
    @override
    void dependencies() {
      Get.lazyPut(() => HomeController());
    }
  }
  ```
  Then, use it in your route definition:
  ```dart
  GetPage(name: '/home', page: () => HomeScreen(), binding: HomeBinding());
  ```
## 16. What is the GetxController and how is it used?
- **Answer**: `GetxController` is a controller class that provides lifecycle methods and state management features. It's used to manage the state and logic of a particular screen or widget.
## 17. How do you dispose of a GetxController?
- **Answer**: `GetxController` is automatically disposed of when the route is removed from the stack. However, you can also manually dispose of it by calling `Get.delete<MyController>()`.
## 18. What is the GetBuilder's id parameter used for?
- **Answer**: The `id` parameter in `GetBuilder` allows you to selectively update widgets associated with a specific ID, optimizing performance by avoiding unnecessary rebuilds.
## 19. How do you handle errors in GetX?
- **Answer**: Errors can be handled using `.obs` variables and `ever`, `once`, or `debounce` workers to listen to state changes and manage error states.
## 20. What are workers in GetX and how do you use them?
- **Answer**: Workers are methods in GetX that allow you to listen to changes in observable variables. Examples include `ever`, `once`, `debounce`, and `interval`. For example:
  ```dart
  ever(counter, (_) => print("Counter changed"));
  ```
## 21. How do you show a Snackbar using GetX?
- **Answer**: You can use `Get.snackbar()` to show a snackbar without needing `context`. For example:
  ```dart
  Get.snackbar("Title", "Message");
  ```
## 22. How do you show a dialog using GetX?
- **Answer**: Use `Get.dialog()` to show a dialog. For example:
  ```dart
  Get.dialog(AlertDialog(title: Text("Hello")));
  ```
## 23. How do you manage multiple languages in a Flutter app using GetX?
- **Answer**: GetX provides easy internationalization support. Define your translations in a map and extend `Translations`:
  ```dart
  class MyTranslations extends Translations {
    @override
    Map<String, Map<String, String>> get keys => {
      'en_US': {'hello': 'Hello'},
      'es_ES': {'hello': 'Hola'},
    };
  }
  ```
  Then, initialize it in your app:
  ```dart
  GetMaterialApp(
    translations: MyTranslations(),
    locale: Locale('en', 'US'),
  );
  ```
## 24. How do you use middlewares in GetX?
- **Answer**: Middlewares in GetX are used to execute code before a route is accessed. Implement `GetMiddleware` and override `redirect` or `onPageCalled` methods.
## 25. Can you explain how to use themes in GetX?
- **Answer**: GetX makes theme management easy. You can switch themes dynamically using `Get.changeTheme()` or `Get.changeThemeMode()`:
  ```dart
  Get.changeTheme(ThemeData.dark());
  ```

# Reactive Programming with RxDart

## The relationship between MVVM and the Observer pattern

- The **Observer Design Pattern** allows objects (observers) to be notified of changes in another object (the subject) they observe, achieving a separation of concerns where the subject doesn't need to know the details of its observers.
- In **MVVM** the **ViewModel** holds state and exposes **observable** properties; the **View** observes the ViewModel and refreshes automatically when data changes. When a ViewModel property changes, it notifies the View (observer), ensuring the View updates accordingly.
- Frameworks facilitate this: Flutter (Streams / `ChangeNotifier` / RxDart), Android (`LiveData`, Data Binding), .NET (`INotifyPropertyChanged`).
- **Benefits of combining MVVM + Observer:** loose coupling (better testability/maintainability), automatic UI updates, and clear separation of concerns.

```dart
class CounterViewModel extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners(); // Observer pattern in action
  }
}
```

Here the View subscribes to the ViewModel and updates automatically whenever `notifyListeners()` is called.

## What is RxDart?

- **RxDart** is a Dart library that provides **Reactive Extensions (Rx)** for building asynchronous, event-based programs using observable streams. It extends Dart's native `Stream` API with more powerful and flexible operators. The **"Rx"** stands for **Reactive Extensions**, and *reactive* refers to a paradigm focused on asynchronous data streams and the propagation of changes.

**Key concepts:**
- **Stream:** a sequence of asynchronous events (single-subscription or broadcast); RxDart builds on top of this.
- **Observable:** a wrapper around Dart's `Stream` with extra operators to transform, filter, combine, and control streams.
- **Subjects:** act as both an Observable (for subscribers) and an Observer (to emit data):
  - `PublishSubject`: emits new items to subscribers only after they subscribe.
  - `BehaviorSubject`: emits the most recent item to new subscribers, then all subsequent items.
  - `ReplaySubject`: buffers items and replays them to any new subscriber.
- **Operators:** `map`, `flatMap`, `merge`, `combineLatest`, `debounce`, `throttle`, `filter`, `distinct`, etc.
- **Schedulers:** control how and when stream emissions occur (e.g. throttling, debouncing).

**Why use RxDart?** Powerful stream manipulation, clean reactive programming, and event-driven state management (commonly used inside the BLoC pattern).

```dart
// Native Dart stream
final streamController = StreamController<int>();
streamController.stream.listen((data) => print(data));
streamController.add(1);
streamController.add(2);

// With RxDart (BehaviorSubject + operators)
import 'package:rxdart/rxdart.dart';

final subject = BehaviorSubject<int>();
subject.stream
    .map((data) => data * 2)
    .listen((data) => print(data)); // Outputs: 2, 4
subject.add(1);
subject.add(2);
```

**Common use cases:** debounced search queries, real-time form validation (combining input streams), and real-time features like chat messages, notifications, or live data feeds.

## Comparing common RxDart operators

| Operator | Description | Example use case |
|----------|-------------|------------------|
| `map` | Transforms each item using a function. | Type conversion, data transformation. |
| `flatMap` | Flattens and merges inner observables into one stream. | Multiple async operations, chaining API calls. |
| `merge` | Combines multiple streams, emitting items from all sources as they arrive. | Merging user inputs / data streams. |
| `combineLatest` | Combines the latest values from multiple streams whenever any emits. | Handling multiple related data sources. |
| `debounce` | Delays emission until there's a pause for a given duration. | Search boxes — reduce excessive updates/API calls. |
| `throttle` | Emits only the first item in each time period. | Limiting fast-emitting events. |
| `filter` | Emits only items that satisfy a condition. | Filtering data (e.g. even numbers, valid inputs). |
| `distinct` | Emits only unique values, filtering duplicates. | Removing duplicate emissions from a stream. |





