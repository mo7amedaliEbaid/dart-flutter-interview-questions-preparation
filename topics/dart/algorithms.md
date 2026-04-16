## Arrays & Hashing.

- Selection Sort

```dart
void selectionSort(List<int> arr) {
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    int minIndex = i;
    for (int j = i + 1; j < n; j++) {
      if (arr[j] < arr[minIndex]) {
        minIndex = j;
      }
    }
    // Swap arr[i] and arr[minIndex]
    int temp = arr[i];
    arr[i] = arr[minIndex];
    arr[minIndex] = temp;
  }
}

// time = O(n^2)
// space = O(1)
```
- Insersion Sort

```dart
List<int> insertionSort(List<int> nums) {
  for (var i = 1; i < nums.length; i++) {
    int curr = nums[i];
    int j = i - 1;
    while (j >= 0 && curr < nums[j]) {
      nums[j + 1] = nums[j];
      j--;
    }
    nums[j + 1] = curr;
  }
  return nums;
}

// time = O(n^2)
// space = O(1)

```

- Merge Sort

```dart
List<int> mergeSort(List<int> nums) {
  if (nums.length <= 1) {
    return nums;
  }
  int mid = nums.length ~/ 2;
  List<int> left = mergeSort(nums.sublist(0, mid));
  List<int> right = mergeSort(nums.sublist(mid));
  return merge(left, right);
}

List<int> merge(List<int> left, List<int> right) {
  List<int> result = [];
  int i = 0, j = 0;
  while (i < left.length && j < right.length) {
    if (left[i] < right[j]) {
      result.add(left[i]);
      i++;
    } else {
      result.add(right[j]);
      j++;
    }
  }
  result.addAll(left.sublist(i));
  result.addAll(right.sublist(j));
  return result;
}
```
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
- [1. Two Sum](https://leetcode.com/problems/two-sum/)

```dart
class Solution {
  List<int> twoSum(List<int> nums, int target) {
    Map<int, int> map = {};
    for (var i = 0; i < nums.length; i++) {
      int complement = target - nums[i];
      if (map.containsKey(complement)) {
        return [i, map[complement]!];
      }
      map[nums[i]] = i; // Store the current element with its index
    }
    return [];
  }
}
```


## Two Pointers.

- [125. Valid Palindrome](https://leetcode.com/problems/valid-palindrome/)

```dart
class Solution {
  bool isPalindrome(String s) {
    int left = 0;
    int right = s.length - 1;

    while (left < right) {
      // Move left pointer to the next alphanumeric character
      while (left < right && !isAlphaNumeric(s[left])) {
        left++;
      }

      // Move right pointer to the previous alphanumeric character
      while (left < right && !isAlphaNumeric(s[right])) {
        right--;
      }

      // Compare characters in a case-insensitive manner
      if (s[left].toLowerCase() != s[right].toLowerCase()) {
        return false;
      }

      // Move both pointers towards the center
      left++;
      right--;
    }

    return true;
  }

  // Helper function to check if a character is alphanumeric
  bool isAlphaNumeric(String ch) {
    return RegExp(r'^[a-zA-Z0-9]$').hasMatch(ch);
  }
}
```

## Binary Search

```dart
class Solution {
  int search(List<int> nums, int target) {
    int h=nums.length-1;
    int l=0;


    while(l<=h){
      int mid=l+(h-l)~/2;
      if(target==nums[mid]){
        return mid;
      }else if(target>nums[mid]){
        l=mid+1;
      }else {
        h=mid-1;
      }
    }

    return -1;


  }
}
```
## Sliding Window.

- [121. Best Time to Buy and Sell Stock](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/)

```dart
class Solution {
int maxProfit(List<int> prices) {
  if (prices.isEmpty) return 0; // Edge case: if the prices list is empty
  
  int minPrice = prices[0]; // Initialize minPrice to the first day's price
  int maxProfit = 0; // Initialize maxProfit to 0

  for (int i = 1; i < prices.length; i++) {
    // Update minPrice if the current price is lower
    if (prices[i] < minPrice) {
      minPrice = prices[i];
    } else {
      // Calculate the profit and update maxProfit if it's larger
      int profit = prices[i] - minPrice;
      if (profit > maxProfit) {
        maxProfit = profit;
      }
    }
  }

  return maxProfit; // Return the maximum profit found
}
}
```

## Stack

- [20. Valid Parentheses](https://leetcode.com/problems/valid-parentheses/)

```dart
class Solution {
  bool isValid(String s) {
    List<String> stack = [];
    
    for (var char in s.split('')) {
      if (char == '(' || char == '{' || char == '[') {
        // Push opening brackets onto the stack
        stack.add(char);
      } else {
        // If stack is empty, there's no opening bracket to match with
        if (stack.isEmpty) return false;
        
        // Check if the closing bracket matches the expected opening bracket
        String last = stack.removeLast();
        if ((char == ')' && last != '(') ||
            (char == '}' && last != '{') ||
            (char == ']' && last != '[')) {
          return false;
        }
      }
    }
    
    // If stack is empty, all brackets matched correctly
    return stack.isEmpty;
  }
}
```

## Linked List

- Reverse Linked List.

```dart
/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  ListNode? reverseList(ListNode? head) {
  if(head==null)null;
      ListNode? prev=null;
    ListNode? curr=head;  
      while(curr!=null){
          ListNode? temp=curr.next;
          curr.next=prev;
          prev=curr;
          curr=temp;
      }
      return prev;
     
  }
}
```
## Trees 

- Invert Binary Tree

```dart
class Solution {
  TreeNode? invertTree(TreeNode? root) {
    if (root != null) {
      var temp = root.left;
      root.left = root.right;
      root.right = temp;
      invertTree(root.left);
      invertTree(root.right);
      return root;
    } else {
      return null;
    }
  }
}
```

---

## Search and Sort Algorithm Complexity Summary

### Linear Search
Sequentially checks each element until a match is found or the end is reached.
- Time Complexity: **O(n)**

### Binary Search
Efficiently finds a target value in a **sorted** array by repeatedly halving the search interval.
- Time Complexity: **O(log n)**

### Bubble Sort
Repeatedly compares adjacent elements and swaps them if in the wrong order.
- Time Complexity: **O(n²)**

### Insertion Sort
Builds the sorted array one element at a time by inserting each new element into the correct position.
- Time Complexity: **O(n²)**

### Merge Sort
Divides the list into sublists of one element, then repeatedly merges sorted sublists.
- Time Complexity: **O(n log n)**

### Quick Sort
Selects a pivot, partitions the array into two sub-arrays (less-than and greater-than pivot), and recursively sorts.
- Time Complexity: **O(n log n)** average, **O(n²)** worst case.

---

## Graph Traversal Algorithms

### Depth-First Search (DFS)
Explores as far as possible along each branch before backtracking.
- Use case: Tree and graph traversal, cycle detection, topological sort.
- Time Complexity: **O(V + E)** (vertices + edges).

### Breadth-First Search (BFS)
Visits all vertices at the same level before moving to the next level.
- Use case: Shortest path in unweighted graphs, network broadcasting.
- Time Complexity: **O(V + E)**.

### Difference between BFS and DFS
- BFS explores level by level (uses a queue); DFS explores depth-first (uses a stack or recursion).
- BFS finds the shortest path in unweighted graphs; DFS is better for exhaustive search.

---

## Dijkstra's Algorithm
Finds the **shortest path** between two nodes in a graph with **non-negative** edge weights.
- Time Complexity: **O((V + E) log V)** with a priority queue.
- Use case: Navigation, network routing.

---

## Dynamic Programming
Breaks a problem into simpler **overlapping subproblems** and solves each only once, storing results (memoization/tabulation) to avoid redundant computation.
- Use case: Fibonacci sequence, knapsack problem, shortest paths (Floyd-Warshall).

---

## Algorithm Complexity Q&A

**What is the difference between time complexity and space complexity?**
- **Time complexity**: How the running time grows relative to input size.
- **Space complexity**: How the memory usage grows relative to input size.

**What is Big O notation?**
Big O describes the **upper bound** on the growth rate of an algorithm's time or space complexity. It characterizes the worst-case behavior as input size grows (e.g., O(1), O(log n), O(n), O(n log n), O(n²)).

**Best-case vs average-case vs worst-case complexity**
- **Best-case**: Minimum time for any input.
- **Average-case**: Expected time for typical inputs.
- **Worst-case**: Maximum time for any input of given size.

**How does a hash table work?**
A hash function maps keys to array indexes. Average O(1) for search, insert, and delete. Collisions are handled via chaining (linked lists at each index) or open addressing (probing for the next available slot).

