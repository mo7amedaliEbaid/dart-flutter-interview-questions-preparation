// What is MVI?
// MVI (Model-View-Intent) is a reactive architectural pattern designed for unidirectional data flow.
// It's an evolution of the MVVM and Redux patterns. MVI focuses on managing state predictably, making it particularly useful for UI frameworks like Flutter.
//
// Core Concepts of MVI
// Model:
//
// Represents the state of the UI.
// Handles business logic and interacts with data sources (e.g., APIs, databases).
// View:
//
// Displays the current state of the UI.
// Sends user actions (intents) to the Intent layer.
// Intent:
//
// Captures user interactions and expresses them as events or intents.
// These intents are processed by the business logic to update the Model, which updates the View.
// Unidirectional Data Flow:
//
// Data flows in a single direction: Intent → Model → View.
// Implementation of MVI in Flutter
// Let's create a simple counter app using MVI.
//
// 1. Model (State Management)
// The Model contains the state of the app and handles business logic.
//
// dart
// Copy code
// enum CounterAction { increment, decrement }
//
// class CounterState {
//   final int counter;
//
//   CounterState(this.counter);
//
//   CounterState copyWith({int? counter}) {
//     return CounterState(counter ?? this.counter);
//   }
// }
// 2. Intent (User Actions)
// Define intents based on user actions. These are enums or specific events that the user triggers.
//
// dart
// Copy code
// abstract class CounterIntent {}
//
// class IncrementIntent extends CounterIntent {}
//
// class DecrementIntent extends CounterIntent {}
// 3. View
// The View displays the current state and sends user actions to the Intent.
//
// dart
// Copy code
// import 'package:flutter/material.dart';
// import 'counter_state.dart';
// import 'counter_intent.dart';
//
// class CounterView extends StatelessWidget {
//   final CounterState state;
//   final void Function(CounterIntent intent) onIntent;
//
//   CounterView({required this.state, required this.onIntent});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MVI Counter'),
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
//               '${state.counter}',
//               style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => onIntent(IncrementIntent()),
//                   child: Text('Increment'),
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () => onIntent(DecrementIntent()),
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
// 4. Controller (Business Logic)
// The Controller acts as a bridge between the Intent and Model. It processes intents and updates the state accordingly.
//
// dart
// Copy code
// import 'dart:async';
// import 'counter_intent.dart';
// import 'counter_state.dart';
//
// class CounterController {
//   final _stateController = StreamController<CounterState>();
//   CounterState _state = CounterState(0);
//
//   Stream<CounterState> get stateStream => _stateController.stream;
//
//   void handleIntent(CounterIntent intent) {
//     if (intent is IncrementIntent) {
//       _state = _state.copyWith(counter: _state.counter + 1);
//     } else if (intent is DecrementIntent) {
//       _state = _state.copyWith(counter: _state.counter - 1);
//     }
//     _stateController.sink.add(_state);
//   }
//
//   void dispose() {
//     _stateController.close();
//   }
// }
// 5. Main Function
// Finally, connect all components in the main.dart file.
//
// dart
// Copy code
// import 'package:flutter/material.dart';
// import 'counter_view.dart';
// import 'counter_controller.dart';
// import 'counter_intent.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final controller = CounterController();
//
//     return MaterialApp(
//       home: StreamBuilder<CounterState>(
//         stream: controller.stateStream,
//         initialData: CounterState(0),
//         builder: (context, snapshot) {
//           return CounterView(
//             state: snapshot.data!,
//             onIntent: controller.handleIntent,
//           );
//         },
//       ),
//     );
//   }
// }
// Explanation of Workflow
// View:
//
// Displays the state and listens for user input.
// Dispatches intents (user actions) to the controller.
// Intent:
//
// Encapsulates user actions as events.
// Controller:
//
// Processes intents and updates the model state.
// Emits new states via a stream.
// Model:
//
// Holds the application state and provides methods to modify it.
// Advantages of MVI in Flutter
// Unidirectional Data Flow:
//
// Makes state management predictable and easier to debug.
// Reactive UI:
//
// Automatically updates when the state changes.
// Scalable:
//
// Suitable for large applications with complex state management.
// Disadvantages
// Boilerplate:
// Involves more code compared to simpler patterns.
// Learning Curve:
// Can be complex for beginners to grasp.
// Conclusion
// MVI provides a structured way to manage state in Flutter, offering predictability and scalability.
// It's particularly powerful when paired with reactive programming concepts like Streams or libraries like Bloc or RxDart.