# Multipart Request
## Creating a Multipart Request
- To create a multipart request, you first need to create an instance of the http.MultipartRequest class. The constructor for this class takes two arguments: the request method and the URL of the server.

- For example, the following code creates a multipart request with the POST method and the URL https://example.com/upload:

```dart
var request = http.MultipartRequest('POST', Uri.parse('https://example.com/upload'));
```

## Adding Files to a Multipart Request
- Once you have created a multipart request, you can add files to it using the files property. The files property is a list of http.MultipartFile objects.

- A http.MultipartFile object represents a file that is being uploaded to the server. The constructor for this object takes two arguments: the name of the file and the path to the file.

- For example, the following code adds a file named image.png to the multipart request:
```dart
request.files.add(await http.MultipartFile.fromPath('image', 'path/to/image.png'));
```

## Sending a Multipart Request
- Once you have added all of the files and data to the multipart request, you can send it to the server using the send() method. The send() method returns a Future object. The Future object will complete with the response from the server.

- For example, the following code sends the multipart request to the server and prints the response status code:
```dart
var response = await request.send();
print(response.statusCode);
```
![multipartrequest](https://github.com/mo7amedaliEbaid/dart-flutter-interview-questions-preparation/assets/131966482/a2e6c0e4-66d9-4eef-ba04-d33843bf5b39)

# Integrating Socket IO Client
- Web socket is a two-way, full duplex communication technology, in which the transmission of data is real-time and bi-directional. While Socket.io is a popular library used to implement web sockets.
-  The server side can be built on NodeJS, while this is the client-side integration in Flutter.
## How does it work?
- Our flutter app will be considered as a Client, while your backend is considered as Server and we will be establishing a bi-directional and real-time data transmission between them using Socket IO. Below are the flow steps you need to follow for successful data transmission.

- First, we have to build a connection with the server.
- Your app will be listening to events, so if a new event arrives, your UI will reflect it immediately (Like listening to new messages in Chat).
- You can emit events, maybe when you want to broadcast some data to your backend (Like emitting a new message to Chat).
- Don’t forget to close the connection between client and server.
## How to code
- Add socket_io_client package in your pubspec.yaml as a dependency:
- Establish the connection to the socket server as soon as the user opens Chat Page,
```dart
  IO.Socket socket;
@override
void initState() {
  initSocket();
  super.initState();
}
initSocket() {
  socket = IO.io(APIConstants.socketServerURL, <String, dynamic>{
    'autoConnect': false,
    'transports': ['websocket'],
  });
  socket.connect();
  socket.onConnect((_) {
    print('Connection established');
  });
  socket.onDisconnect((_) => print('Connection Disconnection'));
  socket.onConnectError((err) => print(err));
  socket.onError((err) => print(err));
}

```
- When the connection is established, the onConnect callback will be triggered and you can add your logic there, let’s say you want to get all messages or maybe listen for new messages, you can do that all here.

- To add a listener, you can use socket.on(), and it will start listening to new events and will be triggered on all emits that happen on the socket server.
```dart
socket.on('getMessageEvent', (newMessage) {
  messageList.add(MessageModel.fromJson(data));
});
```
- To emit an event, you can use socket.emit(), like this (The map may be different in your case):
```dart
sendMessage() {
  String message = textEditingController.text.trim();
  if (message.isEmpty) return;
  Map messageMap = {
    'message': message,
    'senderId': userId,
    'receiverId': receiverId,
    'time': DateTime.now().millisecondsSinceEpoch,
  };
  socket.emit('sendNewMessage', messageMap);
}
```

# MVVM, MVP, MVC.
![archPatterns](https://github.com/mo7amedaliEbaid/dart-flutter-interview-questions-preparation/assets/131966482/33bc19cc-1f82-41b5-b9bf-0c5d3c1bebc7)

correct=> in mvc The Controller does pass back the Model, so there is knowledge between the View and the expected Model being passed into it, but not the Controller serving it up.

# stack, heap.

![memory](https://github.com/mo7amedaliEbaid/dart-flutter-interview-questions-preparation/assets/131966482/0af322e4-0647-4ce4-a66b-303db1161cb6)
