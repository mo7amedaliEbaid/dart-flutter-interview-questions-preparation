# Flutter & Dart Interview Questions - Senior Level
---

## Clean Architecture

### 1. Clean Architecture Principles

**Core Concepts:**
- **Separation of Concerns**: Each layer has a single responsibility
- **Dependency Rule**: Dependencies point inward
- **Independence**: Business logic independent of frameworks, UI, databases

**Layers (Outer to Inner):**

1. **Presentation Layer** (Outermost)
   - UI components (Widgets, Pages)
   - State management (BLoC, Provider)
   - Depends on Domain layer

2. **Data Layer**
   - Repository implementations
   - Data sources (API, Local DB)
   - Data models (DTOs)
   - Depends on Domain layer

3. **Domain Layer** (Innermost)
   - Entities (pure business objects)
   - Use cases (business logic)
   - Repository interfaces
   - No dependencies on other layers

### 2. Clean Architecture Structure

```
lib/
  core/
    error/
      exceptions.dart
      failures.dart
    usecases/
      usecase.dart
    utils/
      input_converter.dart
  features/
    feature_name/
      data/
        datasources/
          feature_remote_datasource.dart
          feature_local_datasource.dart
        models/
          feature_model.dart
        repositories/
          feature_repository_impl.dart
      domain/
        entities/
          feature_entity.dart
        repositories/
          feature_repository.dart
        usecases/
          get_feature_usecase.dart
          create_feature_usecase.dart
      presentation/
        bloc/
          feature_bloc.dart
          feature_event.dart
          feature_state.dart
        pages/
          feature_page.dart
        widgets/
          feature_widget.dart
```

### 3. Entities vs Models

**Entities (Domain Layer):**
- Pure business objects
- No framework dependencies
- Immutable
- Business logic only

**Models (Data Layer):**
- Framework-specific (JSON serialization)
- Extend entities
- Include fromJson/toJson
- Can have additional data layer concerns

**Example:**
```dart
// Entity (Domain)
class User {
  final String id;
  final String name;
  final String email;
  
  User({required this.id, required this.name, required this.email});
}

// Model (Data)
class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
  });
  
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
```

### 4. Use Cases

Use cases encapsulate single business logic operations.

**Characteristics:**
- One use case = one operation
- Input and output defined
- No dependencies on data sources
- Testable in isolation

**Example:**
```dart
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class GetUserUseCase implements UseCase<User, String> {
  final UserRepository repository;
  
  GetUserUseCase(this.repository);
  
  @override
  Future<Either<Failure, User>> call(String userId) async {
    return await repository.getUserById(userId);
  }
}

// Usage
final userOrFailure = await getUserUseCase('user123');
userOrFailure.fold(
  (failure) => handleError(failure),
  (user) => handleSuccess(user),
);
```

### 5. Repository Pattern Implementation

**Interface (Domain):**
```dart
abstract class UserRepository {
  Future<Either<Failure, User>> getUserById(String id);
  Future<Either<Failure, List<User>>> getAllUsers();
  Future<Either<Failure, void>> saveUser(User user);
}
```

**Implementation (Data):**
```dart
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  
  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  
  @override
  Future<Either<Failure, User>> getUserById(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final userModel = await remoteDataSource.getUserById(id);
        await localDataSource.cacheUser(userModel);
        return Right(userModel);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final userModel = await localDataSource.getUserById(id);
        return Right(userModel);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
```

### 6. Error Handling in Clean Architecture

**Exceptions (Data Layer):**
```dart
class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}

class CacheException implements Exception {
  final String message;
  CacheException(this.message);
}
```

**Failures (Domain Layer):**
```dart
abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure() : super('Server error');
}

class CacheFailure extends Failure {
  CacheFailure() : super('Cache error');
}
```

**Either Type:**
```dart
typedef Either<L, R> = _Either<L, R>;

class _Either<L, R> {
  final L? _left;
  final R? _right;
  
  _Either.left(this._left) : _right = null;
  _Either.right(this._right) : _left = null;
  
  bool get isLeft => _left != null;
  bool get isRight => _right != null;
  
  T fold<T>(T Function(L) left, T Function(R) right) {
    if (isLeft) return left(_left as L);
    return right(_right as R);
  }
}
```

---

## Testing

### 7. Types of Tests

#### Unit Tests
- Test individual functions, methods, classes
- Fast and isolated
- Use `test` package

**Example:**
```dart
void main() {
  group('Counter', () {
    test('increments value', () {
      final counter = Counter();
      counter.increment();
      expect(counter.value, 1);
    });
    
    test('decrements value', () {
      final counter = Counter();
      counter.decrement();
      expect(counter.value, -1);
    });
  });
}
```

#### Widget Tests
- Test widget behavior and appearance
- Run in simulated environment
- Use `flutter_test` package

**Example:**
```dart
void main() {
  testWidgets('Counter increments', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    
    expect(find.text('0'), findsOneWidget);
    
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    
    expect(find.text('1'), findsOneWidget);
  });
}
```

#### Integration Tests
- Test complete app or large parts
- Run on real/simulated devices
- Use `integration_test` package

**Example:**
```dart
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  
  testWidgets('end-to-end test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();
    
    expect(find.text('Home'), findsOneWidget);
  });
}
```

### 8. Testing Patterns

#### AAA Pattern (Arrange, Act, Assert)

**Arrange:**
- Set up test data
- Initialize objects
- Configure mocks

**Act:**
- Execute the code being tested

**Assert:**
- Verify the results

**Example:**
```dart
test('user login', () {
  // Arrange
  final authService = MockAuthService();
  final loginUseCase = LoginUseCase(authService);
  when(authService.login('user', 'pass')).thenAnswer((_) async => User());
  
  // Act
  final result = await loginUseCase('user', 'pass');
  
  // Assert
  expect(result, isA<User>());
  verify(authService.login('user', 'pass')).called(1);
});
```

### 9. Mocking

**Using Mockito:**
```dart
@GenerateMocks([UserRepository])
void main() {
  late MockUserRepository mockRepository;
  late GetUserUseCase useCase;
  
  setUp(() {
    mockRepository = MockUserRepository();
    useCase = GetUserUseCase(mockRepository);
  });
  
  test('should get user from repository', () async {
    // Arrange
    final user = User(id: '1', name: 'John');
    when(mockRepository.getUserById('1'))
      .thenAnswer((_) async => Right(user));
    
    // Act
    final result = await useCase('1');
    
    // Assert
    expect(result, Right(user));
    verify(mockRepository.getUserById('1')).called(1);
  });
}
```

### 10. BLoC Testing

**Testing BLoC:**
```dart
void main() {
  group('CounterBloc', () {
    late CounterBloc bloc;
    
    setUp(() {
      bloc = CounterBloc();
    });
    
    test('initial state is 0', () {
      expect(bloc.state, equals(0));
    });
    
    blocTest<CounterBloc, int>(
      'emits [1] when IncrementEvent is added',
      build: () => bloc,
      act: (bloc) => bloc.add(IncrementEvent()),
      expect: () => [1],
    );
    
    blocTest<CounterBloc, int>(
      'emits [1, 2, 3] when IncrementEvent is added multiple times',
      build: () => bloc,
      act: (bloc) {
        bloc.add(IncrementEvent());
        bloc.add(IncrementEvent());
        bloc.add(IncrementEvent());
      },
      expect: () => [1, 2, 3],
    );
  });
}
```

### 11. Test Coverage

**Measuring Coverage:**
```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

**Best Practices:**
- Aim for 80%+ coverage
- Focus on critical paths
- Test edge cases
- Keep tests independent
- Use descriptive test names

---

## Performance Optimization

### 12. Widget Rebuild Optimization

#### const Constructors
```dart
// Good - const widget
const Text('Hello');

// Bad - non-const widget
Text('Hello');
```

#### const Keyword Benefits
- Widgets won't be recreated unnecessarily
- Improves performance
- Reduces memory allocation

### 13. ListView Optimization

**ListView.builder:**
- Lazy loading
- Only builds visible items
- Efficient for long lists

```dart
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(title: Text(items[index]));
  },
)
```

**ListView.separated:**
- Adds separators between items
- More control over spacing

```dart
ListView.separated(
  itemCount: items.length,
  separatorBuilder: (context, index) => Divider(),
  itemBuilder: (context, index) {
    return ListTile(title: Text(items[index]));
  },
)
```

### 14. Image Optimization

**Caching:**
```dart
CachedNetworkImage(
  imageUrl: url,
  placeholder: (context, url) => CircularProgressIndicator(),
  errorWidget: (context, url, error) => Icon(Icons.error),
)
```

**Image Sizing:**
- Use appropriate image sizes
- Compress images before including
- Use WebP format when possible

### 15. Memory Management

**Dispose Resources:**
```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  StreamSubscription? _subscription;
  Timer? _timer;
  
  @override
  void initState() {
    super.initState();
    _subscription = stream.listen((data) { });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) { });
  }
  
  @override
  void dispose() {
    _subscription?.cancel();
    _timer?.cancel();
    super.dispose();
  }
}
```

### 16. Build Method Optimization

**Extract Widgets:**
```dart
// Bad - rebuilds entire tree
Widget build(BuildContext context) {
  return Column(
    children: [
      ExpensiveWidget(),
      AnotherExpensiveWidget(),
    ],
  );
}

// Good - only rebuilds what's needed
Widget build(BuildContext context) {
  return Column(
    children: [
      const ExpensiveWidget(), // const prevents rebuild
      AnotherExpensiveWidget(),
    ],
  );
}
```

**Use Builder Widgets:**
```dart
// Only rebuilds when specific value changes
BlocBuilder<CounterBloc, CounterState>(
  buildWhen: (previous, current) => previous.count != current.count,
  builder: (context, state) {
    return Text('Count: ${state.count}');
  },
)
```

### 17. Performance Profiling

**DevTools:**
- Performance overlay
- Timeline view
- Memory profiler
- Widget inspector

**Commands:**
```bash
flutter run --profile
flutter run --release
```

---

## Advanced State Management

### 18. BLoC Architecture Best Practices

**Event Naming:**
```dart
// Good
sealed class UserEvent {}
final class UserLoadRequested extends UserEvent {}
final class UserRefreshRequested extends UserEvent {}
final class UserDeleteRequested extends UserEvent {
  final String userId;
  UserDeleteRequested(this.userId);
}

// Bad
sealed class UserEvent {}
final class Load extends UserEvent {}
final class Refresh extends UserEvent {}
```

**State Management:**
```dart
sealed class UserState {}
final class UserInitial extends UserState {}
final class UserLoading extends UserState {}
final class UserLoaded extends UserState {
  final User user;
  UserLoaded(this.user);
}
final class UserError extends UserState {
  final String message;
  UserError(this.message);
}
```

**Error Handling:**
```dart
class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUseCase getUserUseCase;
  
  UserBloc(this.getUserUseCase) : super(UserInitial()) {
    on<UserLoadRequested>(_onLoadRequested);
  }
  
  Future<void> _onLoadRequested(
    UserLoadRequested event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    
    final result = await getUserUseCase(event.userId);
    
    result.fold(
      (failure) => emit(UserError(failure.message)),
      (user) => emit(UserLoaded(user)),
    );
  }
}
```

### 19. State Management Comparison

| Solution | Complexity | Boilerplate | Testability | Learning Curve |
|----------|-----------|-------------|-------------|----------------|
| **setState** | Low | Low | Medium | Low |
| **Provider** | Medium | Medium | High | Medium |
| **BLoC** | High | High | Very High | High |
| **Riverpod** | Medium | Medium | Very High | Medium |
| **GetX** | Low | Low | Medium | Low |

**When to Use:**
- **setState**: Simple apps, local state
- **Provider**: Medium apps, shared state
- **BLoC**: Complex apps, enterprise apps
- **Riverpod**: Modern apps, type safety
- **GetX**: Rapid development, small teams

---

## Animations

### 20. Animation Basics

**AnimationController:**
```dart
class _MyWidgetState extends State<MyWidget> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
```

**Tween:**
```dart
final animation = Tween<double>(begin: 0.0, end: 1.0)
  .animate(_controller);
```

**Curves:**
```dart
final curvedAnimation = CurvedAnimation(
  parent: _controller,
  curve: Curves.easeInOut,
);
```

### 21. Animation Types

#### Implicit Animations
```dart
AnimatedContainer(
  duration: Duration(seconds: 1),
  width: _isExpanded ? 200 : 100,
  height: _isExpanded ? 200 : 100,
  color: _isExpanded ? Colors.blue : Colors.red,
)
```

#### Explicit Animations
```dart
AnimatedBuilder(
  animation: _controller,
  builder: (context, child) {
    return Transform.scale(
      scale: _controller.value,
      child: child,
    );
  },
  child: Icon(Icons.star),
)
```

### 22. Animation Best Practices

**Dispose Controllers:**
- Always dispose AnimationController
- Prevents memory leaks

**Use Appropriate Curves:**
- `Curves.easeInOut` for general use
- `Curves.bounceIn` for playful animations
- `Curves.fastOutSlowIn` for Material Design

**Performance:**
- Use `RepaintBoundary` for complex animations
- Avoid animating expensive operations
- Use `AnimatedWidget` when possible

---

## App Lifecycle

### 23. App Lifecycle States

**Flutter App Lifecycle:**
```dart
enum AppLifecycleState {
  resumed,    // App visible and interactive
  inactive,   // App in foreground but not receiving input
  paused,     // App in background
  detached,   // App still hosted but detached from engine
}
```

**Listening to Lifecycle:**
```dart
class _MyWidgetState extends State<MyWidget> 
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
  
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        // App came to foreground
        break;
      case AppLifecycleState.paused:
        // App went to background
        break;
      case AppLifecycleState.inactive:
        // App is inactive
        break;
      case AppLifecycleState.detached:
        // App is detached
        break;
    }
  }
}
```

**Platform Equivalents:**
- **Android `onResume()`** → Flutter `resumed`
- **Android `onPause()`** → Flutter `paused`
- **iOS `active`** → Flutter `resumed`
- **iOS `background`** → Flutter `paused`

---

## Security

### 24. Security Best Practices

**API Keys:**
- Never commit API keys to version control
- Use environment variables
- Use secure storage for sensitive data

**Data Storage:**
```dart
// Use flutter_secure_storage for sensitive data
final storage = FlutterSecureStorage();
await storage.write(key: 'token', value: 'secret_token');
final token = await storage.read(key: 'token');
```

**Network Security:**
- Use HTTPS only
- Certificate pinning for critical apps
- Validate server certificates

**Input Validation:**
- Validate all user inputs
- Sanitize data before processing
- Use parameterized queries

---

## Data Structures & Algorithms

### 25. Common Data Structures

#### Arrays
- Ordered collection
- O(1) access
- O(n) insertion/deletion

#### Linked Lists
- Dynamic size
- O(n) access
- O(1) insertion/deletion

#### Stacks (LIFO)
- Last In First Out
- Operations: push, pop, peek
- O(1) operations

#### Queues (FIFO)
- First In First Out
- Operations: enqueue, dequeue, peek
- O(1) operations

#### Trees
- Hierarchical structure
- Binary Search Tree: O(log n) search
- Balanced trees maintain performance

#### Hash Tables
- Key-value pairs
- O(1) average case operations
- Handles collisions with chaining or open addressing

### 26. Common Algorithms

#### Sorting Algorithms

**Merge Sort:**
- Time: O(n log n)
- Space: O(n)
- Stable, divide and conquer

**Quick Sort:**
- Time: O(n log n) average, O(n²) worst
- Space: O(log n)
- In-place, divide and conquer

**Bubble Sort:**
- Time: O(n²)
- Space: O(1)
- Simple but inefficient

#### Search Algorithms

**Binary Search:**
- Time: O(log n)
- Requires sorted array
- Divide and conquer

**Linear Search:**
- Time: O(n)
- Works on any array
- Simple but slow

### 27. Big O Notation

**Common Complexities:**
- **O(1)**: Constant time
- **O(log n)**: Logarithmic time
- **O(n)**: Linear time
- **O(n log n)**: Linearithmic time
- **O(n²)**: Quadratic time
- **O(2ⁿ)**: Exponential time
- **O(n!)**: Factorial time

**Example:**
```dart
// O(1) - Constant
int getFirst(List<int> list) => list[0];

// O(n) - Linear
int findMax(List<int> list) {
  int max = list[0];
  for (int i = 1; i < list.length; i++) {
    if (list[i] > max) max = list[i];
  }
  return max;
}

// O(n²) - Quadratic
void bubbleSort(List<int> list) {
  for (int i = 0; i < list.length; i++) {
    for (int j = 0; j < list.length - i - 1; j++) {
      if (list[j] > list[j + 1]) {
        int temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
      }
    }
  }
}
```

---

## Advanced Patterns

### 28. Repository Pattern with Caching

```dart
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  
  @override
  Future<Either<Failure, User>> getUserById(String id) async {
    // Try cache first
    try {
      final cachedUser = await localDataSource.getUserById(id);
      return Right(cachedUser);
    } catch (e) {
      // Cache miss, fetch from remote
    }
    
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.getUserById(id);
        await localDataSource.cacheUser(remoteUser);
        return Right(remoteUser);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
```

### 29. Use Case Composition

```dart
class GetUserWithPostsUseCase {
  final GetUserUseCase getUserUseCase;
  final GetUserPostsUseCase getUserPostsUseCase;
  
  GetUserWithPostsUseCase({
    required this.getUserUseCase,
    required this.getUserPostsUseCase,
  });
  
  Future<Either<Failure, UserWithPosts>> call(String userId) async {
    final userResult = await getUserUseCase(userId);
    final postsResult = await getUserPostsUseCase(userId);
    
    return userResult.fold(
      (failure) => Left(failure),
      (user) => postsResult.fold(
        (failure) => Left(failure),
        (posts) => Right(UserWithPosts(user: user, posts: posts)),
      ),
    );
  }
}
```

### 30. Error Handling Strategy

```dart
class ErrorHandler {
  static String getErrorMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server error. Please try again.';
      case NetworkFailure:
        return 'No internet connection.';
      case CacheFailure:
        return 'Cache error.';
      case ValidationFailure:
        return (failure as ValidationFailure).message;
      default:
        return 'An unexpected error occurred.';
    }
  }
  
  static void handleError(BuildContext context, Failure failure) {
    final message = getErrorMessage(failure);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
```

### 31. Dependency Injection Setup

```dart
final sl = GetIt.instance;

Future<void> init() async {
  // Features
  await _initUserFeature();
  
  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}

Future<void> _initUserFeature() async {
  // Data sources
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(sl()),
  );
  
  // Repositories
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  
  // Use cases
  sl.registerLazySingleton(() => GetUserUseCase(sl()));
  sl.registerLazySingleton(() => CreateUserUseCase(sl()));
  
  // BLoC
  sl.registerFactory(() => UserBloc(
    getUserUseCase: sl(),
    createUserUseCase: sl(),
  ));
}
```

### 32. Code Generation

**json_serializable:**
```dart
@JsonSerializable()
class User {
  final String id;
  final String name;
  final String email;
  
  User({required this.id, required this.name, required this.email});
  
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
```

**build_runner:**
```bash
flutter pub run build_runner build
```

---

