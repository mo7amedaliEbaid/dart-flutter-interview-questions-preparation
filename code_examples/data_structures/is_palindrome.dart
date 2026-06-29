import 'package:collection/collection.dart';
class Solution {
  bool isPalindrome(String s) {
    List<String> validStringList = [];
    for (var char in s.split("")) {
      if (isAlphaNumeric(char)) {
        validStringList.add(char.toLowerCase());
      }
    }
    print(validStringList.toString());
    List<String> reversedList = [];
    for (var i = validStringList.length-1; i >= 0; i--) {
      reversedList.add(validStringList[i]);
    }
    print(reversedList.toString());
    return ListEquality().equals(validStringList, reversedList);
  }

  bool isAlphaNumeric(String ch) {
    return RegExp(r'^[a-zA-Z0-9]$').hasMatch(ch);
  }
}

main() {
  print(Solution().isPalindrome("A man, a plan, a canal: Panama").toString());

}
