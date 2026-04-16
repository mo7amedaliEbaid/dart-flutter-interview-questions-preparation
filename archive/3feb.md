# the range of int and double in dart.
- In Dart, int and double are two different numeric data types with different ranges.

- int: This represents integers (whole numbers) and has a fixed range. In Dart, the range of int is from -2^63 to 2^63 - 1 for 64-bit systems, and from -2^31 to 2^31 - 1 for 32-bit systems.

- double: This represents floating-point numbers (numbers with decimal points) and has a larger range. Dart uses the IEEE 754 standard for representing double-precision floating-point numbers. The range of double is approximately ±4.9 × 10^−324 to ±1.8 × 10^308.

# difference between design patterns and architectural patterns

- Design patterns and architectural patterns are both important concepts in software development, but they address different levels of abstraction and serve distinct purposes.

## Design Patterns:
Scope:

Design patterns are smaller-scale patterns that focus on solving specific problems within a module or a class.
They deal with object creation, composition, and interaction to ensure that individual components work together effectively.
Granularity:

Design patterns are more granular and target specific aspects of code organization and interaction, such as object creation, behavior delegation, or communication between objects.
Examples:

Examples of design patterns include Singleton, Factory Method, Observer, Strategy, and others.
These patterns help address common issues in object-oriented design and promote best practices for creating reusable and maintainable code.
Intent:

The intent of design patterns is to provide solutions to recurring design problems at the class or object level, enhancing flexibility and maintainability.
## Architectural Patterns:
Scope:

Architectural patterns deal with high-level structures and organization of an entire software system or application.
They focus on the overall structure, distribution of responsibilities, and communication between larger components or modules.
Granularity:

Architectural patterns are more comprehensive and provide guidelines for organizing the entire system. They encompass multiple modules, components, and the relationships between them.
Examples:

Examples of architectural patterns include Model-View-Controller (MVC), Microservices, Monolithic, Layered (e.g., three-tier architecture), and others.
These patterns help define the fundamental organization and structure of a software system.
Intent:

The intent of architectural patterns is to define the high-level structure and behavior of a software system, facilitating scalability, maintainability, and other global concerns.
Relationship:
Hierarchy:

Architectural patterns can include or be composed of multiple design patterns. Design patterns can be employed within the context of an architectural pattern.
Scope of Influence:

While design patterns influence the structure and behavior of classes and objects, architectural patterns influence the structure and organization of the entire application or system.
Scale:

Design patterns are typically applied at a smaller scale within a codebase, whereas architectural patterns are applied at a higher level to shape the entire application.
In summary, design patterns focus on solving specific design problems within the components of a system, whereas architectural patterns provide guidelines for organizing and structuring the entire software system. Both play crucial roles in building scalable, maintainable, and efficient software applications.

## Otp
```dart
import 'package:firebase_auth/firebase_auth.dart';

Future<void> sendOTP(String phoneNumber) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  await auth.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    verificationCompleted: (PhoneAuthCredential credential) async {
      // Auto-retrieval of OTP completed (e.g., Google sign-in).
      // You can use credential to sign in the user.
      await auth.signInWithCredential(credential);
    },
    verificationFailed: (FirebaseAuthException e) {
      print('Verification Failed: ${e.message}');
    },
    codeSent: (String verificationId, int resendToken) {
      // Save the verification ID for later use
      // (e.g., when the user enters the OTP).
      print('Code Sent');
      // You can store verificationId and resendToken if needed.
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      // Called when the auto-retrieval timer expires.
      // You can handle this scenario or let it be.
    },
  );
}
```
```dart
import 'package:firebase_auth/firebase_auth.dart';

Future<void> sendEmailVerification() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;

  if (user != null && !user.emailVerified) {
    await user.sendEmailVerification();
    print('Email Verification Sent');
  } else {
    print('User is already verified or user is null');
  }
}
```
