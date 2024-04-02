extension StringExtension on String {
  String capitalizeFirstLetter() {
    if (this.isEmpty) {
      return this; // Return the string as it is if it's empty
    }
    return '${this[0].toUpperCase()}${this.substring(1)}';
  }
}