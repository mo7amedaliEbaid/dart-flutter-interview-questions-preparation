// Iterator Design Pattern
// The Iterator Pattern is a behavioral design pattern that provides a way to access elements of a collection
// (such as lists, sets, or other aggregates) sequentially without exposing its underlying structure.
//
// Key Concepts:
// Iterator: Defines the interface for accessing and traversing the elements.
// Concrete Iterator: Implements the Iterator interface to traverse a specific collection.
// Aggregate: Defines an interface for creating an Iterator object.
// Concrete Aggregate: Implements the Aggregate interface and returns a specific iterator.
// Use Case
// This pattern is useful when:
//
// You want to traverse different types of collections uniformly.
// You want to abstract the traversal logic from the client.
// Example in Dart
// Let’s implement the Iterator pattern for a collection of Books.
//
// Step 1: Define the Iterator Interface
// abstract class Iterator<T> {
//   bool hasNext();
//   T next();
// }
// Step 2: Define the Aggregate Interface
// abstract class IterableCollection<T> {
//   Iterator<T> createIterator();
// }
// Step 3: Create a Concrete Collection
// class Book {
//   final String title;
//
//   Book(this.title);
// }
//
// class BookCollection implements IterableCollection<Book> {
//   final List<Book> _books = [];
//
//   void addBook(Book book) {
//     _books.add(book);
//   }
//
//   @override
//   Iterator<Book> createIterator() {
//     return BookIterator(_books);
//   }
// }
// Step 4: Implement the Concrete Iterator
// class BookIterator implements Iterator<Book> {
//   final List<Book> _books;
//   int _currentIndex = 0;
//
//   BookIterator(this._books);
//
//   @override
//   bool hasNext() {
//     return _currentIndex < _books.length;
//   }
//
//   @override
//   Book next() {
//     if (!hasNext()) {
//       throw Exception('No more books.');
//     }
//     return _books[_currentIndex++];
//   }
// }
// Step 5: Use the Iterator
// void main() {
//   BookCollection bookCollection = BookCollection();
//   bookCollection.addBook(Book('Design Patterns in Dart'));
//   bookCollection.addBook(Book('Clean Code'));
//   bookCollection.addBook(Book('The Pragmatic Programmer'));
//
//   Iterator<Book> iterator = bookCollection.createIterator();
//
//   while (iterator.hasNext()) {
//     Book book = iterator.next();
//     print('Reading book: ${book.title}');
//   }
// }
// Output:
// Reading book: Design Patterns in Dart
// Reading book: Clean Code
// Reading book: The Pragmatic Programmer
// Explanation:
// Iterator Interface: Defines hasNext() and next() methods to traverse the collection.
// Concrete Iterator (BookIterator): Implements traversal logic for BookCollection.
// Aggregate Interface (IterableCollection): Ensures that any collection can provide an Iterator.
// Concrete Aggregate (BookCollection): Stores Book objects and provides an iterator.
// Benefits of the Iterator Pattern:
// Encapsulation of Traversal Logic: The client doesn't need to know the internal structure of the collection.
// Uniform Access: Different collections can be traversed using the same interface.
// Decoupling: The client and the collection are decoupled, allowing independent changes.

abstract class Iterator<T> {
  bool hasNext();

  T next();
}

abstract class IterableCollection<T> {
  Iterator<T> createIterator();
}

class Book {
  final String title;

  Book(this.title);
}

class BookCollection implements IterableCollection<Book> {
  final List<Book> _books = [];

  void addBook(Book book) {
    _books.add(book);
  }

  @override
  Iterator<Book> createIterator() {
    return BookIterator(_books);
  }
}

class BookIterator implements Iterator<Book> {
  final List<Book> _books;
  int _currentIndex = 0;

  BookIterator(this._books);

  @override
  bool hasNext() {
    return _currentIndex < _books.length;
  }

  @override
  Book next() {
    if (!hasNext()) {
      throw Exception('No more books.');
    }
    return _books[_currentIndex++];
  }
}

void main() {
  BookCollection bookCollection = BookCollection();
  bookCollection.addBook(Book('Design Patterns in Dart'));
  bookCollection.addBook(Book('Clean Code'));
  bookCollection.addBook(Book('The Pragmatic Programmer'));

  Iterator<Book> iterator = bookCollection.createIterator();

  while (iterator.hasNext()) {
    Book book = iterator.next();
    print('Reading book: ${book.title}');
  }
}
// In Dart, the Iterator design pattern is implemented natively in the language through the Iterator and Iterable interfaces.
// These interfaces are widely used in Dart collections like List, Set, and Map.
//
// Built-in Iterator and Iterable in Dart
// Iterable:
//
// Represents a collection of elements that can be iterated over.
// Provides a way to create an Iterator to traverse through elements.
// Iterator:
//
// Moves sequentially through elements in an Iterable.
// Provides moveNext() and current to access elements.
// Key Methods and Properties
// Iterator.moveNext(): Moves to the next element and returns true if there are more elements.
// Iterator.current: Gets the current element in the iteration.
// Common Dart Collections Using Iterator
// List
// Set
// Map
// Queue
// These collections implement Iterable, allowing easy iteration.
//
// Example 1: Using for-in (Syntactic Sugar for Iterator)
// The for-in loop uses the iterator under the hood.
//
// dart
// Copy code
// void main() {
//   List<int> numbers = [1, 2, 3, 4, 5];
//
//   for (int number in numbers) {
//     print('Number: $number');
//   }
// }
// Example 2: Using Explicit Iterator
// You can manually work with the Iterator to iterate over a collection:
//
// void main() {
//   List<String> fruits = ['Apple', 'Banana', 'Cherry'];
//
//   Iterator<String> iterator = fruits.iterator;
//
//   while (iterator.moveNext()) {
//     print('Fruit: ${iterator.current}');
//   }
// }
// Example 3: Custom Iterable with Built-in Iterator
// You can create a custom class that implements Iterable.
//
// class NumberRange extends Iterable<int> {
//   final int start;
//   final int end;
//
//   NumberRange(this.start, this.end);
//
//   @override
//   Iterator<int> get iterator => _NumberRangeIterator(start, end);
// }
//
// class _NumberRangeIterator implements Iterator<int> {
//   final int start;
//   final int end;
//   int? _current;
//   int _index;
//
//   _NumberRangeIterator(this.start, this.end) : _index = start - 1;
//
//   @override
//   bool moveNext() {
//     if (_index < end) {
//       _index++;
//       _current = _index;
//       return true;
//     }
//     _current = null;
//     return false;
//   }
//
//   @override
//   int get current => _current!;
// }
//
// void main() {
//   NumberRange range = NumberRange(1, 5);
//
//   for (int number in range) {
//     print('Number: $number');
//   }
// }
// Output:
// Number: 1
// Number: 2
// Number: 3
// Number: 4
// Number: 5
// Built-in Functions Leveraging Iterators
// forEach: Executes a function for each element in the collection.
//
// List<int> numbers = [10, 20, 30];
// numbers.forEach((number) => print('Value: $number'));
// map: Transforms each element in the collection.
//
// List<int> numbers = [1, 2, 3];
// List<int> squares = numbers.map((n) => n * n).toList();
// print(squares); // [1, 4, 9]
// where: Filters elements based on a condition.
//
// List<int> numbers = [1, 2, 3, 4, 5];
// List<int> evenNumbers = numbers.where((n) => n.isEven).toList();
// print(evenNumbers); // [2, 4]
// reduce and fold: Aggregates values.
//
// List<int> numbers = [1, 2, 3];
// int sum = numbers.reduce((a, b) => a + b);
// print(sum); // 6
// Conclusion
// Dart provides built-in support for the Iterator Pattern through the Iterable and Iterator interfaces,
// making it easy to traverse collections. You can either use native collections like List or create custom iterables.
