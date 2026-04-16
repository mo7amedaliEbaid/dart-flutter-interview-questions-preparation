# Data Structures

---

## 🟢 Beginner

### What are Data Structures?
A data structure is a mechanical or logical way that data is organized within a program. The organization of data determines how a program performs. Data structures ensure that each line of code performs its function correctly and efficiently, help the programmer identify and fix problems, and help create a clear and organized code base.

### What is a data structure?
A data structure is a way of organizing and storing data to perform operations efficiently.

### What is a stack data structure?
A stack is a Last In, First Out (LIFO) data structure where elements are added and removed from the same end (top). Common operations: push (add), pop (remove), and peek (view the top element).

**Applications of Stack:**
- Temporary storage during recursive operations
- Redo and Undo operations in doc editors
- Reversing a string
- Parenthesis matching
- Function calls order

### What is a queue data structure?
A queue is a First In, First Out (FIFO) data structure where elements are added at the rear and removed from the front. Common operations: enqueue (add), dequeue (remove), and peek.

### What is a List in Dart?
An ordered collection of elements, where each element is identified by an index.
- Elements stored in contiguous memory locations
- O(1) access time but O(n) for inserting or deleting

### What is a Map in Dart?
Reads elements using a key. A data structure that stores key-value pairs.

### What is a Set in Dart?
Contains unique elements. Access time is O(1) on average for HashSet.

### Explain the difference between an array and a linked list.
An array is a static data structure with fixed size, while a linked list is dynamic and can grow or shrink. Arrays have constant time access, but insertion/deletion is less efficient. Linked lists have efficient insertion/deletion but slower access.

### Explain the concept of recursion.
Recursion is a programming technique where a function calls itself in its own definition. Used to break down a problem into smaller subproblems.

### What is a binary search tree (BST)?
A binary search tree is a binary tree where the left subtree of a node contains only nodes with keys less than the node's key, and the right subtree contains only nodes with keys greater than the node's key.

### What is a queue?
A queue is a First In, First Out (FIFO) data structure where elements are added at the rear and removed from the front.

### Linear Search
Sequentially checks each element in a list until a match is found or the end is reached.
- **Time Complexity**: O(n)

### Bubble Sort
Repeatedly steps through the list, compares adjacent elements, and swaps them if in the wrong order.
- **Time Complexity**: O(n²)

### Explain the process behind storing a variable in memory.
- The required amount of memory is assigned first.
- Then it is stored based on the data structure being used.
- Dynamic allocation ensures high efficiency and that storage units can be accessed based on requirements in real-time.

### Can you explain the difference between file structure and storage structure?
- **File Structure**: Representation of data in secondary/auxiliary memory (hard disk, pen drives) that remains intact until manually deleted.
- **Storage Structure**: Data stored in main memory (RAM); deleted once the function using the data finishes executing.

---

## 🟡 Mid Level

### Difference between linear and non-linear data structures?

#### Linear Data Structures
Elements are stored in a sequential manner, where each element has a unique predecessor and successor.
**Examples**: Arrays, Linked Lists, Stacks, Queues
- Elements arranged in a linear/sequential order
- Traversal is usually sequential

#### Non-linear Data Structures
Elements are not arranged sequentially; connected in a way allowing complex relationships.
**Examples**: Trees, Graphs, Hash Tables
- Elements can have relationships with multiple other elements
- Access and traversal may involve more sophisticated algorithms

### Arrays
- Ordered collection with constant O(1) access
- Inserting/deleting: O(n)
- Fixed size (in many languages)

### Linked Lists
![Linked-List-Data-Structure](https://github.com/mo7amedaliEbaid/dart-flutter-interview-questions-preparation/assets/131966482/bb0a6fb5-78fd-42e9-8c85-1b475c77aafa)

A collection of nodes where each node contains data and a reference to the next node.
- Dynamic in size; can grow or shrink
- Efficient insertion/deletion: O(1) at known position
- O(n) access time

### Stacks
A Last In, First Out (LIFO) data structure.
- Elements added/removed from the same end (top)
- Operations: push, pop, peek

### Queues
A First In, First Out (FIFO) data structure.
- Elements added at rear (enqueue), removed from front (dequeue)
- Operations: enqueue, dequeue, peek

### Trees
A hierarchical data structure with a root node and branches leading to leaf nodes.
- Binary trees have at most two children per node
- Common types: Binary Trees, Binary Search Trees (BST), AVL Trees

### Graphs
A collection of nodes connected by edges.
- Can be directed or undirected, weighted or unweighted
- Common representations: adjacency matrix or adjacency list

### Hash Tables
A data structure that uses a hash function to map keys to indexes.
- O(1) average-case complexity for search, insert, and delete
- Handles collisions via chaining (linked lists at index) or open addressing (probing)

### Heaps
A specialized tree-based data structure.
- **Max heap**: parent nodes are greater than or equal to their children (maximum at root)
- **Min heap**: parent nodes are less than or equal to their children (minimum at root)
- Useful for priority queues

### Binary Search
Efficiently finds a target value within a sorted array by repeatedly dividing the search interval in half.
- **Time Complexity**: O(log n)
```dart
class Solution {
  int search(List<int> nums, int target) {
    int h = nums.length - 1;
    int l = 0;
    while (l <= h) {
      int mid = l + (h - l) ~/ 2;
      if (target == nums[mid]) {
        return mid;
      } else if (target > nums[mid]) {
        l = mid + 1;
      } else {
        h = mid - 1;
      }
    }
    return -1;
  }
}
```

### Insertion Sort
Builds the final sorted array one item at a time by repeatedly taking the next element and inserting it in the proper position.
- **Time Complexity**: O(n²)
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
```

### Merge Sort
Divides the unsorted list into n sublists, each containing one element, then repeatedly merges sublists to produce new sorted sublists.
- **Time Complexity**: O(n log n)
```dart
List<int> mergeSort(List<int> nums) {
  if (nums.length <= 1) return nums;
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
      result.add(left[i++]);
    } else {
      result.add(right[j++]);
    }
  }
  result.addAll(left.sublist(i));
  result.addAll(right.sublist(j));
  return result;
}
```

### What is traverse in data structures?
Traversal refers to visiting and accessing each element or node of the structure exactly once.

**Depth-First Traversal:**
- In-order: Visit left subtree, current node, right subtree
- Pre-order: Visit current node, left subtree, right subtree
- Post-order: Visit left subtree, right subtree, current node

**Breadth-First Traversal:**
- Explores all neighbors of a node before moving to the next level

### What is an algorithm?
An algorithm is a step-by-step procedure or set of rules for solving a specific problem or accomplishing a particular task.

### Types of tree data structures?
- **Binary Tree**: Each node has at most two children
- **Binary Search Tree (BST)**: Left child < node < right child; efficient searching
- **AVL Tree**: Self-balancing BST maintaining balance factor
- **Red-Black Tree**: Self-balancing BST with color properties
- **B-Tree**: Self-balancing tree for large datasets (databases, file systems)
- **Trie (Prefix Tree)**: Tree-like structure for storing strings
- **Heap**: Specialized tree with heap property (min-heap or max-heap)

### Difference between heap and tree data structures?
- A **tree** is a generic hierarchical structure where each node has a parent and zero or more children.
- A **heap** is a specialized tree with a specific property (heap property) dictating the relationship between parent and child nodes.
- Trees are for hierarchical representation; heaps are primarily for priority queues.

---

## 🔴 Senior

### What is big O notation?
Big O notation describes the upper bound or worst-case complexity of an algorithm in terms of time or space. It provides a way to express the efficiency of an algorithm and how performance scales with input size.

**Common Complexities:**
- **O(1)** — Constant: Runtime stays constant regardless of input size
- **O(log n)** — Logarithmic: Grows logarithmically (divide-and-conquer)
- **O(n)** — Linear: Grows linearly with input
- **O(n log n)** — Linearithmic: Common in efficient sorting algorithms
- **O(n²)** — Quadratic: Common in nested loops
- **O(2ⁿ)** — Exponential: Doubles with each additional input
- **O(n!)** — Factorial: Highly inefficient for large inputs

```dart
// O(1) - Constant
int getFirst(List<int> list) => list[0];

// O(n) - Linear
int findMax(List<int> list) {
  int max = list[0];
  for (int i = 1; i < list.length; i++) {
    if (list[i] > max) max = list[i];
  }
  return max;
}

// O(n²) - Quadratic
void bubbleSort(List<int> list) {
  for (int i = 0; i < list.length; i++) {
    for (int j = 0; j < list.length - i - 1; j++) {
      if (list[j] > list[j + 1]) {
        int temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
      }
    }
  }
}
```

### Explain the difference between time complexity and space complexity.
- **Time complexity**: How the running time grows relative to the input size.
- **Space complexity**: How the memory usage grows relative to the input size.

### What is the difference between best-case, average-case, and worst-case time complexity?
- **Best-case**: Minimum time for any input of given size
- **Average-case**: Expected time for typical inputs
- **Worst-case**: Maximum time for any input of given size

### Depth-First Search (DFS)
Explores as far as possible along each branch before backtracking.
- Use case: Tree/graph traversal, cycle detection, topological sort
- **Time Complexity**: O(V + E) (vertices + edges)

### Breadth-First Search (BFS)
Visits all vertices at the same level before moving to the next level.
- Use case: Shortest path in unweighted graphs, network broadcasting
- **Time Complexity**: O(V + E)

**BFS vs DFS:**
- BFS explores level by level (uses a queue); DFS explores depth-first (uses stack or recursion)
- BFS finds shortest path in unweighted graphs; DFS is better for exhaustive search

### Dijkstra's Algorithm
Finds the shortest path between two nodes in a graph with non-negative edge weights.
- **Time Complexity**: O((V + E) log V) with a priority queue
- Use case: Navigation, network routing

### Dynamic Programming
Breaks a problem into simpler overlapping subproblems and solves each only once, storing results (memoization/tabulation) to avoid redundant computation.
- Use case: Fibonacci sequence, knapsack problem, shortest paths (Floyd-Warshall)

### LeetCode-style Problem Examples

**Contains Duplicate:**
```dart
class Solution {
  bool containsDuplicate(List<int> nums) {
    nums.sort();
    var i = 0;
    var j = i + 1;
    while (j < nums.length) {
      if (nums[i] == nums[j]) return true;
      i = j;
      j++;
    }
    return false;
  }
}
```

**Two Sum:**
```dart
class Solution {
  List<int> twoSum(List<int> nums, int target) {
    Map<int, int> map = {};
    for (var i = 0; i < nums.length; i++) {
      int complement = target - nums[i];
      if (map.containsKey(complement)) {
        return [i, map[complement]!];
      }
      map[nums[i]] = i;
    }
    return [];
  }
}
```

**Reverse Linked List:**
```dart
class Solution {
  ListNode? reverseList(ListNode? head) {
    ListNode? prev = null;
    ListNode? curr = head;
    while (curr != null) {
      ListNode? temp = curr.next;
      curr.next = prev;
      prev = curr;
      curr = temp;
    }
    return prev;
  }
}
```

**Invert Binary Tree:**
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
    }
    return null;
  }
}
```
