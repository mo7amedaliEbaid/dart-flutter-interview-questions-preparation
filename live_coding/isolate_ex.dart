import 'dart:isolate';

void main() async {
  // Create a ReceivePort to receive messages from the spawned isolate
  final receivePort = ReceivePort();

  // Spawn a new isolate
  final isolate = await Isolate.spawn(isolateFunction, receivePort.sendPort);

  // Listen for messages from the spawned isolate
  receivePort.listen((message) {
    print('Received message from spawned isolate: $message');
  });

  // Print what Isolate.spawn returns (Isolate object)
  print('Isolate.spawn returned: $isolate');

  // Get the SendPort from the ReceivePort
  final sendPort = receivePort.sendPort;

  // Send a message to the spawned isolate
  sendPort.send('Hello from main isolate!');
}

void isolateFunction(SendPort sendPort) {
  // Receive messages from the main isolate
  ReceivePort receivePort = ReceivePort();
  sendPort.send(receivePort.sendPort);

  // Listen for messages from the main isolate
  receivePort.listen((message) {
    print('Received message from main isolate: $message');
  });

  // Send a message to the main isolate
  sendPort.send('Hello from spawned isolate!');
}
// import 'dart:async';
// import 'dart:isolate';
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Counter with Isolates',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: CounterPage(),
//     );
//   }
// }
//
// class CounterPage extends StatefulWidget {
//   @override
//   _CounterPageState createState() => _CounterPageState();
// }
//
// class _CounterPageState extends State<CounterPage> {
//   int _counter = 0;
//
//   // ReceivePort for listening to messages from the isolate
//   final ReceivePort _receivePort = ReceivePort();
//
//   // Isolate instance
//   Isolate? _isolate;
//
//   @override
//   void initState() {
//     super.initState();
//     // Spawn the isolate when the page initializes
//     _spawnIsolate();
//   }
//
//   @override
//   void dispose() {
//     // Dispose of the isolate when the page is disposed
//     _isolate?.kill(priority: Isolate.immediate);
//     super.dispose();
//   }
//
//   // Method to spawn the isolate
//   void _spawnIsolate() async {
//     _isolate = await Isolate.spawn(_isolateEntryPoint, _receivePort.sendPort);
//
//     // Listen for messages from the isolate
//     _receivePort.listen((message) {
//       setState(() {
//         _counter = message as int; // Update the counter value
//       });
//     });
//   }
//
//   // Method to send a message to the isolate
//   void _incrementCounter() {
//     _isolate?.send(_counter + 1);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Counter with Isolates'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Counter Value:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// // Entry point for the isolate
// void _isolateEntryPoint(SendPort sendPort) {
//   final ReceivePort receivePort = ReceivePort();
//   sendPort.send(receivePort.sendPort); // Send the SendPort to the main isolate
//
//   int counter = 0;
//   receivePort.listen((message) {
//     counter = message as int; // Update the counter value
//     sendPort.send(counter); // Send the updated counter value back to the main isolate
//   });
// }