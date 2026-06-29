// The Fact that OO languages provide safe and convenient polymorphism
// means that any source code dependency , no matter where it is , can be inverted.

abstract class AuthService {
  void login(String username, String password);
}

class EmailAuthService implements AuthService {
  @override
  void login(String username, String password) {
    print('Logging in with email: $username');
  }
}

class GoogleAuthService implements AuthService {
  @override
  void login(String username, String password) {
    print('Logging in with Google account: $username');
  }
}

class LoginManager {
  final AuthService _authService;

  // Dependency is injected via constructor
  LoginManager(this._authService);

  void performLogin(String username, String password) {
    _authService.login(username, password);
  }
}

void main() {
  // Inject EmailAuthService
  LoginManager emailLoginManager = LoginManager(EmailAuthService());
  emailLoginManager.performLogin('user@example.com', 'password123');

  // Inject GoogleAuthService
  LoginManager googleLoginManager = LoginManager(GoogleAuthService());
  googleLoginManager.performLogin('user@gmail.com', 'password456');
}
// Logging in with email: user@example.com
// Logging in with Google account: user@gmail.com

// What is Inversion of Control (IoC)?
// Inversion of Control (IoC) is a design principle where the control of objects or portions of a program is
// transferred to a framework or container. Instead of the application controlling the flow,
// the framework takes charge of instantiating and managing dependencies.
//
// IoC helps achieve:
//
// Decoupling: Components are less dependent on each other.
// Flexibility: Easier to change components without modifying their consumers.
// Testability: Dependencies can be easily mocked or substituted during testing.
// Types of IoC
// Dependency Injection (DI): Injecting dependencies into objects instead of objects creating them.
// Service Locator: Objects obtain their dependencies from a centralized registry.
// Example of IoC in Dart using Dependency Injection
// Let’s create an example where we have a service (AuthService) and a consumer (LoginManager),
// and we'll inject the service into the consumer.
//
// Step 1: Define the Service Interface
// dart
// Copy code
// abstract class AuthService {
//   void login(String username, String password);
// }
// Step 2: Implement a Concrete Service
// dart
// Copy code
// class EmailAuthService implements AuthService {
//   @override
//   void login(String username, String password) {
//     print('Logging in with email: $username');
//   }
// }
//
// class GoogleAuthService implements AuthService {
//   @override
//   void login(String username, String password) {
//     print('Logging in with Google account: $username');
//   }
// }
// Step 3: Create the Consumer Class
// Instead of the LoginManager creating its own AuthService, it will receive it through dependency injection.
//
// dart
// Copy code
// class LoginManager {
//   final AuthService _authService;
//
//   // Dependency is injected via constructor
//   LoginManager(this._authService);
//
//   void performLogin(String username, String password) {
//     _authService.login(username, password);
//   }
// }
// Step 4: Use the IoC Principle in Main
// Now we inject different services into LoginManager.
//
// dart
// Copy code
// void main() {
//   // Inject EmailAuthService
//   LoginManager emailLoginManager = LoginManager(EmailAuthService());
//   emailLoginManager.performLogin('user@example.com', 'password123');
//
//   // Inject GoogleAuthService
//   LoginManager googleLoginManager = LoginManager(GoogleAuthService());
//   googleLoginManager.performLogin('user@gmail.com', 'password456');
// }
// Output
// sql
// Copy code
// Logging in with email: user@example.com
// Logging in with Google account: user@gmail.com
// Explanation:
// AuthService: An abstraction that defines the login method.
// EmailAuthService and GoogleAuthService: Concrete implementations of the AuthService.
// LoginManager: Depends on AuthService, but does not instantiate it directly. It receives the dependency through the constructor.
// Benefits of IoC in this Example:
// Decoupling: LoginManager does not depend on any specific AuthService implementation. It depends on the abstraction (AuthService).
// Flexibility: You can switch between different authentication methods (e.g., email, Google) without changing LoginManager.
// Testability: During testing, you could inject a mock AuthService.
// Using a Dependency Injection Package
// You could use a DI package like get_it for IoC:
//
// yaml
// Copy code
// dependencies:
//   get_it: ^7.2.0
// Example with get_it:
// dart
// Copy code
// import 'package:get_it/get_it.dart';
//
// final getIt = GetIt.instance;
//
// void setupDependencies() {
//   getIt.registerSingleton<AuthService>(EmailAuthService());
// }
//
// void main() {
//   setupDependencies();
//
//   var loginManager = LoginManager(getIt<AuthService>());
//   loginManager.performLogin('user@example.com', 'password123');
// }
// This demonstrates how a DI framework can manage dependency injection automatically,
// further simplifying the IoC implementation.
//

// Relationship Between Inversion of Control (IoC) and Strategy Pattern
// Inversion of Control (IoC) and the Strategy Pattern are complementary concepts in software design.
// Both aim to achieve flexibility, decoupling, and enhanced maintainability, but they serve different purposes:
//
// 1. Inversion of Control (IoC)
// Definition: IoC is a general principle where the control of the program's flow or dependencies is inverted — shifted from
// the object itself to an external framework or container.
// Goal: Decouple components by outsourcing control over object creation, lifecycle management, and dependency resolution.
// How: Implemented via patterns like Dependency Injection (DI) or Service Locator.
// 2. Strategy Pattern
// Definition: The Strategy Pattern defines a family of interchangeable algorithms (strategies) and allows the algorithm to be
// selected at runtime.
// Goal: Encapsulate algorithms and allow their dynamic substitution without modifying the context
// (i.e., the class that uses the algorithm).
// How: Achieved by defining a common interface for all strategies and injecting or passing a concrete strategy to the context.
// How They Work Together
// IoC Enables Strategy Pattern:
// The Strategy Pattern relies on the idea of dynamically changing behavior (strategies).
// IoC helps implement the Strategy Pattern by injecting different strategies into the context,
// allowing behavior to vary without tight coupling.
// IoC Decouples Strategy Selection:
// With IoC, the selection and instantiation of strategies can be managed externally
// (e.g., through a Dependency Injection framework), further decoupling the context from the specific strategy implementation.
// Example: Combining IoC and Strategy Pattern in Dart
// Step 1: Define the Strategy Interface
// dart
// Copy code
// abstract class PaymentStrategy {
//   void pay(double amount);
// }
// Step 2: Implement Concrete Strategies
// dart
// Copy code
// class CreditCardPayment implements PaymentStrategy {
//   @override
//   void pay(double amount) {
//     print('Paid \$${amount.toStringAsFixed(2)} using Credit Card');
//   }
// }
//
// class PayPalPayment implements PaymentStrategy {
//   @override
//   void pay(double amount) {
//     print('Paid \$${amount.toStringAsFixed(2)} using PayPal');
//   }
// }
// Step 3: Create the Context Class
// dart
// Copy code
// class PaymentContext {
//   final PaymentStrategy _paymentStrategy;
//
//   // IoC: Strategy is injected
//   PaymentContext(this._paymentStrategy);
//
//   void executePayment(double amount) {
//     _paymentStrategy.pay(amount);
//   }
// }
// Step 4: Use IoC for Strategy Selection
// Using a DI framework like get_it or manual injection:
//
// dart
// Copy code
// import 'package:get_it/get_it.dart';
//
// final getIt = GetIt.instance;
//
// void setupDependencies() {
//   getIt.registerFactory<PaymentStrategy>(() => PayPalPayment()); // Or CreditCardPayment
// }
//
// void main() {
//   setupDependencies();
//
//   // IoC: Strategy is resolved and injected
//   PaymentContext paymentContext = PaymentContext(getIt<PaymentStrategy>());
//   paymentContext.executePayment(150.0);
// }
// Key Points:
// IoC manages the instantiation and injection of the PaymentStrategy.
// Strategy Pattern allows the dynamic switching of payment algorithms without modifying the PaymentContext.
// Benefits of Combining IoC and Strategy Pattern
// Decoupled Context: The context (PaymentContext) does not need to know about specific strategies (CreditCardPayment, PayPalPayment).
// Flexible Strategy Selection: Strategies can be easily swapped without altering context code.
// Testability: Mock strategies can be injected during testing.
// Centralized Configuration: IoC frameworks like get_it can manage the selection of strategies centrally.
