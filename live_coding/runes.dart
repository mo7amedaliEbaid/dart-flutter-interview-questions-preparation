// In Dart, Runes represents a sequence of Unicode code points.
// Unicode is a standard for representing characters in different writing systems,
// including alphabets, ideographs, and symbols, using a unique numerical code point for each character.
//
// Here's a breakdown of Runes in Dart:
//
// Unicode Code Points:
//
// Unicode defines a unique numerical value for each character called a code point.
// These code points range from 0 to 0x10FFFF, covering a vast range of characters from various languages and symbols.
// Runes in Dart:
//
// In Dart, Runes is a type that represents a sequence of Unicode code points.
// Dart provides a few ways to create Runes objects.
// One common way is to use string literals with escape sequences for Unicode characters,
// such as \uXXXX (where XXXX is the hexadecimal code point) or \u{XXXXXX} for code points greater than 0xFFFF.
// For example:
// dart
//
// var runes = Runes('\u{1F600} \u{1F601}'); // Creates a Runes object representing two emoji characters
// Working with Runes:
//
// Once you have a Runes object, you can iterate over its elements using a loop or methods like forEach.
// You can convert a Runes object to a string using the String.fromCharCodes()
// constructor, which constructs a string from a sequence of Unicode code points (represented as integers).
// Example:
// dart
//
// var runes = Runes('\u{1F600} \u{1F601}');
// var string = String.fromCharCodes(runes);
// print(string); // Outputs: 😀 😁
// Runes are useful in Dart when you need to work with text containing characters outside the Basic Multilingual Plane (BMP),
// such as emoji, characters from CJK (Chinese, Japanese, Korean) scripts,
// mathematical symbols, etc. They allow you to handle and manipulate such characters in Dart strings effectively.
main(){
  var runes = Runes('\u{1F600} \u{1F601}');
  var string = String.fromCharCodes(runes);
  print(string);
  String gfg = 'GeeksforGeeks';
  print(gfg.codeUnits);
}