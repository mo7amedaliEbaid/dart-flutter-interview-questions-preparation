// ### What is MVP?
//
// **MVP** (Model-View-Presenter) is a software design pattern that separates the concerns of the application's presentation layer.
// It's commonly used in building user interfaces, especially in mobile applications.
// MVP decouples the business logic and UI, making the code more maintainable and testable.
//
// ### Core Components of MVP
//
// 1. **Model**:
//    - Responsible for handling the data layer (e.g., API calls, databases).
//    - Provides the data required by the application.
//
// 2. **View**:
//    - The UI layer.
//    - Displays data to the user.
//    - Captures user inputs and forwards them to the **Presenter**.
//    - Is "passive" — it doesn’t contain any business logic.
//
// 3. **Presenter**:
//    - Acts as a middleman between the **Model** and the **View**.
//    - Handles business logic and updates the **View** with new data.
//    - Reacts to user inputs forwarded by the **View** and interacts with the **Model** accordingly.
//
// ---
//
// ### Implementation of MVP in Flutter
//
// Let’s build a simple **To-Do App** using the MVP pattern.
//
// ---
//
// #### **Folder Structure**
//
// ```
// lib/
//   - models/
//       todo_model.dart
//   - presenters/
//       todo_presenter.dart
//   - views/
//       todo_view.dart
//   - main.dart
// ```
//
// ---
//
// ### **1. Model (Data Layer)**
//
// The **Model** handles data fetching and manipulation.
//
// ```dart
// class TodoModel {
//   final String id;
//   final String title;
//   final bool isCompleted;
//
//   TodoModel({required this.id, required this.title, this.isCompleted = false});
// }
// ```
//
// ---
//
// ### **2. View Interface**
//
// Define an abstract interface for the **View**.
// This ensures that the **Presenter** is not tightly coupled to any specific UI implementation.
//
// ```dart
// abstract class TodoView {
//   void displayTodos(List<TodoModel> todos);
//   void showError(String message);
// }
// ```
//
// ---
//
// ### **3. Presenter**
//
// The **Presenter** handles business logic and interacts with the **Model** and **View**.
//
// ```dart
// import '../models/todo_model.dart';
// import '../views/todo_view.dart';
//
// class TodoPresenter {
//   final TodoView view;
//
//   TodoPresenter(this.view);
//
//   List<TodoModel> _todos = [];
//
//   void loadTodos() {
//     try {
//       // Simulate data fetching
//       _todos = [
//         TodoModel(id: '1', title: 'Buy groceries'),
//         TodoModel(id: '2', title: 'Walk the dog'),
//         TodoModel(id: '3', title: 'Prepare dinner'),
//       ];
//       view.displayTodos(_todos);
//     } catch (error) {
//       view.showError('Failed to load todos');
//     }
//   }
//
//   void toggleTodoCompletion(String id) {
//     _todos = _todos.map((todo) {
//       if (todo.id == id) {
//         return TodoModel(
//           id: todo.id,
//           title: todo.title,
//           isCompleted: !todo.isCompleted,
//         );
//       }
//       return todo;
//     }).toList();
//
//     view.displayTodos(_todos);
//   }
// }
// ```
//
// ---
//
// ### **4. View Implementation (UI Layer)**
//
// The **View** implements the `TodoView` interface and displays data provided by the **Presenter**.
//
// ```dart
// import 'package:flutter/material.dart';
// import '../models/todo_model.dart';
// import '../presenters/todo_presenter.dart';
// import '../views/todo_view.dart';
//
// class TodoViewImpl extends StatefulWidget {
//   @override
//   _TodoViewImplState createState() => _TodoViewImplState();
// }
//
// class _TodoViewImplState extends State<TodoViewImpl> implements TodoView {
//   late TodoPresenter _presenter;
//   List<TodoModel> _todos = [];
//   String? _error;
//
//   @override
//   void initState() {
//     super.initState();
//     _presenter = TodoPresenter(this);
//     _presenter.loadTodos();
//   }
//
//   @override
//   void displayTodos(List<TodoModel> todos) {
//     setState(() {
//       _todos = todos;
//       _error = null;
//     });
//   }
//
//   @override
//   void showError(String message) {
//     setState(() {
//       _error = message;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('MVP To-Do')),
//       body: _error != null
//           ? Center(child: Text(_error!))
//           : ListView.builder(
//               itemCount: _todos.length,
//               itemBuilder: (context, index) {
//                 final todo = _todos[index];
//                 return ListTile(
//                   title: Text(todo.title),
//                   trailing: Checkbox(
//                     value: todo.isCompleted,
//                     onChanged: (_) {
//                       _presenter.toggleTodoCompletion(todo.id);
//                     },
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
// ```
//
// ---
//
// ### **5. Main**
//
// Integrate everything in `main.dart`.
//
// ```dart
// import 'package:flutter/material.dart';
// import 'views/todo_view.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: TodoViewImpl(),
//     );
//   }
// }
// ```
//
// ---
//
// ### Explanation of Workflow
//
// 1. **View**:
//    - Captures user input (e.g., checkbox toggle).
//    - Delegates user actions to the **Presenter**.
//    - Updates itself with the data provided by the **Presenter**.
//
// 2. **Presenter**:
//    - Fetches data from the **Model**.
//    - Processes user input (e.g., toggle task completion).
//    - Updates the **View** with new data or errors.
//
// 3. **Model**:
//    - Contains the app's data and business logic.
//
// ---
//
// ### Advantages of MVP in Flutter
//
// - **Separation of Concerns**:
//   - The **Presenter** handles business logic, keeping the **View** focused on UI rendering.
//
// - **Testability**:
//   - The **Presenter** can be tested independently from the **View**.
//
// - **Maintainability**:
//   - Changes in the UI don’t affect the business logic and vice versa.
//
// ---
//
// ### Disadvantages
//
// - **Boilerplate Code**:
//   - More classes and interfaces increase complexity for small projects.
//
// - **Tight Coupling Between View and Presenter**:
//   - Although decoupled from business logic, the **Presenter** is tightly coupled to the **View's interface**.
//
// ---
//
// ### Conclusion
//
// MVP is a solid choice for applications that require a clean separation between the UI and business logic.
// In Flutter, using MVP ensures your code remains modular and testable, improving maintainability in large projects.