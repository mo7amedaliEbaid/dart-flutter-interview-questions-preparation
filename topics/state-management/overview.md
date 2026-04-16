# Obx
- when my controller is already registered elsewhere and I want minimal code/noise a reactive widget
# GetX
- when my controller isn't yet registered or I want to be very explicit/obvious which controller is being used or I need to run some initState calls during creation and I want a reactive widget
# GetBuilder
- I want to manually decide when a widget rebuilds
- I have several state variables that make sense to refresh together as a group
### Under the hood, both Obx and GetX use streams, subscribing to controller observable variables change streams to know when to reactively rebuild. GetBuilder does not.
### GetX and GetBuilder both extend StatefulWidget

# ChangeNotifier
- ChangeNotifier is a simple class included in the Flutter SDK which provides change notification to its listeners. In other words, if something is a ChangeNotifier, you can subscribe to its changes. (It is a form of Observable, for those familiar with the term.)

- In provider, ChangeNotifier is one way to encapsulate your application state. For very simple apps, you get by with a single ChangeNotifier. In complex ones, you’ll have several models, and therefore several ChangeNotifiers. (You don’t need to use ChangeNotifier with provider at all, but it’s an easy class to work with.)

# ChangeNotifierProvider
- ChangeNotifierProvider is the widget that provides an instance of a ChangeNotifier to its descendants. It comes from the provider package.

# Consumer
- The only required argument of the Consumer widget is the builder. Builder is a function that is called whenever the ChangeNotifier changes. (In other words, when you call notifyListeners() in your model, all the builder methods of all the corresponding Consumer widgets are called.)

- The builder is called with three arguments. The first one is context, which you also get in every build method.
- The second argument of the builder function is the instance of the ChangeNotifier. It’s what we were asking for in the first place. You can use the data in the model to define what the UI should look like at any given point.

- The third argument is child, which is there for optimization. If you have a large widget subtree under your Consumer that doesn’t change when the model changes, you can construct it once and get it through the builder.
# Provider.of
- Sometimes, you don’t really need the data in the model to change the UI but you still need to access it. For example, a ClearCart button wants to allow the user to remove everything from the cart. It doesn’t need to display the contents of the cart, it just needs to call the clear() method.

# What is Riverpod?
- Riverpod (anagram of Provider) is a reactive caching framework for Flutter/Dart.

- Using declarative and reactive programming, Riverpod takes care of a large part of your application's logic for you. It can perform network-requests with built-in error handling and caching, while automatically re-fetching data when necessary.
### Providers are the most important part of a Riverpod application. A provider is an object that encapsulates a piece of state and allows listening to that state.
### ProviderObserver ProviderObserver listens to the changes of a ProviderContainer.To use it, extend the class ProviderObserver and override the method you want to use.
### A few of the things that scoping enables are:
- Override the state of providers for a specific subtree (similar to how theming and InheritedWidgets work in flutter) (see example)
- Creating synchronous providers for normally async APIs (see example)
- Allowing Dialogs and Overlays to inherit the state of providers from the widget subtree that cause them to be shown (see example)
- Optimizing rebuilds of widgets by removing parameters from Widget constructors allowing you to make them const
### Why do we need to extend ConsumerWidget instead of using the raw StatelessWidget?
- This is due to an unfortunate limitation in the API of InheritedWidget.

- There are a few problems:

- It is not possible to implement an "on change" listener with InheritedWidget. That means that something such as ref.listen cannot be used with BuildContext.

- State.didChangeDependencies is the closest thing to it, but it is not reliable. One issue is that the life-cycle can be triggered even if no dependency changed, especially if your widget tree uses GlobalKeys (and some Flutter widgets already do so internally).

- Widgets listening to an InheritedWidget never stop listening to it. This is usually fine for pure metadata, such as "theme" or "media query".

- For business logic, this is a problem. Say you use a provider to represent a paginated API. When the page offset changes, you wouldn't want your widget to keep listening to the previously visible pages.

- InheritedWidget has no way to track when widgets stop listening to them. Riverpod sometimes relies on tracking whether or not a provider is being listened to.

- This functionality is crucial for both the auto dispose mechanism and the ability to pass arguments to providers.
- Those features are what make Riverpod so powerful.
## WidgetRef class abstract
An object that allows widgets to interact with providers.

---

## ValueNotifier

A `ChangeNotifier` that holds a **single value**. Notifies listeners when the value is replaced with something not equal (by `==`) to the old value.

```dart
final counter = ValueNotifier<int>(0);
counter.value = 1; // Notifies listeners
```

- Does **not** notify when mutable state inside the value changes (e.g., contents of a List).
- Best used with **immutable data types**.
- For mutable data types, extend `ChangeNotifier` directly.

---

## ListenableBuilder

A general-purpose widget for rebuilding a subtree when a `Listenable` changes. Useful when only part of the widget tree should rebuild.

```dart
class CounterModel with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count += 1;
    notifyListeners();
  }
}

// In the widget tree:
ListenableBuilder(
  listenable: counterModel,
  builder: (BuildContext context, Widget? child) {
    return Text('${counterModel.count}');
  },
)
```

Any subtype of `Listenable` (including `ChangeNotifier`, `ValueNotifier`, or `Animation`) can be used. For animations, consider `AnimatedBuilder` for clarity.

---

## get_it — Dependency Injection

`get_it` is a service locator for Dart and Flutter. It allows registering and retrieving dependencies without needing the BuildContext.

```dart
final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<QuranCubit>(
      () => QuranCubit(quranUsecase: sl(), quranAudioUsecase: sl()));
  sl.registerLazySingleton<SurahCubit>(() => SurahCubit(surahUsecase: sl()));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

// Usage with BlocProvider:
providers: [
  BlocProvider(create: (context) => sl<QuranCubit>()),
  BlocProvider(create: (context) => sl<SurahCubit>()),
],
```

`registerLazySingleton` creates the instance only on first access.

---

## What is Dependency Injection?

A design pattern used to implement **Inversion of Control**. It allows the creation of dependent objects outside of a class and provides those objects to the class through different means (constructor, method, or property injection).

Benefits:
- Decoupling — classes don't create their own dependencies.
- Testability — easier to mock dependencies in tests.
- Flexibility — swap implementations without changing the dependent class.

