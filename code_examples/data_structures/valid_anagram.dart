// Given two strings s and t, return true if t is an anagram of s, and false otherwise.
//
//
//
// Example 1:
//
// Input: s = "anagram", t = "nagaram"
//
// Output: true
//
// Example 2:
//
// Input: s = "rat", t = "car"
//
// Output: false
//
//

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