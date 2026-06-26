## Difference between AAR, JAR, DEX, APK in Android?
- JAR (Java Archive)
- JAR is a package file format designed for distribution of Java application on its platform. It contains compiled Java class files + some more files like MANIFEST. Basically it is just an ZIP archive with some restrictions.

- DEX (Dalvik Executable)
- DEX is binary file format, so it is compiled. We could say, that .dex file is for DVM (Dalvik Virtual Machine) something like .class files for JVM.

- DEX file format is really generated from java CLASS files by dex compiler from Android SDK. This compiler translates JVM bytecode to DVM bytecode and put all class files to one dex file.

- APK (Android Application Package)
- APK is file format designed for distributing Android application on its platform. It has some similarities with JAR format. Again it is simply just a ZIP archive, but APK files have pre-defined specific structure. For example, it always must contains file named AndroidManifest.xml and many more. Also this package aggregates compiled classes in dex format.

- AAR
- AAR is the binary distribution of an Android Library Project. It has similar structure as APK.

## what is the build tool for ios?
- The Xcode build system manages the tools that transform your code and resource files into a finished app. When you tell Xcode to build your project, the build system analyzes your files and uses your project settings to assemble the set of tasks to perform.
- iOS (formerly iPhone OS) is a mobile operating system based on macOS and on components of the Mach microkernel and FreeBSD, a Unix-like operating system, developed by Apple Inc. exclusively for its smartphones. It was unveiled in January 2007 for the first-generation iPhone, launched in June 2007.
- Xcode. Apple has introduced Xcode, a tool for creating Swift applications for iOS devices. It is the first choice for new developers to create applications for the Mac, iPad, iPhone, Apple Watch, and Apple TV.

## Compare between App bundles in android and ios?
- An Android App Bundle is a publishing format that includes all your app’s compiled code and resources, and defers APK generation and signing to Google Play.

- Google Play uses your app bundle to generate and serve optimized APKs for each device configuration, so only the code and resources that are needed for a specific device are downloaded to run your app. You no longer have to build, sign, and manage multiple APKs to optimize support for different devices, and users get smaller, more-optimized downloads.

- Android App Bundle is the Android application publishing file format. The App Bundle must include the application's compiled code and resources, which allows for the signing and generation of APK files to be deferred to the app store, reducing the initial download size of the app.

- In Ios, You can have up to 10 apps in a single app bundle. Each app bundle has its own dedicated product page, icon, and title which is indexed on several keywords (E.g., your brand name). All the apps included in the app bundle should be either paid or free with a subscription.
- Apple uses bundles to represent apps, frameworks, plug-ins, and many other specific types of content. Bundles organize their contained resources into well-defined subdirectories, and bundle structures vary depending on the platform and the type of the bundle. By using a bundle object, you can access a bundle's resources without knowing the structure of the bundle. The bundle object provides a single interface for locating items, taking into account the bundle structure, user preferences, available localizations, and other relevant factors.

- Any executable can use a bundle object to locate resources, either inside an app’s bundle or in a known bundle located elsewhere. You don't use a bundle object to locate files in a container directory or in other parts of the file system.

## Why is the build() method on State and not StatefulWidget?
- The build() method is placed in the State class rather than the StatefulWidget class in Flutter to separate the immutable widget configuration from the mutable state logic.

- The StatefulWidget represents the configuration of a widget, and it is generally immutable. It defines how the widget should look based on the input parameters passed to it. On the other hand, the State class is mutable and holds the mutable state data for a widget.

- By separating the configuration and state, Flutter ensures that the widget's appearance can be determined without relying on the mutable state. The build() method in the State class is responsible for creating the widget tree based on the current state. This separation makes it easier to reason about and manage the widget's lifecycle and behavior.

- In summary, the build() method is placed in the State class to emphasize the distinction between the immutable widget configuration and the mutable state logic in the Flutter framework.
- https://raw.githubusercontent.com/power19942/flutter-interview-questions/main/img/stateful_build.png
## .What is Ticker, Tween and AnimationController?
- In the context of Flutter animations, Ticker, Tween, and AnimationController are important classes that work together to create smooth and controlled animations.

- Ticker:

- A Ticker is a mechanism that provides a signal, often at a regular interval, to trigger animation frames. It's a low-level abstraction for handling animation timing.
In Flutter, vsync is an argument that can be provided to the Ticker to synchronize animations with the screen's vertical sync. Typically, this is achieved by providing the Ticker with a reference to the State object of a StatefulWidget, which implements the TickerProviderStateMixin.
- Tween:

- A Tween is a way to define a range of values for an animation. It represents the mapping between the input range and the output range.
For example, a Tween<double> might represent the range of opacity values from 0.0 to 1.0. The Tween class provides a lerp method (linear interpolation) that calculates the intermediate value for a given progress.
- AnimationController:

- AnimationController is a class that controls an animation. It manages the animation's lifecycle, such as starting, stopping, and disposing of the animation.
It's often used in conjunction with a Tween to specify the range of values for the animation. The AnimationController drives the animation by providing a value based on the current progress of the animation.
- The addListener callback of the AnimationController is commonly used to update the UI based on the animated value.
```dart
AnimationController _controller;
Animation<double> _animation;

@override
void initState() {
  super.initState();
  _controller = AnimationController(
    duration: Duration(seconds: 2),
    vsync: this, // TickerProvider
  );

  _animation = Tween<double>(
    begin: 0.0,
    end: 1.0,
  ).animate(_controller);

  _controller.forward(); // Start the animation
}
```
- In this example, _controller manages the animation's lifecycle, and _animation represents the range of values (from 0.0 to 1.0). The animation progresses over a duration of 2 seconds.

- https://raw.githubusercontent.com/power19942/flutter-interview-questions/main/img/ticker.png
## What is ephemeral state?
- Ephemeral state in Flutter refers to the local state that is short-lived and specific to a particular widget. It's temporary and typically used for UI interactions within a widget.

- For example, if you have a button that toggles between two states, the information about the current state doesn't need to be stored globally or persistently. Instead, you can use ephemeral state within the widget to manage and update the UI based on user interactions.

- In Flutter, you often use the StatefulWidget to handle ephemeral state. The State object associated with the widget holds the mutable state data, and when the widget is rebuilt, this state is recreated.

- In contrast, if you need state that persists across widget instances or even app sessions, you might use global state management solutions like Provider, Bloc, or Riverpod in Flutter.

- https://raw.githubusercontent.com/power19942/flutter-interview-questions/main/img/ephemeral.png

## when should we use a resizeToAvoidBottomInset?

- If true the body and the scaffold's floating widgets should size themselves to avoid the onscreen keyboard whose height is defined by the ambient MediaQuery's MediaQueryData.viewInsets bottom property.

- For example, if there is an onscreen keyboard displayed above the scaffold, the body can be resized to avoid overlapping the keyboard, which prevents widgets inside the body from being obscured by the keyboard
## What is the importance of a TextEditingController?

- Whenever the user modifies a text field with an associated TextEditingController, the text field updates value and the controller notifies its listeners. Listeners can then read the text and selection properties to learn what the user has typed or how the selection has been updated
## What is an UnmodifiableListView?

- Cannot change the list items by adding or removing

## What is the purpose of ModalRoute.of()?

- ModalRoute.of() method. This method returns the current route with the arguments

- final args = ModalRoute.of(context).settings.arguments;

## Difference between a Single Instance and Scoped Instance ?
### Global Access:

- In Flutter, "global access" often refers to state management solutions that provide a global state accessible from anywhere in your app.
Examples include using the Provider package with a top-level ChangeNotifier or using the Bloc pattern with the bloc package.
### Scoped Access:

- "Scoped access" typically refers to managing state in a more localized manner, where the state is limited to a specific part of the widget tree.
For example, you might use InheritedWidget for scoped access, or a specific state management solution designed for widget tree scope, like GetX or Riverpod.
The choice between global and scoped access depends on your app's complexity and requirements. Global access can make it easier to manage state across the entire app, but it might lead to unnecessary rebuilds. Scoped access can provide more control and efficiency in state management for specific parts of the app.

- https://codewithandrea.com/articles/global-access-vs-scoped-access/

## What is a vsync?

- Vsync basically keeps the track of screen, so that Flutter does not renders the animation when the screen is not being displayed

