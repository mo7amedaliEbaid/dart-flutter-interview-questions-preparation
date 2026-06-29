// Here's an example demonstrating the difference between Single Subscription Streams and Broadcast Streams in Dart:
//
// Code Example:
// dart
// Copy code
// import 'dart:async';
//
// void main() {
//   // Example 1: Single Subscription Stream
//   print('Single Subscription Stream Example:');
//   singleSubscriptionStreamExample();
//
//   // Example 2: Broadcast Stream
//   print('\nBroadcast Stream Example:');
//   broadcastStreamExample();
// }
//
// void singleSubscriptionStreamExample() {
//   // Creating a Single Subscription Stream
//   StreamController<int> singleController = StreamController<int>();
//
//   // Adding data to the stream
//   singleController.add(1);
//   singleController.add(2);
//   singleController.add(3);
//   singleController.close();
//
//   // Attaching the first listener
//   singleController.stream.listen((data) {
//     print('Listener 1: Received $data');
//   });
//
//   // Uncommenting the following code will cause an error because
//   // Single Subscription Streams allow only one listener.
//   // singleController.stream.listen((data) {
//   //   print('Listener 2: Received $data');
//   // });
// }
//
// void broadcastStreamExample() {
//   // Creating a Broadcast Stream
//   StreamController<int> broadcastController = StreamController<int>.broadcast();
//
//   // Adding listeners before adding data
//   broadcastController.stream.listen((data) {
//     print('Listener 1: Received $data');
//   });
//
//   broadcastController.stream.listen((data) {
//     print('Listener 2: Received $data');
//   });
//
//   // Adding data to the stream
//   broadcastController.add(1);
//   broadcastController.add(2);
//   broadcastController.add(3);
//   broadcastController.close();
//
//   // Adding a listener after adding data
//   broadcastController.stream.listen((data) {
//     print('Listener 3: Received $data (Late Listener)');
//   });
// }
// Explanation:
// 1. Single Subscription Stream:
// A single listener can subscribe to the stream.
// Once the listener is attached, the stream emits the events in order.
// If you try to add a second listener, it throws an error.
// Output:
// yaml
// Copy code
// Single Subscription Stream Example:
// Listener 1: Received 1
// Listener 1: Received 2
// Listener 1: Received 3
// 2. Broadcast Stream:
// Multiple listeners can subscribe to the stream.
// All listeners receive the same data simultaneously when it's emitted.
// Late subscribers won't receive events emitted before they started listening.
// Output:
// yaml
// Copy code
// Broadcast Stream Example:
// Listener 1: Received 1
// Listener 2: Received 1
// Listener 1: Received 2
// Listener 2: Received 2
// Listener 1: Received 3
// Listener 2: Received 3
// Listener 3: Received 3 (Late Listener)
// Key Takeaways:
// Use Single Subscription Streams for tasks like file reading or network requests, where only one listener is needed.
// Use Broadcast Streams for scenarios like event broadcasting or when multiple listeners need the same data simultaneously.
import 'dart:async';

void main() {
  // Example 1: Single Subscription Stream
  print('Single Subscription Stream Example:');
  singleSubscriptionStreamExample();

  // Example 2: Broadcast Stream
  print('\nBroadcast Stream Example:');
  broadcastStreamExample();
}

void singleSubscriptionStreamExample() {
  // Creating a Single Subscription Stream
  StreamController<int> singleController = StreamController<int>();

  // Adding data to the stream
  singleController.add(1);
  singleController.add(2);
  singleController.add(3);
  singleController.close();

  // Attaching the first listener
  singleController.stream.listen((data) {
    print('Listener 1: Received $data');
  });

  // Uncommenting the following code will cause an error because
  // Single Subscription Streams allow only one listener.
  // singleController.stream.listen((data) {
  //   print('Listener 2: Received $data');
  // });
}

void broadcastStreamExample() {
  // Creating a Broadcast Stream
  StreamController<int> broadcastController = StreamController<int>.broadcast();

  // Adding listeners before adding data
  broadcastController.stream.listen((data) {
    print('Listener 1: Received $data');
  });

  broadcastController.stream.listen((data) {
    print('Listener 2: Received $data');
  });

  // Adding data to the stream
  broadcastController.add(1);
  broadcastController.add(2);
  broadcastController.add(3);
  broadcastController.close();

  // Adding a listener after adding data
  broadcastController.stream.listen((data) {
    print('Listener 3: Received $data (Late Listener)');
  });
}
