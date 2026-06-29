// What is MVC?
// MVC (Model-View-Controller) is a software architectural pattern used to separate concerns within an application. It organizes code into three interconnected components:
//
// Model:
//
// Manages the data, logic, and rules of the application.
// Represents the structure of data and methods to fetch, save, or update it.
// In Flutter, this could be a Dart class representing data objects or services interacting with APIs.
// View:
//
// Displays the user interface (UI) and listens to user input.
// Represents the UI in a way that reflects the data from the Model.
// In Flutter, this could be StatelessWidget or StatefulWidget.
// Controller:
//
// Acts as an intermediary between Model and View.
// Listens to input from the View, processes it, and updates the Model.
// In Flutter, this could be a class responsible for handling business logic and communication between the View and Model.
// Implementation of MVC in Dart/Flutter
// Let's create a simple example of an MVC structure in Flutter: a counter app.
//
// Model
// The Model contains the data and logic. Here, it's a simple counter.
//
// dart
// Copy code
// class CounterModel {
//   int _counter = 0;
//
//   int get counter => _counter;
//
//   void increment() {
//     _counter++;
//   }
//
//   void decrement() {
//     _counter--;
//   }
// }
// View
// The View is the UI layer and calls the Controller when actions are performed.
//
// dart
// Copy code
// import 'package:flutter/material.dart';
// import 'counter_controller.dart';
//
// class CounterView extends StatelessWidget {
//   final CounterController controller;
//
//   CounterView({required this.controller});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MVC Counter'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Counter Value:',
//               style: TextStyle(fontSize: 20),
//             ),
//             Text(
//               '${controller.model.counter}',
//               style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: controller.increment,
//                   child: Text('Increment'),
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: controller.decrement,
//                   child: Text('Decrement'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// Controller
// The Controller handles input from the View and updates the Model accordingly.
//
// dart
// Copy code
// import 'counter_model.dart';
//
// class CounterController {
//   final CounterModel model;
//
//   CounterController(this.model);
//
//   void increment() {
//     model.increment();
//   }
//
//   void decrement() {
//     model.decrement();
//   }
// }
// Main Function
// Finally, wire up the components in the main.dart file.
//
// dart
// Copy code
// import 'package:flutter/material.dart';
// import 'counter_model.dart';
// import 'counter_controller.dart';
// import 'counter_view.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final model = CounterModel();
//     final controller = CounterController(model);
//
//     return MaterialApp(
//       home: CounterView(controller: controller),
//     );
//   }
// }
// Explanation of Workflow
// View: Displays the counter and has buttons to trigger actions.
// Controller: Handles button taps, updating the Model.
// Model: Updates the counter value.
// View: Reflects the updated counter value when the widget rebuilds.
// Advantages of MVC in Flutter
// Separation of Concerns: Keeps logic, data, and UI separate, making code more maintainable.
// Testability: Each layer can be tested independently.
// Scalability: Easier to manage and scale as the project grows.
// Disadvantages
// Boilerplate Code: Requires more setup with separate classes for simple apps.
// Communication Overhead: More complex interactions between components might require additional management.
// For more complex Flutter apps, alternative patterns like Provider, BLoC, or GetX are often preferred.
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = CounterModel();
    final controller = CounterController(model);

    return MaterialApp(
      home: CounterView(controller: controller),
    );
  }
}

class CounterController {
  final CounterModel model;

  CounterController(this.model);

  void increment() {
    model.increment();
  }

  void decrement() {
    model.decrement();
  }
}

class CounterModel {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
  }

  void decrement() {
    _counter--;
  }
}


class CounterView extends StatelessWidget {
  final CounterController controller;

  CounterView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVC Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter Value:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '${controller.model.counter}',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: controller.increment,
                  child: Text('Increment'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: controller.decrement,
                  child: Text('Decrement'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


