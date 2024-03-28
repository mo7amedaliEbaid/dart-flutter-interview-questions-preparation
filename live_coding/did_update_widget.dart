/*
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  final int count;

  const CounterWidget({Key? key, required this.count}) : super(key: key);

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late String _displayText;

  @override
  void initState() {
    super.initState();
    _displayText = "Count: ${widget.count}";
  }

  @override
  void didUpdateWidget(covariant CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if the count has actually changed
    if (oldWidget.count != widget.count) {
      _displayText = "Count: ${widget.count}";
      // setState is not required here as build will be called automatically
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(_displayText)));
  }
}
*/

// didUpdateWidget method
// @mustCallSuper
// @protected
// void didUpdateWidget(
// covariant T oldWidget
// )
// Called whenever the widget configuration changes.
//
// If the parent widget rebuilds and requests that this location in the tree update to display a new widget with the same runtimeType and Widget.key,
// the framework will update the widget property of this State object to refer to the new widget and then call this method with the previous widget as an argument.
// However, it can be useful for handling changes in data passed from parent widgets.