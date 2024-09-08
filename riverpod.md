## 1. What is Riverpod in Flutter, and why use it?
- Riverpod is a reactive caching and dependency injection framework for Flutter and Dart apps.
- It's a successor to the Provider package, offering a safer and more testable way to manage app state.
- Riverpod solves issues with Provider like better support for dependency injection, global access to state, and eliminating context dependency.

## 2. What are the key differences between Riverpod and Provider?
- No BuildContext: Riverpod doesn't rely on BuildContext to retrieve providers.
- Compile-time safety: It helps catch errors at compile time, like unregistered providers.
- Global access: Riverpod enables access to providers anywhere in the app.
- Scoped providers: Unlike Provider, which works with InheritedWidget, Riverpod allows easier scoping of providers.

## 3. What are the core types of providers in Riverpod?
- Provider: A read-only provider for synchronous values.
- StateProvider: A provider for simple state management, holding mutable state.
- FutureProvider: Manages asynchronous values, returning a Future.
- StreamProvider: Manages a stream of values.
- ChangeNotifierProvider: Manages objects that extend ChangeNotifier.

## 4. How do you define and read a simple provider in Riverpod?
```dart
final greetingProvider = Provider((ref) => 'Hello, Riverpod!');

// Reading the provider in a widget
Consumer(
  builder: (context, ref, child) {
    final greeting = ref.watch(greetingProvider);
    return Text(greeting);
  },
);
```
