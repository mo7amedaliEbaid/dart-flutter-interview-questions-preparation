- [217. Contains Duplicate](https://leetcode.com/problems/contains-duplicate/)

```dart
class Solution {
  bool containsDuplicate(List<int> nums) {
    nums.sort();
    var i = 0;
    var j = i + 1;
    while (j < nums.length) {
      if (nums[i] == nums[j]) {
        return true;
      }
      i = j;
      j++;
    }
    return false;
  }
}
```
- [242. Valid Anagram](https://leetcode.com/problems/valid-anagram/)

```dart
class Solution {
  bool isAnagram(String s, String t) {
    if (s.length != t.length) return false;

    Map<String, int> charMap = {};

    // Count occurrences in `s`
    for (var i = 0; i < s.length; i++) {
      charMap[s[i]] = (charMap[s[i]] ?? 0) + 1;
    }

    // Subtract occurrences based on `t`
    for (var i = 0; i < t.length; i++) {
      if (charMap.containsKey(t[i])) {
        charMap.update(t[i], (value) => value - 1);
      } else {
        return false;
      }
    }

    // Check if all counts are zero
    return charMap.values.every((count) => count == 0);
  }
}
```
