abstract class Observer {
  void update(String news);
}

abstract class Subject {
  void addObserver(Observer observer);
  void removeObserver(Observer observer);
  void notifyObservers();
}

class NewsAgency implements Subject {
  final List<Observer> _observers = [];
  String _latestNews = '';

  void publishNews(String news) {
    _latestNews = news;
    notifyObservers();
  }

  @override
  void addObserver(Observer observer) {
    _observers.add(observer);
  }

  @override
  void removeObserver(Observer observer) {
    _observers.remove(observer);
  }

  @override
  void notifyObservers() {
    for (var observer in _observers) {
      observer.update(_latestNews);
    }
  }
}

class Subscriber implements Observer {
  final String name;

  Subscriber(this.name);

  @override
  void update(String news) {
    print('$name received news update: $news');
  }
}

void main() {
  // Create the subject
  NewsAgency newsAgency = NewsAgency();

  // Create observers
  Subscriber subscriber1 = Subscriber("Alice");
  Subscriber subscriber2 = Subscriber("Bob");

  // Register observers
  newsAgency.addObserver(subscriber1);
  newsAgency.addObserver(subscriber2);

  // Publish news
  newsAgency.publishNews("Breaking: New Dart version released!");

  print("\n--- After some time ---\n");

  // Remove an observer and publish more news
  newsAgency.removeObserver(subscriber1);
  newsAgency.publishNews("Update: Dart 3.1 is now available!");
}
// Observer Design Pattern
// The Observer Design Pattern is a behavioral pattern that defines a one-to-many dependency between objects.
// When one object (the subject) changes its state, all its observers are notified and updated automatically.
//
// When to Use the Observer Pattern?
// When multiple objects need to stay in sync with a subject's state.
// When the subject doesn't know in advance how many or which objects depend on it.
// Useful in implementing event-driven systems like GUIs, data streams, or real-time notifications.
// Key Components
// Subject: Maintains a list of observers and provides methods to add, remove, and notify them.
// Observer: Defines an interface for objects that should be notified of changes in the subject.
// Concrete Subject: Implements the subject and maintains its state.
// Concrete Observer: Implements the observer and updates itself based on notifications.
// Example in Dart
// Scenario: A NewsAgency notifies subscribers whenever new news is published.
// 1. Observer Interface

// abstract class Observer {
//   void update(String news);
// }
// 2. Subject Interface

// abstract class Subject {
//   void addObserver(Observer observer);
//   void removeObserver(Observer observer);
//   void notifyObservers();
// }
// 3. Concrete Subject (NewsAgency)

// class NewsAgency implements Subject {
//   final List<Observer> _observers = [];
//   String _latestNews = '';
//
//   void publishNews(String news) {
//     _latestNews = news;
//     notifyObservers();
//   }
//
//   @override
//   void addObserver(Observer observer) {
//     _observers.add(observer);
//   }
//
//   @override
//   void removeObserver(Observer observer) {
//     _observers.remove(observer);
//   }
//
//   @override
//   void notifyObservers() {
//     for (var observer in _observers) {
//       observer.update(_latestNews);
//     }
//   }
// }
// 4. Concrete Observer (Subscriber)

// class Subscriber implements Observer {
//   final String name;
//
//   Subscriber(this.name);
//
//   @override
//   void update(String news) {
//     print('$name received news update: $news');
//   }
// }
// 5. Client

// void main() {
//   // Create the subject
//   NewsAgency newsAgency = NewsAgency();
//
//   // Create observers
//   Subscriber subscriber1 = Subscriber("Alice");
//   Subscriber subscriber2 = Subscriber("Bob");
//
//   // Register observers
//   newsAgency.addObserver(subscriber1);
//   newsAgency.addObserver(subscriber2);
//
//   // Publish news
//   newsAgency.publishNews("Breaking: New Dart version released!");
//
//   print("\n--- After some time ---\n");
//
//   // Remove an observer and publish more news
//   newsAgency.removeObserver(subscriber1);
//   newsAgency.publishNews("Update: Dart 3.1 is now available!");
// }
// Output

// Alice received news update: Breaking: New Dart version released!
// Bob received news update: Breaking: New Dart version released!
//
// --- After some time ---
//
// Bob received news update: Update: Dart 3.1 is now available!
// Explanation
// Observer Interface:
//
// Defines the update method for all observers to implement.
// Subject Interface:
//
// Provides methods to add, remove, and notify observers.
// NewsAgency (Concrete Subject):
//
// Manages a list of observers and notifies them when new news is published.
// Subscriber (Concrete Observer):
//
// Implements the Observer interface and updates itself when notified.
// Client:
//
// Adds observers to the subject and triggers notifications.
// Benefits of the Observer Pattern
// Loose Coupling:
//
// Subjects and observers are loosely coupled. The subject doesn’t need to know the specifics of its observers.
// Dynamic Relationships:
//
// Observers can be added or removed at runtime.
// Extensibility:
//
// New observers can be introduced without modifying the subject.
// Drawbacks
// Performance Overhead:
// Notifying a large number of observers can impact performance.
// Unexpected Updates:
// Observers might receive updates they weren't prepared for, leading to potential errors.
// Conclusion
// The Observer Pattern is essential for implementing real-time notification systems
// where multiple objects need to react to changes in a subject's state. It provides flexibility and dynamic relationships,
// making it widely used in UI frameworks, event-driven programming, and reactive systems.