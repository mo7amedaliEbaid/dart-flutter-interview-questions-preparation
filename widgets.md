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


## Compare Text and RichText widgets in Flutter for displaying text.
#### Answer:
- Text is a simple widget for displaying a single style of text.
- RichText allows displaying multiple styles and formatting within a single text widget.
