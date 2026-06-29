class Solution {
  bool isBalanced(String numbers) {
    int rightSum = 0;
    int leftSum = 0;
    for (var i = 0; i < numbers.length; i++) {
      if (i.isEven) {
        rightSum += int.parse(numbers[i]);
      }
      if (i.isOdd) {
        leftSum += int.parse(numbers[i]);
      }
    }
    return rightSum == leftSum;
  }
}
// You are given a string num consisting of only digits.
// A string of digits is called balanced if the sum of the digits at even indices is equal to the sum of digits at odd indices.
//
// Return true if num is balanced, otherwise return false.
//
//
//
// Example 1:
//
// Input: num = "1234"
//
// Output: false
//
// Explanation:
//
// The sum of digits at even indices is 1 + 3 == 4, and the sum of digits at odd indices is 2 + 4 == 6.
// Since 4 is not equal to 6, num is not balanced.
