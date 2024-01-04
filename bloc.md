# Bloc

## What is Bloc and How it works?
- In Flutter, a **Bloc** (short for Business Logic Component) is a design pattern that helps manage state in your application in a predictable and efficient way. It's commonly used to separate the presentation layer from the business logic layer. Here's a brief overview of how Bloc works in Flutter:
#### 1- State Management:
- Bloc helps manage the state of your application. Instead of managing state directly in your widgets, you delegate this responsibility to the Bloc.
#### 2- Events and States:
- Bloc operates based on events and states. An event is a signal that something has happened (e.g., a button click), and a state represents the condition of your application at a specific point in time.
#### 3- Bloc Class:
- Typically, you create a class that extends the Bloc or Cubit class from the bloc package. This class will handle incoming events, update the state, and notify the UI.
```dart
class MyBloc extends Bloc<MyEvent, MyState> {
  // Logic for handling events and updating state
}
```
#### 4- Events and States Classes:
- You'll define classes for events and states. Events are triggered by user actions or other inputs, and states represent the different conditions your UI can be in.
```dart
// Define events
abstract class MyEvent {}

// Define states
abstract class MyState {}
```
#### 5- State Changes
- Bloc requires us to register event handlers via the on<Event> API, An event handler is responsible for converting any incoming events into zero or more outgoing states.
```dart
sealed class CounterEvent {}

final class CounterIncrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) {
      // handle incoming `CounterIncrementPressed` event
    });
  }
}
```
#### 6-UI Integration
- Connect your Bloc to your UI using widgets like **BlocBuilder** or **BlocListener**. These widgets rebuild parts of your UI in response to changes in the Bloc's state.
```dart
BlocBuilder<MyBloc, MyState>(
  builder: (context, state) {
    // Rebuild UI based on the current state
    return YourWidget(state.data);
  },
)
```



