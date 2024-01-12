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
