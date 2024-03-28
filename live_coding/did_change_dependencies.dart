/*
import 'package:flutter/material.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Wrap the entire app with UserProvider to make it accessible throughout
    return const UserProvider(
      userName: 'Initial User', // Set initial user name
      child: MaterialApp(
        title: 'User Display Demo',
        home: MyHomePage(),
      ),
    );
  }
}
// UserProvider InheritedWidget
class UserProvider extends InheritedWidget {
  final String userName;

  const UserProvider({
    Key? key,
    required this.userName,
    required Widget child,
  }) : super(key: key, child: child);

  static UserProvider of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<UserProvider>();
    assert(provider != null, "No UserProvider found in context");
    return provider!;
  }

  @override
  bool updateShouldNotify(UserProvider oldWidget) {
    return userName != oldWidget.userName;
  }
}

// UserDisplay Widget
class UserDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userName = UserProvider.of(context).userName;
    return Text('Hello, $userName!');
  }
}

// MyHomePage with UserProvider
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _userName = 'Guest';

  void updateUserName(String newUserName) {
    setState(() {
      _userName = newUserName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserProvider(
        userName: _userName,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('User Display'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserDisplay(), // Accesses userName from UserProvider
                TextField(
                  decoration: const InputDecoration(labelText: 'Enter Name'),
                  onChanged: (text) => updateUserName(text),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Importance of didChangeDependencies
    // Here, we can potentially react to changes in UserProvider's data
    // However, in this example, we don't modify the state based on it directly.

    // This demonstrates how accessing the data within didChangeDependencies
    // allows for potential logic based on inherited widget changes.
    final currentUserName = UserProvider.of(context).userName;
    print('Current user from didChangeDependencies: $currentUserName');
  }
}
*/
// Called when a dependency of this State object changes.
//
// For example, if the previous call to build referenced an InheritedWidget that later changed, the framework would call this method to notify this object about the change.
//
// This method is also called immediately after initState. It is safe to call BuildContext.dependOnInheritedWidgetOfExactType from this method.
//
// Subclasses rarely override this method because the framework always calls build after a dependency changes.
// Some subclasses do override this method because they need to do some expensive work (e.g., network fetches) when their dependencies change,
// and that work would be too expensive to do for every build.
// @protected
// @mustCallSuper
// void didChangeDependencies() { }
