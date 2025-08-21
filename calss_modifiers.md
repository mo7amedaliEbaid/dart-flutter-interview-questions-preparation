In **Dart 3**, the language introduced **class modifiers** to give you more control over how classes, mixins, and interfaces can be **extended, implemented, or mixed in**.

Here’s a breakdown of the **class modifiers in Dart 3**:

---

## 🔑 **Class Modifiers in Dart 3**

### 1. `base`

* A `base` class **can be extended** but **not implemented** unless the subclass is also marked `base`, `final`, or `sealed`.
* Prevents accidental misuse (like implementing instead of extending).

```dart
base class Animal {}

class Dog extends Animal {} // ✅ Allowed
class Cat implements Animal {} // ❌ Error
```

---

### 2. `interface`

* An `interface` class **can be implemented**, but **not extended or mixed in** unless also marked `base`.

```dart
interface class Vehicle {}

class Car implements Vehicle {} // ✅ Allowed
class Truck extends Vehicle {} // ❌ Error
```

---

### 3. `final`

* A `final` class **cannot be extended, implemented, or mixed in**.
* Useful when you want the class to be **closed to inheritance**.

```dart
final class Logger {}

class MyLogger extends Logger {} // ❌ Error
```

---

### 4. `sealed`

* A `sealed` class **cannot be extended outside its defining library**.
* Useful for **exhaustive pattern matching**.

```dart
sealed class Shape {}

class Circle extends Shape {}  // ✅ Allowed (same library)
class Square extends Shape {}  // ✅ Allowed (same library)

// Outside the library
class Triangle extends Shape {} // ❌ Error
```

---

### 5. `mixin`

* A `mixin class` or plain `mixin` defines a mixin type.
* Mixins let you reuse code across classes.

```dart
mixin Swimmer {
  void swim() => print("Swimming...");
}

class Fish with Swimmer {}
```

---

### 6. `abstract`

* An `abstract` class **cannot be instantiated** directly.
* Can define methods without implementations.

```dart
abstract class Animal {
  void makeSound();
}

class Dog extends Animal {
  @override
  void makeSound() => print("Woof!");
}
```

---

### 7. `abstract base` / `abstract interface` / `abstract final` / `abstract sealed`

* Dart 3 allows **combining modifiers** for more precise control.

```dart
abstract interface class Repository {
  void fetchData();
}

abstract base class UseCase {
  void execute();
}
```

---

✅ **Summary Table:**

| Modifier    | Can Extend   | Can Implement | Can Mix In | Notes                                     |
| ----------- | ------------ | ------------- | ---------- | ----------------------------------------- |
| `base`      | ✅            | ❌             | ❌          | Only `base`, `final`, `sealed` can extend |
| `interface` | ❌            | ✅             | ❌          | Pure interface                            |
| `final`     | ❌            | ❌             | ❌          | No inheritance at all                     |
| `sealed`    | ✅ (same lib) | ✅ (same lib)  | ❌          | Restricted to library                     |
| `mixin`     | with only    | ❌             | ✅          | For sharing behavior                      |
| `abstract`  | ✅            | ✅             | ✅          | Cannot be instantiated                    |

---

Do you want me to also give you a **visual diagram** that summarizes all Dart 3 class modifiers in one view (like a cheat sheet)?
