//  starting from Dart 2.12, Dart introduced a new feature called "records."
//  Records provide a concise syntax for defining immutable data classes. Here's an example:
//
// record Person(String name, int age);
//
// void main() {
//   // Creating a Person record
//   var person = Person('John', 30);
//
//   // Accessing fields
//   print('Name: ${person.name}, Age: ${person.age}');
//
//   // Equality comparison
//   var otherPerson = Person('John', 30);
//   print('Are they the same person? ${person == otherPerson}');
// }
// In this example:
//
// We define a record called Person using the record keyword.
// The Person record has two fields: name of type String and age of type int.
// We create an instance of the Person record using the constructor shorthand syntax.
// We access the fields of the Person record using dot notation (person.name, person.age).
// We demonstrate the equality comparison between two Person records.
// Records have built-in value equality semantics, so two records are considered equal if their fields have the same values.
// Records are immutable, meaning their fields cannot be changed once they are created.
// This makes them useful for representing data that should not change over time,
// such as DTOs (Data Transfer Objects), model objects,
// or configuration settings.
// Records provide a concise syntax for defining immutable data classes without the boilerplate code
// typically associated with defining classes in Dart.