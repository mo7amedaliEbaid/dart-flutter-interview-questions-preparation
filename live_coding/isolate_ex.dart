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