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


![arch](https://github.com/mo7amedaliEbaid/dart-flutter-interview-questions-preparation/assets/131966482/828fc6a1-995b-4ead-ad9b-c40bb69466ad)
![arch1](https://github.com/mo7amedaliEbaid/dart-flutter-interview-questions-preparation/assets/131966482/74d8e43f-ec12-4c56-b8be-28bc94169ec4)
![arch2](https://github.com/mo7amedaliEbaid/dart-flutter-interview-questions-preparation/assets/131966482/d40d0d97-8bd7-4e7a-9ee2-70a1d798f40a)

![archPatterns](https://github.com/mo7amedaliEbaid/dart-flutter-interview-questions-preparation/assets/131966482/33bc19cc-1f82-41b5-b9bf-0c5d3c1bebc7)

correct=> in mvc The Controller does pass back the Model, so there is knowledge between the View and the expected Model being passed into it, but not the Controller serving it up.

# stack, heap.

![memory](https://github.com/mo7amedaliEbaid/dart-flutter-interview-questions-preparation/assets/131966482/0af322e4-0647-4ce4-a66b-303db1161cb6)

# pusher
### Install the library
- Add the library as a dependency to your project.
```
flutter pub add pusher_channels_flutter
```
### Create a connection
- Open a connection to Channels using the key and cluster you copied earlier.
```dart
await pusher.init(
  apiKey: API_KEY,
  cluster: API_CLUSTER
);
await pusher.connect();
```
### Subscribe to a public channel
- Before your web app can receive the event you publish, your web app needs to subscribe to the my-channel channel channel. Do this with pusher.subscribe.
```dart
final myChannel = await pusher.subscribe(
  channelName: "my-channel"
  onEvent: onEvent
);
```
###  Listen for events
- Once you have created an instance of Channel, set up event listener.
```dart
void onEvent(PusherEvent event) {
  log("onEvent: $event");
}
```

# TestFlight
- TestFlight is an online service for over-the-air installation and testing of mobile applications, currently owned by Apple Inc. and only offered to developers within the iOS Developer Program.Developers sign up with the service to distribute applications to internal or external beta testers, who can subsequently send feedback about the application to developers.The TestFlight SDK additionally allows developers to receive remote logs, crash reports and tester feedback.
## Firebase dynamic links
- Firebase Dynamic Links is a feature provided by Google's Firebase platform that enables developers to create and manage deep links dynamically. Deep links are URLs that can navigate users directly to specific content or features within a mobile app, rather than just launching the app's home screen. Firebase Dynamic Links are particularly useful for scenarios like referral programs, content sharing, and user engagement.
```dart
void checkToProvider(Uri deepLink) {
    if (deepLink.queryParameters.containsKey('')) {
      final String? provider = deepLink.queryParameters['provider'];
      //do something
      Navigator.pushNamed(navigatorKey.currentState!.context, BRANCHES_SCREEN,
          arguments: BranchesParams(provider_id: int.parse(provider ?? '0')));
    }
  }
```
```dart
 Future<Uri> createDynamicLink(String path, String provider) async {
    var encoded = Uri.encodeFull('');
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      link: Uri.parse(encoded),
      uriPrefix: '',
      androidParameters: AndroidParameters(packageName: packageName),
      iosParameters: IOSParameters(bundleId: packageName, appStoreId: ''),
    );

    final dynamicUrl = await FirebaseDynamicLinks.instance.buildShortLink(parameters);
    debugPrint(dynamicUrl.shortUrl.toString());
    return dynamicUrl.shortUrl;
  }
```

## ShoreBird
- Shorebird is a set of tools that allow you to build and deploy new versions of your Flutter app directly to your users' devices.
### Shorebird consists of 3 major parts:

- shorebird line tool that you use to build and deploy your app.
- A modified Flutter engine that you include in your app.
- Our public-cloud based infrastructure which hosts your app's updates.

## what is one signal notifications, how to use it with flutter?
- OneSignal is a popular mobile and web push notification service that allows developers to send messages to users across different platforms. It supports iOS, Android, and web applications. OneSignal provides a straightforward way to integrate push notifications into your Flutter app. Here's a basic guide on how to use OneSignal with Flutter:

### Code
- Add OneSignal Plugin:
```
dependencies:
  onesignal_flutter: ^latest_version
```
- Initialize OneSignal:
```dart
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize OneSignal
    OneSignal.shared.setAppId("YOUR_ONESIGNAL_APP_ID");
    
    return MaterialApp(
      title: 'My Flutter App',
      home: MyHomePage(),
    );
  }
}
```
- Handle Notifications:
- To handle notifications in your Flutter app, listen to the OneSignal.shared.setNotificationReceivedHandler callback. This callback is triggered when a notification is received:

```dart
OneSignal.shared.setNotificationReceivedHandler(
  (OSNotification notification) {
    // Handle notification received
    print("Notification received: ${notification.jsonRepresentation()}");
  },
);
```
- Navigate to a Specific Screen on Notification Click:
```dart
OneSignal.shared.setNotificationOpenedHandler(
  (OSNotificationOpenedResult result) {
    // Handle notification opened
    print("Notification opened: ${result.notification.jsonRepresentation()}");

    // Navigate to a specific screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => YourTargetScreen()),
    );
  },
);
```
- Send Test Notifications from OneSignal Dashboard:

- In the OneSignal dashboard, you can send test notifications to your app to verify that the integration is working correctly.

## Difference betweeb FCM, One Signal?
- Support for SMS and email notifications: OneSignal allows you to send notifications to your users via SMS and email, in addition to push notifications. This can be helpful if you want to reach your users even if they don't have their app open or if they have push notifications turned off.
- Advanced segmentation and targeting: OneSignal offers a variety of advanced segmentation and targeting options, such as the ability to target users based on their location, in-app behavior, and other factors. This can help you to send more relevant and timely notifications to your users.
- Ease of use: Both OneSignal and FCM are relatively easy to use, but OneSignal is generally considered to be more user-friendly. OneSignal offers a variety of no-code tools and features, such as a drag-and-drop notification builder and pre-built templates. FCM also offers a variety of tools and features, but they are generally more geared towards developers.

## just in time , ahead of time in flutter.
- In Flutter, there are two compilation modes: Just-In-Time (JIT) and Ahead-Of-Time (AOT). These compilation modes serve different purposes in the Flutter development lifecycle.

### Just-In-Time (JIT):

- Purpose: JIT compilation is primarily used during development to provide a faster development cycle. It allows you to see changes to your code immediately without the need for a full restart of the application.
- How to Run with JIT: During development, when you use the flutter run command without additional flags, Flutter runs in JIT mode by default.

### Ahead-Of-Time (AOT):

- Purpose: AOT compilation is used for production-ready builds. It involves compiling the Dart code into native machine code ahead of time, resulting in a smaller and more optimized binary size. AOT compilation is beneficial for improving the startup performance and reducing the size of the final application.
- How to Build with AOT: To create a release build with AOT compilation, you can use the --release flag.

#### In summary, during development, you typically use JIT for a faster development cycle, and for production releases, you use AOT for better performance and a smaller application size. The choice between JIT and AOT depends on the specific requirements of your project and whether you are in the development or production phase.
## debug , profile and release modes in flutter.
- In Flutter, there are three primary build modes that serve different purposes: Debug mode, Profile mode, and Release mode. Each mode has specific characteristics tailored for various stages of development and deployment.

### Debug Mode:

- Purpose: Debug mode is used during development to enable features like hot-reload, a more extensive set of debugging tools, and additional checks to aid in identifying and fixing issues.
- How to Run in Debug Mode:
```
flutter run
```
- By default, flutter run uses the debug mode.

### Profile Mode:

- Purpose: Profile mode is a middle ground between Debug and Release modes. It includes some optimizations similar to Release mode but still retains debugging information for profiling and analyzing performance.
- How to Run in Profile Mode:
```
flutter run --profile
```
### Release Mode:

- Purpose: Release mode is intended for producing optimized and stripped-down versions of your application for deployment. It includes aggressive optimizations to reduce the size and improve performance.

- How to Build in Release Mode:
```
flutter build <platform> --release
```
### In summary:

- Debug mode is for development with a focus on debugging tools and a faster development cycle.
- Profile mode is for profiling and performance analysis while still retaining some debugging capabilities.
- Release mode is for deploying the optimized and minimized version of your application for production.
- When developing and testing your application, you may often use the default debug mode. However, for performance testing and preparing your app for release, you'll want to test and build in profile and release modes, respectively.
