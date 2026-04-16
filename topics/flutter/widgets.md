## What is the difference between StatelessWidget and StatefulWidget in Flutter?
#### Answer:
- StatelessWidget is immutable and does not have mutable state. It is used for UI elements that don't change over time.
- StatefulWidget can hold mutable state and can be rebuilt dynamically, making it suitable for elements that can change.


## Compare ListView and GridView in Flutter. When would you use one over the other?
#### Answer:
- ListView displays a scrollable list of widgets vertically or horizontally.
- GridView displays a 2D array of widgets, allowing for a grid layout.
- Use ListView for a single-column list, and GridView for a 2D grid or a list with multiple columns.


## What distinguishes Container and Padding widgets in Flutter?
#### Answer:
- Container is a versatile box model that can contain other widgets and apply various styling properties.
- Padding is a simple wrapper that adds padding around its child widget.


## Explain the difference between State and BuildContext in Flutter.

- State represents the mutable state of a StatefulWidget.
- BuildContext is a handle to the location of a widget in the widget tree and is required for building widgets.


## Compare SingleChildScrollView and ListView in Flutter for handling a scrollable content.

- SingleChildScrollView is a generic scrollable container that can hold only one widget.
- ListView is specifically designed for displaying a scrollable list of widgets.


## What are the differences between InkWell and GestureDetector in Flutter when handling gestures?

- InkWell provides a material ripple effect and is specifically designed for handling taps.
- GestureDetector is more generic and can handle various gestures such as taps, swipes, etc.


## Compare Stack and Column in Flutter for organizing widgets vertically.
#### Answer:
- Column arranges its children in a vertical column.
- Stack allows children to be positioned on top of each other, with the last child being the topmost.


## Explain the difference between FutureBuilder and StreamBuilder in Flutter.

- FutureBuilder is used for asynchronously building a widget once a future completes.
- StreamBuilder is used for asynchronously building a widget in response to stream events.


## Compare Image.network and Image.asset in Flutter for loading images.

- Image.network loads an image from a network URL.
- Image.asset loads an image from the app's assets.


## Explain the difference between Row and Column in Flutter for organizing widgets horizontally.

- Row arranges its children in a horizontal row.
- Column arranges its children in a vertical column.

## Compare Expanded and Flexible widgets in Flutter.
#### Answer:
- Expanded is a shorthand for Flexible with flex: 1.
- Flexible allows more fine-grained control over how space is distributed among multiple widgets.


## What is the difference between MainAxisAlignment and CrossAxisAlignment in a Column or Row?
#### Answer:
- MainAxisAlignment defines how children are aligned along the primary axis (horizontal for Row and vertical for Column).
- CrossAxisAlignment defines how children are aligned along the cross axis.


## Explain the differences between Material and Cupertino design styles in Flutter.
#### Answer:
- Material design is the standard Android-like design.
- Cupertino design is the iOS-like design.


## Compare Future and Stream in Dart/Flutter.

- Future represents a single value or error that will be available at some time in the future.
- Stream represents a sequence of asynchronous events over time.


## What is the purpose of ListView.builder in Flutter?

- ListView.builder is used to efficiently create a scrollable list of widgets by lazily loading only the widgets that are currently visible on the screen.


- Compare FlatButton, RaisedButton, and ElevatedButton in Flutter for handling button interactions.

- FlatButton is a flat button with no elevation.
- RaisedButton is a button with a default elevation.
- ElevatedButton is an updated version of RaisedButton in Flutter 2.0.


## What is the purpose of the const keyword in Flutter when creating widgets?
#### Answer:
- The const keyword is used to create widgets that won't be recreated unnecessarily, improving performance by avoiding unnecessary rebuilds.


## Compare ListView.separated and ListView.builder in Flutter.
#### Answer:
- ListView.separated is similar to ListView.builder but allows adding separators between items.
- ListView.builder is used for efficiently building a list of widgets.


## Explain the difference between const and final in Dart.
#### Answer:
- const is used for compile-time constants, and the value must be known at compile-time.
- final is used for values that won't change after they're initialized, but the value can be known at runtime.

## gridDelegate in gridview
- Type: SliverGridDelegate

- Description: A delegate that controls the layout of the grid. It defines the size and positioning of items within the grid. There are two commonly used delegates:

#### SliverGridDelegateWithFixedCrossAxisCount: Specifies a fixed number of cross-axis cells.
```dart
SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 2,
  mainAxisSpacing: 10.0,
  crossAxisSpacing: 10.0,
  childAspectRatio: 1.0,
)
```
#### SliverGridDelegateWithMaxCrossAxisExtent: Specifies a maximum cross-axis extent for the items.
```dart
SliverGridDelegateWithMaxCrossAxisExtent(
  maxCrossAxisExtent: 200.0,
  mainAxisSpacing: 10.0,
  crossAxisSpacing: 10.0,
  childAspectRatio: 1.0,
)
```
- scrollDirection:
- Type: Axis (enum)
- Description: The axis along which the GridView scrolls. It can be either Axis.horizontal or Axis.vertical.
## CustomScrollView
- CustomScrollView in Flutter is a powerful and flexible widget that allows you to create custom scrolling effects by combining multiple slivers. A sliver is a portion of a scrollable area, and CustomScrollView is composed of a list of slivers that work together to create complex scrollable layouts. It's often used to implement custom scrolling behaviors, such as parallax effects, sticky headers, or sliver-based UIs.
### Slivers:
- A sliver is a portion of a scrollable area. In the context of CustomScrollView, slivers represent various scrollable components like headers, footers, or custom scroll effects. There are different types of slivers:
- SliverAppBar: A material design app bar that integrates with CustomScrollView.

- SliverList: A sliver that displays a linear list of items.

- SliverGrid: A sliver that displays a 2D array of items.

- SliverToBoxAdapter: A sliver that contains a single box widget.

- SliverPersistentHeader: A sliver that remains pinned at the top regardless of the scroll position.

- SliverFillRemaining: A sliver that fills the remaining space.
### CustomScrollView Parameters:
- slivers: List of slivers that make up the scrollable area.

- scrollDirection: Axis along which the scroll view scrolls (either Axis.vertical or Axis.horizontal).

- physics: The physics of the scroll view, controlling the scrolling behavior.

- controller: A scroll controller that can be used to control the position of the scroll view.
```dart
CustomScrollView(
  slivers: <Widget>[
    SliverAppBar(
      // App bar configuration
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('CustomScrollView Example'),
        background: Image.network('https://example.com/image.jpg', fit: BoxFit.cover),
      ),
    ),
    SliverList(
      // List of items
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
        childCount: 20,
      ),
    ),
  ],
)
```

## Compare Text and RichText widgets in Flutter for displaying text.
#### Answer:
- Text is a simple widget for displaying a single style of text.
- RichText allows displaying multiple styles and formatting within a single text widget.

## textBaseline
- In Flutter's Row widget, the textBaseline property is used to align children along their baseline when they have different text baseline alignments. This is particularly useful when you have text in different children of the Row widget, and you want to align them based on a common baseline.
- The textBaseline property accepts a value of type TextBaseline, which can have the following values:
- alphabetic: Aligns the text such that the alphabetic baselines of the children match. This is the default behavior.

- ideographic: Aligns the text such that the ideographic baselines of the children match. Ideographic baseline is used for CJK (Chinese, Japanese, Korean) characters.

#### This property is particularly useful when you have a row of text with different font sizes, and you want them to visually align along a common baseline.

##  Explain the difference between ClipRect and ClipRRect in Flutter.

- ClipRect clips its child to the shape of a rectangle, while ClipRRect clips its child to the shape of a rounded rectangle.
## Compare AlertDialog and SimpleDialog in Flutter.

- Both are used for displaying dialogs, but AlertDialog is a full-screen dialog with rounded corners, while SimpleDialog is a smaller dialog with options.
## Explain the difference between AspectRatio and FractionallySizedBox in Flutter.

- AspectRatio enforces a specific aspect ratio on its child, while FractionallySizedBox sizes its child based on a fraction of the available space.
## What distinguishes IndexedStack and PageView in Flutter?

- IndexedStack displays only one of its children at a time, based on the provided index, while PageView is a scrollable list of pages.
##  What is the difference between AnimatedContainer and TweenAnimationBuilder in Flutter for animation?

- AnimatedContainer automatically animates between two states, while TweenAnimationBuilder provides more control over the animation using a tween.
## Compare Align and Positioned widgets in Flutter for positioning children.

- Align positions a child within its parent using fractional values, while Positioned allows absolute positioning based on explicit coordinates.

---

## What is the difference between adaptive and responsive design in Flutter?

### Responsive Design in Flutter
- Focuses on adapting to different **screen sizes within the same device type** (e.g., mobile phone or tablet).
- Achieved using flexible layouts, `MediaQuery`, and `LayoutBuilder`.
- Dynamically adjusts layout and appearance based on available screen space.

### Adaptive Design in Flutter
- Extends beyond screen sizes to consider different **platforms and form factors** (mobile, tablet, desktop).
- Uses platform-aware widgets and APIs for native look and feel.
- `CupertinoApp` adapts to iOS design language; `MaterialApp` adapts to Material Design (Android/desktop).

In summary: **Responsive** handles screen sizes; **Adaptive** handles different platforms and form factors. Both can be combined for the best cross-platform experience.

---

## What is the difference between packages and plugins in Flutter?

### Packages
- A Dart package is a collection of Dart code and assets that can be shared and reused.
- Can contain Flutter widgets, utility functions, or any other Dart code.
- Published on [pub.dev](https://pub.dev).
- Contains **only Dart code**.

### Plugins
- A plugin is a special type of package that integrates **platform-specific (native) code** with Flutter's Dart code.
- Provides a bridge between Flutter and native code (Java/Kotlin for Android, Swift/Objective-C for iOS).
- Used when accessing device-specific features (camera, location, sensors) not directly supported by Flutter.
- Contains **both Dart and native code**.

**Summary**: A "package" is pure Dart code. A "plugin" wraps native code (Kotlin/Swift/etc.) and exposes it to Flutter via platform channels.

---

## Real-time functionality in Flutter

To add real-time functionality to a Flutter app, several options exist:

1. **Firebase Realtime Database** — cloud-hosted NoSQL DB; use `firebase_database` package, listen to changes via streams.
2. **Firebase Cloud Firestore** — flexible scalable DB; use `cloud_firestore`, listen to snapshots.
3. **WebSockets** — full-duplex communication; use `web_socket_channel` package to connect and listen to a WebSocket server.
4. **Pusher** — hosted service for real-time data; use `pusher_channels_flutter`, subscribe to channels, bind to events.
5. **SignalR** — ASP.NET real-time library; use `signalr_core` package to connect to a SignalR hub.
6. **GraphQL Subscriptions** — use `graphql_flutter` with `web_socket_link` for persistent real-time connections.
7. **MQTT** — lightweight protocol for IoT/mobile; use `mqtt_client` package, connect to an MQTT broker, subscribe to topics.

### Pusher Example
```dart
await pusher.init(apiKey: API_KEY, cluster: API_CLUSTER);
await pusher.connect();

final myChannel = await pusher.subscribe(
  channelName: "my-channel",
  onEvent: onEvent,
);

void onEvent(PusherEvent event) {
  log("onEvent: $event");
}
```

### Socket.IO / WebSocket Example
```dart
IO.Socket socket;

initSocket() {
  socket = IO.io(socketServerURL, <String, dynamic>{
    'autoConnect': false,
    'transports': ['websocket'],
  });
  socket.connect();
  socket.onConnect((_) => print('Connection established'));
  socket.onDisconnect((_) => print('Connection Disconnected'));
}

// Listen for events
socket.on('getMessageEvent', (newMessage) {
  messageList.add(MessageModel.fromJson(newMessage));
});

// Emit events
sendMessage() {
  Map messageMap = {
    'message': message,
    'senderId': userId,
    'time': DateTime.now().millisecondsSinceEpoch,
  };
  socket.emit('sendNewMessage', messageMap);
}
```

---

## Multipart Requests in Flutter

Multipart requests are used to upload files to a server.

```dart
// Create a multipart request
var request = http.MultipartRequest('POST', Uri.parse('https://example.com/upload'));

// Add a file
request.files.add(await http.MultipartFile.fromPath('image', 'path/to/image.png'));

// Send the request
var response = await request.send();
print(response.statusCode);
```

---

## What is the difference between REST API, GraphQL API, and Webhooks?

### REST API
- Uses standard HTTP methods (GET, POST, PUT, DELETE) for CRUD operations.
- Data in JSON or XML. Each resource has a unique URL endpoint.
- Client receives a fixed data structure from the server.
- Stateless.

### GraphQL API
- Single HTTP endpoint for all queries and mutations.
- Clients request exactly the data they need (no over-fetching/under-fetching).
- Supports real-time data via subscriptions.

### Webhooks
- Server-to-server communication: the server pushes HTTP requests to a client URL when an event occurs.
- Event-driven and asynchronous.
- The payload contains information about the event.

**Choose REST** for standard CRUD APIs; **GraphQL** when flexible data querying is needed; **Webhooks** for event-driven server-to-server notifications.

---

## What is the difference between Retrofit, Dio, and the HTTP package in Flutter?

### HTTP package
- Basic package for making HTTP requests (GET, POST, PUT, DELETE).
- Simple and straightforward; no built-in JSON serialization.

### Dio
- Advanced HTTP client built on top of the HTTP package.
- Features: interceptors, request cancellation, file upload/download, form data.
- Built-in JSON serialization/deserialization support.

### Retrofit
- Type-safe HTTP client generator inspired by Retrofit for Android.
- Define API interfaces with annotations; Retrofit generates implementation code.
- Includes interceptors, error handling, and custom converters.
- Reduces boilerplate with code generation.

**Use HTTP** for basic needs; **Dio** for advanced HTTP features; **Retrofit** for type-safe, annotation-driven API clients.

---

## What is the difference between Hive and sqflite in Flutter?

### Hive
- Lightweight, fast key-value database written in Dart, optimized for Flutter.
- Stores data directly in files.
- Supports custom data types, lazy loading, and efficient queries.
- Best for simple key-value pairs or structured data with custom types.

### sqflite
- SQLite plugin for Flutter.
- Relational database management supporting SQL queries.
- Advanced features: transactions, indexes, complex queries.
- Best for relational data models, complex queries, or large datasets.

---

## What is the difference between auto_route and go_router in Flutter?

### auto_route
- Code generation-based routing using annotations (`@MaterialRoute`, `@CupertinoRoute`).
- Generates route classes at compile time — type-safe, fewer runtime errors.
- Features: named routes, argument passing, deep linking, route guards, route parameters.
- Integrates well with Riverpod and Bloc.

### go_router
- Lightweight, flexible routing without code generation.
- Simple API using `GoRouter` class with route definitions.
- Features: named routes, route parameters, transitions, deep linking.
- Easier to set up; less type safety compared to auto_route.

---

## What is the difference between deep links and dynamic links?

### Deep Links
- URLs that navigate directly to specific content within an app.
- Bypass the app's home screen and open a particular screen.
- Example: opening a specific product page in a shopping app.

### Dynamic Links
- URLs that can direct users to different destinations depending on context (device, platform, app installation status).
- Used for referral programs, content sharing, cross-platform marketing campaigns.
- Can route to a web page if the app is not installed (fallback mechanism).
- More flexible than traditional deep links.

---

## What is the difference between TextField and TextFormField?

- **TextField**: Simple text input widget. Use for basic user input capture without form validation.
- **TextFormField**: Integrates with the `Form` widget. Use when you need save, reset, or validate operations across multiple fields.

A `Form` widget groups multiple `FormField` widgets and exposes `FormState` methods: `save()`, `reset()`, `validate()`.

```dart
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

Form(
  key: _formKey,
  child: Column(
    children: [
      TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) return 'Please enter text';
          return null;
        },
      ),
      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Process data
          }
        },
        child: Text('Submit'),
      ),
    ],
  ),
)
```

---

## What is showModalBottomSheet vs showBottomSheet?

- **showModalBottomSheet**: Creates a **modal** bottom sheet that prevents user interaction with the rest of the app while displayed. Must be dismissed before interacting with the underlying content.
- **showBottomSheet** (persistent): Displays information that **supplements** the primary content without blocking interaction. Created with `showBottomSheet()` or `ScaffoldState.showBottomSheet()`.

---

## What is WillPopScope?

`WillPopScope` registers a callback to intercept back-navigation attempts. The `onWillPop` callback returns a `Future<bool>` — if `true`, the screen pops; if `false`, it stays.

```dart
WillPopScope(
  onWillPop: () async {
    return shouldPop; // true to pop, false to prevent
  },
  child: Scaffold(
    // ...
  ),
)
```

---

## What is the difference between Bloc and Provider?

### Bloc (Business Logic Component)
- Architectural pattern separating business logic from UI.
- Based on streams and sinks: input sinks receive events, output streams emit states.
- Best for complex applications needing fine-grained control over state changes and async operations.
- Uses `flutter_bloc` package.

### Provider
- State management solution based on `InheritedWidget`.
- Simplifies passing data down the widget tree.
- Reactive data access without explicit constructor passing.
- Offers `Provider`, `ChangeNotifierProvider`, `ValueListenableProvider`, etc.
- Best for simpler applications or dependency injection.

---

## What is the difference between Provider and Riverpod?

### Provider
- Based on `InheritedWidget`, exposes data to descendant widgets reactively.
- Simple and easy to use; suitable for simple to moderately complex apps.
- Providers are tied to the widget tree.

### Riverpod
- Built on top of Provider; providers are first-class citizens, independent of the UI hierarchy.
- Improved performance optimizations for large apps with complex dependency graphs.
- Encourages functional programming style.
- Additional features: `ProviderFamily`, `ScopedProvider`, `StateNotifier`.
- Better scalability for large, complex applications.

---

## What is Flutter flavors?

Flutter flavors allow you to build multiple versions of your app (e.g., production, development, staging) from a single codebase with different settings, branding, or functionality.

### Implementation approaches

1. **Build flavors**: Multiple entry points in `main.dart`, configured via build scripts.
2. **Environment-specific configuration files**: Separate config files for each environment (API endpoints, keys, etc.).
3. **Conditional compilation**: Use `const` and `assert` to include/exclude code based on conditions.
4. **Third-party packages**: Packages that streamline flavor management.

---

## Flutter DevTools

Flutter DevTools is a suite of tools for analyzing, diagnosing, and debugging Flutter applications.

### Key features
- **Inspector**: Explore the widget tree, inspect properties, understand UI structure.
- **Timeline**: View events (frame rendering, UI events, async operations) to find performance bottlenecks.
- **Debugger**: Set breakpoints, inspect variables, step through code.
- **Memory Profiler**: Identify memory leaks and inefficient memory usage.
- **Network Profiler**: Monitor network requests, analyze timing.
- **Logging**: View log messages from the app.

Access DevTools by running the app in debug mode and navigating to `http://localhost:8080`, or via the VS Code / IntelliJ extension.

---

## What is the difference between ListView and ListView.builder?

- **ListView**: Requires creating all items at once. Best when the list is short and all items will be visible.
- **ListView.builder**: Creates items lazily (on-demand) as they scroll into view. Best practice for long lists where only visible items are rendered, improving performance.

---

## What is the difference between Expanded and Flexible?

- **Flexible**: Takes only the **needed space** for its child (wraps content by default). Does not force the child to fill available space.
- **Expanded**: Takes **all available space** along the main axis. Forces the child to fill the remaining space. Equivalent to `Flexible` with `fit: FlexFit.tight`.

---

## What is the difference between Visibility, Opacity, and Offstage?

### Visibility
- Shows/hides widgets via the `visible` property.
- When `visible: false`, replaces child with a zero-sized box.
- The child is still in the widget tree and occupies no space when hidden.

### Opacity
- Makes its child transparent using `opacity` (range 0.0–1.0).
- When `opacity: 0`, the child is invisible but still **occupies space** and **remains interactive**.

### Offstage
- Lays out the child but **does not draw it** or occupy screen space when `offstage: true`.
- More efficient than `Visibility` — skips the build process entirely when offstage.
- Commonly used to measure widget dimensions without showing them.

Key differences:
- `Visibility(visible: false)`: no space, not drawn, but still in tree
- `Opacity(opacity: 0)`: occupies space, invisible but interactive
- `Offstage(offstage: true)`: no space, not drawn, most efficient

---

## What is ColorScheme in Flutter?

`ColorScheme` defines the color system for Material Design:
- `primary`: Most frequently used color across screens and components.
- `onPrimary`: Color legible when drawn on `primary`.
- `secondary`: Accent color for less prominent components (e.g., filter chips).
- `error`: Color for input validation errors.
- `surface`: Background color for widgets like `Card`.
- `background`: Color behind scrollable content.

---

## What is a PreferredSizeWidget?

An interface for widgets that can return their preferred size when unconstrained. Used by `AppBar` and `TabBar` which need to expose a preferred/default size without constraining themselves.

Use `PreferredSize` to give a preferred size to an arbitrary widget.

---

## What is TestFlight?

TestFlight is an Apple-owned online service for over-the-air installation and testing of mobile applications. It allows developers to distribute iOS apps to internal and external beta testers, who can send feedback. The TestFlight SDK also provides remote logs, crash reports, and tester feedback.

---

## What is Shorebird?

Shorebird is a set of tools that allow you to build and deploy new versions of your Flutter app directly to users' devices (code push / OTA updates).

### Shorebird consists of three major parts
1. **shorebird CLI**: Command-line tool for building and deploying.
2. **A modified Flutter engine**: Included in your app.
3. **Public-cloud infrastructure**: Hosts your app's updates.

---

## What is OneSignal and how to use it with Flutter?

OneSignal is a popular mobile and web push notification service supporting iOS, Android, and web.

```dart
// Add dependency
// onesignal_flutter: ^latest_version

// Initialize in main
OneSignal.shared.setAppId("YOUR_ONESIGNAL_APP_ID");

// Handle notifications received
OneSignal.shared.setNotificationReceivedHandler(
  (OSNotification notification) {
    print("Notification received: ${notification.jsonRepresentation()}");
  },
);

// Handle notification opened
OneSignal.shared.setNotificationOpenedHandler(
  (OSNotificationOpenedResult result) {
    print("Notification opened: ${result.notification.jsonRepresentation()}");
    Navigator.push(context, MaterialPageRoute(builder: (_) => TargetScreen()));
  },
);
```

### FCM vs OneSignal
- **OneSignal**: Supports SMS and email in addition to push notifications. Advanced segmentation and targeting. More user-friendly with no-code tools.
- **FCM (Firebase Cloud Messaging)**: More developer-focused; native Firebase integration. Less overhead for apps already on Firebase.

---

## What is Firebase Dynamic Links?

Firebase Dynamic Links is a Firebase feature that creates and manages deep links dynamically. Deep links navigate users directly to specific content in an app rather than the home screen.

```dart
void checkToProvider(Uri deepLink) {
  if (deepLink.queryParameters.containsKey('provider')) {
    final String? provider = deepLink.queryParameters['provider'];
    Navigator.pushNamed(context, BRANCHES_SCREEN,
        arguments: BranchesParams(provider_id: int.parse(provider ?? '0')));
  }
}

Future<Uri> createDynamicLink(String path, String provider) async {
  final DynamicLinkParameters parameters = DynamicLinkParameters(
    link: Uri.parse(encodedUrl),
    uriPrefix: '',
    androidParameters: AndroidParameters(packageName: packageName),
    iosParameters: IOSParameters(bundleId: packageName, appStoreId: ''),
  );
  final dynamicUrl = await FirebaseDynamicLinks.instance.buildShortLink(parameters);
  return dynamicUrl.shortUrl;
}
```

---

## Android build formats: AAR, JAR, DEX, APK

- **JAR (Java Archive)**: Package format for distributing Java applications. Contains compiled `.class` files and a `MANIFEST`. Essentially a ZIP archive.
- **DEX (Dalvik Executable)**: Binary format for the Dalvik Virtual Machine (DVM). Generated from Java CLASS files by the `dex` compiler in the Android SDK.
- **APK (Android Application Package)**: ZIP-based format for distributing Android apps. Must contain `AndroidManifest.xml` and compiled classes in DEX format.
- **AAR**: Binary distribution of an Android Library Project. Similar structure to APK.

## Android App Bundle vs iOS App Bundle

- **Android App Bundle**: Publishing format that defers APK generation to Google Play. Play Store generates and serves optimized APKs per device configuration, reducing download size.
- **iOS App Bundle**: Bundles organize resources into well-defined subdirectories. Apple uses bundles to represent apps, frameworks, plug-ins, and other content. A bundle object provides a single interface for locating resources.

---

## How to change localization for a single widget differently from the whole app?

Use `Localizations.override` to override the locale for a specific widget subtree:

```dart
body: Center(
  child: Localizations.override(
    context: context,
    locale: const Locale('fr', 'FR'), // Override for this subtree
    child: MyLocalizedWidget(),
  ),
),
```


---

## Flutter General Q&A

### Why is Flutter preferred over other mobile app development tools?
- **Cross-platform**: Single codebase for iOS, Android, web, desktop.
- **Easy and flexible**: Dart is easy to learn; Flutter has a gentle learning curve.
- **Faster builds**: Hot reload speeds up development.
- **Native performance**: Compiled to native machine code (no web views).
- **Rich widget library**: Pre-built customizable widgets for beautiful UIs.
- **Large community**: Active community and growing ecosystem.

### What are the limitations of Flutter?
- Smaller third-party library ecosystem compared to React Native.
- Larger release size than native apps.
- Requires learning Dart (an additional language).
- Limited support for mobile ad platforms.

### What are the four main elements of Flutter?
1. Flutter Engine
2. Widgets
3. Design-specific widgets (Material / Cupertino)
4. Foundation Library

### What is Flutter Architecture?
Flutter architecture consists of three layers:
- **Flutter Framework Layer**: Highest layer. Contains widgets, Material Design widgets, and APIs for animations, gestures, and routing. Written in Dart.
- **Engine Layer**: Core layer written in C++. Contains the rendering engine (Impeller/Skia), text layout, file/network I/O, plugin architecture, and Dart runtime.
- **Platform Layer**: Lowest layer. Provides access to native platform APIs through plugins and packages.

### What is pubspec.yaml?
The `pubspec.yaml` file is the project configuration file at the top of every Flutter project. It contains:
- Project dependencies (packages and their versions).
- Font assets.
- Image and other assets.
- Flutter SDK constraints.

YAML (YAML Ain't Markup Language) is a human-readable markup format.

### What is "Tree Shaking" in Flutter?
Tree shaking is an optimization technique that removes unused code (dead code) from the final build. When importing libraries, there may be unused modules. Tree shaking eliminates these, reducing code size and improving performance.

### What is the difference between WidgetsApp and MaterialApp?
- **WidgetsApp**: Provides basic navigation and fundamental UI functionality.
- **MaterialApp**: Built on top of `WidgetsApp`. Adds Material Design-specific functionality like `AnimatedTheme`, `GridPaper`, navigation, and themed widgets.

### What is the difference between runApp() and main()?
- **main()**: The entry point of the Dart/Flutter application. The first method executed when the app starts.
- **runApp()**: Inflates the given widget and attaches it to the screen. Fills the entire screen and compares the new widget tree against the previous one for efficient updates.

### Why do we need Mixins?
Dart does not support multiple inheritance. Mixins allow you to reuse code in multiple class hierarchies without establishing parent/child relationships.

```dart
mixin Flyable {
  void fly() => print("Flying!");
}
class Bird with Flyable {}
```

### What is a Ticker in Flutter?
A Ticker listens to `frameCallback` and calls a tick function that forwards the elapsed duration between the current and last frame to the ticker listener. Used in animations to update the UI at 60 frames per second.

### What is the purpose of RefreshIndicator?
`RefreshIndicator` enables pull-to-refresh behavior. When the user pulls down on the widget, the `onRefresh` callback is triggered (e.g., fetching new data from a server).

### What is the purpose of ModalRoute.of()?
`ModalRoute.of(context)` returns the current route with its arguments:
```dart
final args = ModalRoute.of(context)!.settings.arguments;
```

### What is UnmodifiableListView?
`UnmodifiableListView` creates a list that prevents adding or removing items. It wraps an existing list and throws an error if mutation is attempted.

### What is resizeToAvoidBottomInset?
When `true`, the `body` and floating widgets resize to avoid the on-screen keyboard. Prevents widgets from being obscured by the keyboard.

### What is TextEditingController?
`TextEditingController` is associated with a `TextField`. When the user modifies the text field, the controller updates its `text` and `selection` properties and notifies listeners. Used to read or programmatically set text field content.

### What is the difference between a Single Instance and Scoped Instance?
- **Global Access**: State accessible from anywhere in the app (e.g., top-level `ChangeNotifier` with Provider, BLoC). Simpler but may cause unnecessary rebuilds.
- **Scoped Access**: State limited to a specific part of the widget tree (e.g., `InheritedWidget`, `GetX`, `Riverpod` scoped providers). More efficient for specific subtrees.

### What is the build() method on State (not StatefulWidget)?
The `build()` method is in `State` (not `StatefulWidget`) to separate **immutable widget configuration** from **mutable state logic**:
- `StatefulWidget` is immutable — defines configuration.
- `State` is mutable — holds mutable data and contains `build()`.

This separation makes it easier to reason about the widget's lifecycle and ensures the appearance is deterministic given the current state.

