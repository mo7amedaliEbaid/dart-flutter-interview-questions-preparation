# Dart-Flutter-interview-questions

<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/dart-flutter-interview-questions/blob/bc8d06480cef61c36a481e1915a0ff4880213b9a/assets/feynman1.jpg" width="770" />
</p>

## 0-Flutter architectural overview.

- Flutter is a cross-platform UI toolkit that is designed to allow code reuse across operating systems such as iOS and Android, while also allowing applications to interface directly with underlying platform services. The goal is to enable developers to deliver high-performance apps that feel natural on different platforms, embracing differences where they exist while sharing as much code as possible.

- During development, Flutter apps run in a VM that offers stateful hot reload of changes without needing a full recompile. For release, Flutter apps are compiled directly to machine code, whether Intel x64 or ARM instructions, or to JavaScript if targeting the web. The framework is open source, with a permissive BSD license, and has a thriving ecosystem of third-party packages that supplement the core library functionality.


### Architectural layers.
<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/dart-flutter-interview-questions/blob/b3f2edbccd35b594ea589729248c3d4b322938ca/assets/flutt.png" width="770" />
</p>

- Flutter is designed as an extensible, layered system. It exists as a series of independent libraries that each depend on the underlying layer. No layer has privileged access to the layer below, and every part of the framework level is designed to be optional and replaceable.

#### Embedder.
- To the underlying operating system, Flutter applications are packaged in the same way as any other native application. A platform-specific embedder provides an entrypoint; coordinates with the underlying operating system for access to services like rendering surfaces, accessibility, and input; and manages the message event loop. The embedder is written in a language that is appropriate for the platform: currently Java and C++ for Android, Objective-C/Objective-C++ for iOS and macOS, and C++ for Windows and Linux. Using the embedder, Flutter code can be integrated into an existing application as a module, or the code may be the entire content of the application. Flutter includes a number of embedders for common target platforms, but other embedders also exist.

#### Engine.
- At the core of Flutter is the Flutter engine, which is mostly written in C++ and supports the primitives necessary to support all Flutter applications. The engine is responsible for rasterizing composited scenes whenever a new frame needs to be painted. It provides the low-level implementation of Flutter’s core API, including graphics (through Impeller on iOS and coming to Android, and Skia on other platforms) text layout, file and network I/O, accessibility support, plugin architecture, and a Dart runtime and compile toolchain.
- The engine is exposed to the Flutter framework through dart:ui, which wraps the underlying C++ code in Dart classes. This library exposes the lowest-level primitives, such as classes for driving input, graphics, and text rendering subsystems.

#### Framework.
- Typically, developers interact with Flutter through the Flutter framework, which provides a modern, reactive framework written in the Dart language. It includes a rich set of platform, layout, and foundational libraries, composed of a series of layers. Working from the bottom to the top, we have:

- Basic foundational classes, and building block services such as animation, painting, and gestures that offer commonly used abstractions over the underlying foundation.
- The rendering layer provides an abstraction for dealing with layout. With this layer, you can build a tree of renderable objects. You can manipulate these objects dynamically, with the tree automatically updating the layout to reflect your changes.
- The widgets layer is a composition abstraction. Each render object in the rendering layer has a corresponding class in the widgets layer. In addition, the widgets layer allows you to define combinations of classes that you can reuse. This is the layer at which the reactive programming model is introduced.
- The Material and Cupertino libraries offer comprehensive sets of controls that use the widget layer’s composition primitives to implement the Material or iOS design languages.
- The Flutter framework is relatively small; many higher-level features that developers might use are implemented as packages, including platform plugins like camera and webview, as well as platform-agnostic features like characters, http, and animations that build upon the core Dart and Flutter libraries. Some of these packages come from the broader ecosystem, covering services like in-app payments, Apple authentication, and animations.


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

### 11- Difference between var and dynamic ?
#### var.
- can't change TYPE of the variable.
- but can change the VALUE of the variable later in code.

#### dynamic.
- can change TYPE of the variable.
- can change VALUE of the variable later in code.

### 12- Difference between Visibility, Opacity & OffStage ?
#### Visibility.
- Visibility widget is to show/hide widgets.
- it has a visible property, which helps us in showing or hiding child.
- when visible is set to false, the actual child is replaced with zero- sized box instead.
```
// manage visibility
              Visibility(
                 
                // showing the child widget
                visible: true, // true to show, false to hide
                child: Text(
                  "Visible/Hide Text Example",
                  
                ),
              ),
```
#### Opacity.
- The opacity widget in flutter is used to make it’s child transparent.
- it can be done by using opacity property and set it 0, (range 0.0 - 1.0).
- The child is completely invisible when set to opacity 0, but will acquire the space & widget is also interactive.
```
Opacity(
  opacity: _visible ? 1.0 : 0.0,
  child: const Text("Now you see me, now you don't!"),
)
```
#### OffStage.
- OffStage in flutter widget lays it child out, as if it in true but don’t draw/render the child widget view on screen, and all don’t take space of screen.
- most of the time offstage is used to measure the dimension of widget without showing it on screen.
```
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey _key = GlobalKey();
  bool _offstage = true;

  Size _getFlutterLogoSize() {
    final RenderBox renderLogo =
        _key.currentContext!.findRenderObject()! as RenderBox;
    return renderLogo.size;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Offstage(
          offstage: _offstage,
          child: FlutterLogo(
            key: _key,
            size: 150.0,
          ),
        ),
        Text('Flutter logo is offstage: $_offstage'),
        ElevatedButton(
          child: const Text('Toggle Offstage Value'),
          onPressed: () {
            setState(() {
              _offstage = !_offstage;
            });
          },
        ),
        if (_offstage)
          ElevatedButton(
              child: const Text('Get Flutter Logo size'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text('Flutter Logo size is ${_getFlutterLogoSize()}'),
                  ),
                );
              }),
      ],
    );
  }
}
```
### 13- Difference between Expanded and Flexible ?
- Flexible takes only the needed space, and Expanded takes all available space, respecting the flex factor.
- The Expanded widget simply takes all available space.
- One important distinction between the Flexible and Expanded widgets is that Flexible does not force its children to take the same size as itself where the Expanded widget forces its child to take the same size.
- Widget under Flexible are by default WRAP_CONTENT although you can change it using parameter fit.
- Widget under Expanded is MATCH_PARENT you can change it using flex.

### 14- What id generic programming ?
- Style of computer programming in which algorithims are written in terms of types to be specified later that are then instantiated when needed for specific types provided.

### 15- Solid Principles ?

#### S=> Single responsibility principle .
- A class should only be responsible for one thing that means a class could change for one reason.

#### O=> Opened-Closed Principle .
- An entity should be open for extension but closed for modification.
- Adding new features without modifying the existing code.

#### L=>Liskov substitution principle.
- Objects of a superclass should be replacable with objects of its subclass without breaking the application.
- Objects of our subclass behaves the same way as objects of our superclass.

#### I=>Interface Segregation Principle .
- It states that no client should be forced to depend on methods it does not use.
- Client should never depend on any thing more than the method it's calling.

#### D=>Dependency inversion principle .
- Abstractions should not depend on details (Concrete implementations), they should depend on abstractions.
- You will be able to change the implementation without altering the high level code.
- Depending on abstractions gives the freedom to be independent of the implementations.

### 16- What is Records in dart ?
- Records are an anonymous, immutable, aggregate type. Like other collection types, they let you bundle multiple objects into a single object. Unlike other collection types, records are fixed-sized, heterogeneous, and typed.
- Records are real values; you can store them in variables, nest them, pass them to and from functions, and store them in data structures such as lists, maps, and sets.
```
var record = ('first', a: 2, b: true, 'last');
```
### 17- What is the difference between .map() and .foreach() methods in Dart while iterating over an array ?
- The major difference is forEach doesn't returns anything while map() does return another array which satisfies the conditions.
- forEach iterates over each element in the array, it's a function which won't return.
```
xyz = [1,2,3,4,5]

newArray = xyz.map( (x) => x == 3)

xyz.forEach( (x) {  
if(x == 3) print("Yo"); 
})
```
### 18- What is Spread Operator and Null-aware Spread Operator in dart ?
- In Dart, Spread Operator (…) and Null-aware Spread Operator (…?) are used for inserting multiple elements in a collection like Lists, Maps, etc.
- Spread Operator.
```
...Data_structure
```
- Null-aware Spread operator.
```
...?Data_structure
```
```
void main() { 
  
   // initialise a List l1 
   List? l1 = ["Geeks","For","Geeks"]; 
    
  // initialize another List l2 using l1 
  List? l2=["Wow",...l1,"is","amazing"]; 
  
   // print List l2 
   print(l2); 
}
```
### 19- Difference between .then() and .whenCompleted() methods when working with Futures ?
- .whenComplete will fire a function either when the Future completes with an error or not, instead .then will fire a function after the Future completes without an error.
- catchError runs if the future fails.
```
someFuture().then((value) {
  print('Future finished successfully i.e. without error');
}).catchError((error) {
  print('Future finished with error');
}).whenComplete(() {
  print('Either of then or catchError has run at this point');
});
```
### 20- What is a mixin class in dart ?
- A way of defining code that can be reused in multiple class hierarchies.
```
mixin Mixin{}

class Me extends Person with Mixin{}
```
### 21- What is a stream in dart ?
- Define asynchronous programming in dart.
- A stream can be thought of as series of asynchronous occurance.
- Could be thought of as a pipe and the water inside it is the data.

### 22- Explain OOP principles in programming ?
#### Abstraction.
- The process of hiding the internal data and implementation details from the outer world.
- Its used to describe things in simple terms.
- It's used to create a boundary between the application and the client programs.
##### Abstract class.
- Cannot be instantiated and can contain abstract and non-abstract methods.
##### Interface class.
- Specifies a set of methods that a class must implement.
##### Benefits.
- Reduces boilerplate code (Code sections repeated throughout a program or software).
- Increase reuseability, maintainability and readability.
 
<br/>

#### Inheritance.
- One class inherits the attributes and methods of another class.
- Child class from parent class.

##### Benefits.
- Code reusability, save time and reduce code boilerplate.

##### Types.
- Single Inheritence.
- Multiple Inheritence (Dart doesn't support multiple inheritence but we can use mixins to inherit multiple classes).
- Multilevel Inheritence.

<br/>

#### Polymorphism.
- Multi form => the concept that you can access objects of different types through the same interface.
- The ability of any data to be processed in more than one form.
- the ability of an object to take many forms.
- Allows to compensate any reference of the super class by any object of the sub class.
- Allows to perform a single action in different ways.
- Reduces Coupling.
- Increase Reusability.
```
abstract class Person{}
class Me extends Person{}
class Him extends Person{}

Person me=new Me();

Person him=new Him();
```
<br/>

#### Encapsulation.
- bundling of data and methods that operate on that data within single unit (class).
- The method of hiding the implementation details of a class from outside access and only exposing a public interface.
- It's a protective shield that prevent data from being accessed by code outside this shield.
- In dart we use _var instead of private keyword.
- Getters => Read only.
- Setters => Write only.

##### Benefits.
- Data Hiding, increases flexibility and reusability.

### 23- Introduce the Class modifiers in dart "3"! ?

#### No modifier.

##### To allow unrestricted permission to construct or subtype from any library, use a class or mixin declaration without a modifier. By default, you can:
- Construct new instances of a class.
-  Extend a class to create a new subtype.
-  Implement a class or mixin’s interface.
-  Mix in a mixin or mixin class.


#### abstract.
- To define a class that doesn’t require a full, concrete implementation of its entire interface, use the abstract modifier.
- Abstract classes cannot be constructed from any library, whether its own or an outside library. Abstract classes often have abstract methods.
- If you want your abstract class to appear to be instantiable, define a factory constructor.
```
// Library a.dart
abstract class Vehicle {
  void moveForward(int meters);
}

// Library b.dart
import 'a.dart';

// Error: Cannot be constructed
Vehicle myVehicle = Vehicle();

// Can be extended
class Car extends Vehicle {
  int passengers = 4;
  // ···
}

// Can be implemented
class MockVehicle implements Vehicle {
  @override
  void moveForward(int meters) {
    // ...
  }
}
```

#### base.
##### To enforce inheritance of a class or mixin’s implementation, use the base modifier. A base class disallows implementation outside of its own library. This guarantees:
- The base class constructor is called whenever an instance of a subtype of the class is created.
- All implemented private members exist in subtypes.
- A new implemented member in a base class does not break subtypes, since all subtypes inherit the new member. This is true unless the subtype already declares a member with the same name and an incompatible signature.
- You must mark any class which implements or extends a base class as base, final, or sealed. This prevents outside libraries from breaking the base class guarantees.

```
// Library a.dart
base class Vehicle {
  void moveForward(int meters) {
    // ...
  }
}

// Library b.dart
import 'a.dart';

// Can be constructed
Vehicle myVehicle = Vehicle();

// Can be extended
base class Car extends Vehicle {
  int passengers = 4;
  // ...
}

// ERROR: Cannot be implemented
base class MockVehicle implements Vehicle {
  @override
  void moveForward() {
    // ...
  }
}
```

#### interface.
##### To define an interface, use the interface modifier. Libraries outside of the interface’s own defining library can implement the interface, but not extend it. This guarantees:
- When one of the class’s instance methods calls another instance method on this, it will always invoke a known implementation of the method from the same library.
- Other libraries can’t override methods that the interface class’s own methods might later call in unexpected ways. This reduces the fragile base class problem.
```
// Library a.dart
interface class Vehicle {
  void moveForward(int meters) {
    // ...
  }
}

// Library b.dart
import 'a.dart';

// Can be constructed
Vehicle myVehicle = Vehicle();

// ERROR: Cannot be inherited
class Car extends Vehicle {
  int passengers = 4;
  // ...
}

// Can be implemented
class MockVehicle implements Vehicle {
  @override
  void moveForward(int meters) {
    // ...
  }
}
```

#### abstract interface.
- The most common use for the interface modifier is to define a pure interface. Combine the interface and abstract modifiers for an abstract interface class.
- Like an interface class, other libraries can implement, but cannot inherit, a pure interface. Like an abstract class, a pure interface can have abstract members.

<br/>

#### final.
#### To close the type hierarchy, use the final modifier. This prevents subtyping from a class outside of the current library. Disallowing both inheritance and implementation prevents subtyping entirely. This guarantees:

- You can safely add incremental changes to the API.
- You can call instance methods knowing that they haven’t been overwritten in a third-party subclass.
- Final classes can be extended or implemented within the same library. The final modifier encompasses the effects of base, and therefore any subclasses must also be marked base, final, or sealed.

```
// Library a.dart
final class Vehicle {
  void moveForward(int meters) {
    // ...
  }
}

// Library b.dart
import 'a.dart';

// Can be constructed
Vehicle myVehicle = Vehicle();

// ERROR: Cannot be inherited
class Car extends Vehicle {
  int passengers = 4;
  // ...
}

class MockVehicle implements Vehicle {
  // ERROR: Cannot be implemented
  @override
  void moveForward(int meters) {
    // ...
  }
}

```
#### sealed.
- To create a known, enumerable set of subtypes, use the sealed modifier. This allows you to create a switch over those subtypes that is statically ensured to be exhaustive.

#### The sealed modifier prevents a class from being extended or implemented outside its own library. Sealed classes are implicitly abstract.

- They cannot be constructed themselves.
- They can have factory constructors.
- They can define constructors for their subclasses to use.
- Subclasses of sealed classes are, however, not implicitly abstract.

- The compiler is aware of any possible direct subtypes because they can only exist in the same library. This allows the compiler to alert you when a switch does not exhaustively handle all possible subtypes in its cases:
```
sealed class Vehicle {}

class Car extends Vehicle {}

class Truck implements Vehicle {}

class Bicycle extends Vehicle {}

// ERROR: Cannot be instantiated
Vehicle myVehicle = Vehicle();

// Subclasses can be instantiated
Vehicle myCar = Car();

String getVehicleSound(Vehicle vehicle) {
  // ERROR: The switch is missing the Bicycle subtype or a default case.
  return switch (vehicle) {
    Car() => 'vroom',
    Truck() => 'VROOOOMM',
  };
}
```
- If you don’t want exhaustive switching, or want to be able to add subtypes later without breaking the API, use the final modifier.

### 24- What is Enum ?
- Enum stands for enumerated type, a type of data where only a set of predefined values exist.
- In Dart, Enum is simply a special kind of class used to represent a fixed number of constant values.
- All enums automatically extend the Enum class. They are also sealed, meaning they cannot be subclassed, implemented, mixed in, or otherwise explicitly instantiated.
- Abstract classes and mixins can explicitly implement or extend Enum, but unless they are then implemented by or mixed into an enum declaration, no objects can actually implement the type of that class or mixin.
- makes the code readable and reusable.

```
enum OperatingSystem { macOS, windows, linux }
final favsystem=OperatingSystem.linux;
if(favsystem==OperatingSystem.linux){}
```

### 25- Difference Override and overload in programming ?
- Firstly, Dart doesn't support overloading.
- Overriding occurs when the method signature is the same in the superclass and the child class. 
- Overloading occurs when two or more methods in the same class have the same name but different parameters.
- Method overloading deals with the notion of having two or more methods in the same class with the same name but different arguments.
```
void foo(int a)
void foo(int a, float b)
```
- Method overriding means having two methods with the same arguments, but different implementations. One of them would exist in the parent class, while another will be in the derived, or child class. The @Override annotation, while not required, can be helpful to enforce proper overriding of a method at compile time.
```
class Parent {
    void foo(double d) {
        // do something
    }
}

class Child extends Parent {

    @Override
    void foo(double d){
        // this method is overridden.  
    }
}
```

### 26- Extenstions in dart?
- Extensions methods add functionality to existing libraries.
```
extension NumberParsing on String {}
```
### 27- Named Constructor?
- Giving your constructor different names allows your class to have many constructors and also to be better reoresent their use cases outside of the class.
- Image.asset().
- Image.network().

### 28- Factory constructor?
- factory keyword is used when implementing a constructor that doesn't always create a new instance of its class.
- it might return an instance os a subtype.
- it's used to initialize a final variable using logic that can't be handled in the initializer list.
### 29- Design patterns?
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

### 30- Iterables?
- Iterable is a collection of elements that can be accessed sequentially.
- Iterable is an abstract class .
- You can't instantiate it directly. You can create a new Iterable by creating new list.
- List => Read elements by their indexies.
- Set => Contain elements that occur once.
- Map => Read elements using key.
### 31- this keyword?
- Is used to remove ambiguisty that can be caused if the class attributes and the parameters have the same name.
- represent an implicit object pointing to the current class object.
- The this keyword is used to refer to the current class instance. this can be used to invoke the current class's constructors or methods. It also helps access the current class's instance variables. The this keyword can be used to set the instance variable's values or get the current instance of the class.
### 32- Types of streams?
- Streams provide an asynchronous sequence of data .
- data sequences include use-generated events and data read from files.
##### Types of Straems:
- Single Subscription Stream => Contains Sequence of events that are parts of a larger whole , Events need to be delivered in the correct order and without missing any of them. (read file , recieve web request). Such a stream can only be listened to once , listening again later could mean missing out on initial events. when you start listening, the data will be fetched and provided in chuncks.
- Broad Cast Stream => Intended for individual messages that can be handled one at a time . (Mouse events in a browser. You can start listening at any time and you get the events that are fired while you listen, more than a alistner can listen at the same time. and you can listen again after canceling a previous subscription.
### 33- Get, Post, Delete, update?
- The GET method is used to retrieve data from the server. This is a read-only method, so it has no risk of mutating or corrupting the data. For example, if we call the get method on our API, we’ll get back a list of all to-dos.
- The POST method sends data to the server and creates a new resource. The resource it creates is subordinate to some other parent resource. When a new resource is POSTed to the parent, the API service will automatically associate the new resource by assigning it an ID (new resource URI). In short, this method is used to create a new data entry.
- The PUT method is most often used to update an existing resource. If you want to update a specific resource (which comes with a specific URI), you can call the PUT method to that resource URI with the request body containing the complete new version of the resource you are trying to update.
- The PATCH method is very similar to the PUT method because it also modifies an existing resource. The difference is that for the PUT method, the request body contains the complete new version, whereas for the PATCH method, the request body only needs to contain the specific changes to the resource, specifically a set of instructions describing how that resource should be changed, and the API service will create a new version according to that instruction.
- The DELETE method is used to delete a resource specified by its URI.
- 

### 34- Blocprovider, bloclistener, blocbuilder, blocconsumer ?
- BlocProvider => Takes a Create function that is responsible for creating the Bloc or Cubit and a child which will have access to the instance via BlocProvider.of(context). It is used as a dependency injection (DI) widget so that a single instance of a Bloc or Cubit can be provided to multiple widgets within a subtree.
```
BlocProvider(
  create: (BuildContext context) => BlocA(),
  child: ChildA(),
);
```
- BlocBuilder => BlocBuilder handles building a widget in response to new states. BlocBuilder is analogous to StreamBuilder but has simplified API to reduce the amount of boilerplate code needed as well as bloc-specific performance improvements.
```
BlocBuilder<BlocA, BlocAState>(
  builder: (context, state) {
  // return widget here based on BlocA's state
  }
)
```
- BlocListener => Takes a BlocWidgetListener and an optional bloc and invokes the listener in response to state changes in the bloc. It should be used for functionality that needs to occur only in response to a state change such as navigation, showing a SnackBar, showing a Dialog, etc... The listener is guaranteed to only be called once for each state change unlike the builder in BlocBuilder.If the bloc parameter is omitted, BlocListener will automatically perform a lookup using BlocProvider and the current BuildContext.
```
BlocListener<BlocA, BlocAState>(
  listener: (context, state) {
    // do stuff here based on BlocA's state
  },
  child: Container(),
)
```
- The builder is run upon state change. But the builder function is also run when the framework deems necessary to rebuild.
- The listener function is not affected by the frameworks need to rebuild.
- BlocConsumer => BlocConsumer exposes a builder and listener in order react to new states. BlocConsumer is analogous to a nested BlocListener and BlocBuilder but reduces the amount of boilerplate needed. BlocConsumer should only be used when it is necessary to both rebuild UI and execute other reactions to state changes in the bloc. BlocConsumer takes a required BlocWidgetBuilder and BlocWidgetListener and an optional bloc, BlocBuilderCondition, and BlocListenerCondition. If the bloc parameter is omitted, BlocConsumer will automatically perform a lookup using BlocProvider and the current BuildContext.
```
BlocConsumer<BlocA, BlocAState>(
  listener: (context, state) {
    // do stuff here based on BlocA's state
  },
  builder: (context, state) {
    // return widget here based on BlocA's state
  }
)
```

### 35- listview, listview.builder?
- The ListView constructor requires us to create all items at once. This is good when list items are less and all will be seen on the screen, but if not then for long list items its not the good practice.
- the ListView.Builder constructor will create items as they are scrolled onto the screen like on-demand. This is the best practice for development for List widget where items will only render only when items are going seen on the screen.
### 36- AssetImage, Image.asset?
- Image is a StatefulWidget and Image.asset is just a named constructor, you can use it directly on your widget tree.
- AssetImage is an ImageProvider which is responsible for obtaining the image of the specified path.
- AssetImage => Image provider => provides an image from the pass , It is not a widget.
- Image.asset => Creates a widget.
### 37- What Does WidgetsFlutterBinding.ensureInitialized() do ?
- The WidgetFlutterBinding is used to interact with the Flutter engine.
- Ex. Firebase.initializeApp() needs to call native code to initialize Firebase, and since the plugin needs to use platform channels to call the native code, which is done asynchronously therefore you have to call ensureInitialized() to make sure that you have an instance of the WidgetsBinding.
- Returns an instance of the WidgetsBinding, creating and initializing it if necessary. If one is created, it will be a WidgetsFlutterBinding. If one was previously initialized, then it will at least implement WidgetsBinding.
- You only need to call this method if you need the binding to be initialized before calling runApp.
```
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
```
### 38- Json?
- Javascript object notation => It is a standard text-based format for representing structured data based on javascript object syntax.
- It is commonly used for transmitting data in web applications.

### 39- Difference between Bloc and Cubit?
- Cubit is a subset of the BLoC Pattern package that does not rely on events and instead uses methods to emit new states.
- Cubit is a subset of Bloc; so, it reduces complexity. Cubit eliminates the event classes. Cubit uses emit rather than yield to emit state. Since emit works synchronously, you can ensure that the state is updated in the next line.
- Cubit is not event driven.
- Bloc is event driven.

### 40- What is a context?
- A handle to the location of a widget in the widget tree.
- In Flutter, the context refers to the location of a widget in the widget tree. It provides information about the surrounding environment and services that the widget might need. For example, the context can contain information such as the theme of the app, the locale, the screen size, and more.

### 41- What is a key?
- Preserves state when widget move around in the widget tree.
- Keys can be found in almost every widget as named parameters. It is useful when we need to store the widget's state having the same type of data. It's used with a stateful widget where states change.
- You don't need to use Keys most of the time, the framework handles it for you and uses them internally to differentiate between widgets. There are a few cases where you may need to use them though.
- A common case is if you need to differentiate between widgets by their keys, ObjectKey and ValueKey can be useful for defining how the widgets are differentiated.
- Another example is that if you have a child you want to access from a parent, you can make a GlobalKey in the parent and pass it to the child's constructor. Then you can do globalKey.state to get the child's state (say for example in a button press callback). Note that this shouldn't be used excessively as there are often better ways to get around it.

### 42- What is a widget?
- A blueprint or recipe of what this part of the ui should be, And they appear with other widgets to complete the whole ui.
- Widgets are the central class hierarchy in the Flutter framework. A widget is an immutable description of part of a user interface. Widgets can be inflated into elements, which manage the underlying render tree.

### 43- The use of static keyword in dart ?
- static used for memory management of global data members.
- the static variables and methods are part of the class instead of a specific instance.
- used for class-level variable and method that is the same for every instance of a class.
- can't be overriden.
- can be accessed without the class prefix only in the class where they are declared.
- class name.static variable.

### 44- What is SDK ?
- Software development Kit => that includes a comprehensive set of development tools ( Emulator, Libraries, Debugger ).

### 45- What is an Api ?
- Application Programming Interface => Software intermediary that allows two applications to talk to each other .
- Apis are an accessible way to extract and share data within and across organizations .
- let your product or service communicate with other without having to know how they were implemented.

### 46- What is dependency injection ?
- Design Pattern used to implement inversion of control .
- It allows the creation of dependent objects outside of a class and provides those objects to a class through different ways.
- Is one of subtypes of inversion of control => decoupling.

### 47- What is PreferredSizeWidget ?
- An interface for widgets that can return the size this widget would prefer if it were otherwise unconstrained.
- There are a few cases, notably AppBar and TabBar, where it would be undesirable for the widget to constrain its own size but where the widget needs to expose a preferred or "default" size.
- Widgets that need to know the preferred size of their child can require that their child implement this interface by using this class rather than Widget as the type of their child property.
- Use PreferredSize to give a preferred size to an arbitrary widget.

### 48- What is WillPopScope class?
- Registers a callback to veto attempts by the user to dismiss the enclosing ModalRoute.
- Whenever the back button is pressed, you will get a callback at onWillPop, which returns a Future. If the Future returns true, the screen is popped.
```
class WillPopScopeExample extends StatefulWidget {
  const WillPopScopeExample({super.key});

  @override
  State<WillPopScopeExample> createState() => _WillPopScopeExampleState();
}

class _WillPopScopeExampleState extends State<WillPopScopeExample> {
  bool shouldPop = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return shouldPop;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter WillPopScope demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OutlinedButton(
                child: const Text('Push'),
                onPressed: () {
                  Navigator.of(context).push<void>(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return const WillPopScopeExample();
                      },
                    ),
                  );
                },
              ),
              OutlinedButton(
                child: Text('shouldPop: $shouldPop'),
                onPressed: () {
                  setState(
                    () {
                      shouldPop = !shouldPop;
                    },
                  );
                },
              ),
              const Text('Push to a new screen, then tap on shouldPop '
                  'button to toggle its value. Press the back '
                  'button in the appBar to check its behavior '
                  'for different values of shouldPop'),
            ],
          ),
        ),
      ),
    );
  }
}
```
### 49- Spacer class ?
- Spacer creates an adjustable, empty spacer that can be used to tune the spacing between widgets in a Flex container, like Row or Column.
- The Spacer widget will take up any available space, so setting the Flex.mainAxisAlignment on a flex container that contains a Spacer to MainAxisAlignment.spaceAround, MainAxisAlignment.spaceBetween, or MainAxisAlignment.spaceEvenly will not have any visible effect: the Spacer has taken up all of the additional space, therefore there is none left to redistribute.

### 50 - callback and anonymous functions ?
- callback => a function or method that we pass as an argument into another function or method.
- VoidCallback typedef => Signature of callbacks that have no arguments and return no data.
```
typedef VoidCallback = void Function();
```
- anonymous => doesn't have a name
```
list.foreach((item){});
```
### 51- Scaffold ?
- is responsible for implementing the basic material design , visual layout structure of an app.
### 52- super keyword ?
- is used to denote the instant parent class object of the current child class .
- It's used to invoke super class methods , super class constructor in its child class.
- to refer the super class properties and methods.
### 53- Materialapp ?
- A convenience widget that wraps a number of widgets that are commonly required for Material Design applications. It builds upon a WidgetsApp by adding material-design specific functionality, such as AnimatedTheme and GridPaper.
- MaterialApp configures its WidgetsApp.textStyle with an ugly red/yellow text style that's intended to warn the developer that their app hasn't defined a default text style. Typically the app's Scaffold builds a Material widget whose default Material.textStyle defines the text style for the entire scaffold.
- Material widgets implements the Material design language for iOS, Android, and web.
- Cupertino widgets implements the current iOS design language based on Apple's Human Interface Guidelines.
### 54- runapp ?
```
void runApp(
Widget app
)
```
- Inflate the given widget and attach it to the screen.
- The widget is given constraints during layout that force it to fill the entire screen. If you wish to align your widget to one side of the screen (e.g., the top), consider using the Align widget. If you wish to center your widget, you can also use the Center widget.
- Calling runApp again will detach the previous root widget from the screen and attach the given widget in its place. The new widget tree is compared against the previous widget tree and any differences are applied to the underlying render tree, similar to what happens when a StatefulWidget rebuilds after calling State.setState.
- The main() function is the entry point of the app and it is the first method that is executed when the app starts.
- The runApp() method is responsible for creating the WidgetsFlutterBinding which is the binding between the framework and the Flutter engine.

### 55- Changenotifier?
- A class that can be extended or mixed in that provides a change notification API using VoidCallback for notifications.
- A data structure can extend or mix in ChangeNotifier to implement the Listenable interface and thus become usable with widgets that listen for changes to Listenables, such as ListenableBuilder.
### 56- ListenableBuilder class?
- A general-purpose widget for building a widget subtree when a Listenable changes.
- ListenableBuilder is useful for more complex widgets that wish to listen to changes in other objects as part of a larger build function. To use ListenableBuilder, construct the widget and pass it a builder function.
- Any subtype of Listenable (such as a ChangeNotifier, ValueNotifier, or Animation) can be used with a ListenableBuilder to rebuild only certain parts of a widget when the Listenable notifies its listeners. Although they have identical implementations, if an Animation is being listened to, consider using an AnimatedBuilder instead for better readability.
```
import 'package:flutter/material.dart';

/// Flutter code sample for a [ChangeNotifier] with a [ListenableBuilder].

void main() {
  runApp(const ListenableBuilderExample());
}

class CounterModel with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count += 1;
    notifyListeners();
  }
}

class ListenableBuilderExample extends StatefulWidget {
  const ListenableBuilderExample({super.key});

  @override
  State<ListenableBuilderExample> createState() =>
      _ListenableBuilderExampleState();
}

class _ListenableBuilderExampleState extends State<ListenableBuilderExample> {
  final CounterModel _counter = CounterModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('ListenableBuilder Example')),
        body: CounterBody(counterNotifier: _counter),
        floatingActionButton: FloatingActionButton(
          onPressed: _counter.increment,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class CounterBody extends StatelessWidget {
  const CounterBody({super.key, required this.counterNotifier});

  final CounterModel counterNotifier;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Current counter value:'),
          // Thanks to the ListenableBuilder, only the widget displaying the
          // current count is rebuilt when counterValueNotifier notifies its
          // listeners. The Text widget above and CounterBody itself aren't
          // rebuilt.
          ListenableBuilder(
            listenable: counterNotifier,
            builder: (BuildContext context, Widget? child) {
              return Text('${counterNotifier.count}');
            },
          ),
        ],
      ),
    );
  }
}
```
### 57 - VlueNotifier ?
- A ChangeNotifier that holds a single value.
- When value is replaced with something that is not equal to the old value as evaluated by the equality operator ==, this class notifies its listeners.
- Because this class only notifies listeners when the value's identity changes, listeners will not be notified when mutable state within the value itself changes.
- For example, a ValueNotifier<List<int>> will not notify its listeners when the contents of the list are changed.
As a result, this class is best used with only immutable data types.
For mutable data types, consider extending ChangeNotifier directly.

### 58- notifylisteners ?
- Call all the registered listeners.
- Call this method whenever the object changes, to notify any clients the object may have changed. Listeners that are added during this iteration will not be visited. Listeners that are removed during this iteration will not be visited after they are removed.

### 59- Difference between inkwell and gesturedetector ?
- They both provide many common features like onTap, onLongPress etc. The main difference is GestureDetector provides more controls like dragging etc. on the other hand it doesn't include ripple effect tap, which InkWell does.
- You can use either of them according to your needs, you want ripple effects go with InkWell, need more controls go with GestureDetector or even combine both of them.

### 60- ColorScheme ?
- primary => The color displayed most frequently across your app’s screens and components.
- onPrimary => A color that's clearly legible when drawn on primary.
- secondary => An accent color used for less prominent components in the UI, such as filter chips, while expanding the opportunity for color expression.
- error => The color to use for input validation errors, e.g. for InputDecoration.errorText.
- surface => The background color for widgets like Card.
- background => A color that typically appears behind scrollable content.
### 61- Textfield and textformfield ?
- If you making a Form where you require save, reset, or validate operations- use TextFormField. Else For Simple user input capture TextField is sufficient.
- TextFormField, which integrates with the Form widget.
- A Form ancestor is not required. The Form simply makes it easier to save, reset, or validate multiple fields at once.
- TextField, which is the underlying text field without the Form integration.
- Form class
An optional container for grouping together multiple form field widgets (e.g. TextField widgets).
Each individual form field should be wrapped in a FormField widget, with the Form widget as a common ancestor of all of those. Call methods on FormState to save, reset, or validate each FormField that is a descendant of this Form. To obtain the FormState, you may use Form.of with a context whose ancestor is the Form, or pass a GlobalKey to the Form constructor and call GlobalKey.currentState.
```
import 'package:flutter/material.dart';

/// Flutter code sample for [Form].

void main() => runApp(const FormExampleApp());

class FormExampleApp extends StatelessWidget {
  const FormExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Form Sample')),
        body: const FormExample(),
      ),
    );
  }
}

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
```
