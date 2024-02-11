## What are Data Structures?
- A data structure is a mechanical or logical way that data is organized within a program. The organization of data is what determines how a program performs. There are many types of data structures, each with its own uses. When designing code, we need to pay particular attention to the way data is structured. If data isn't stored efficiently or correctly structured, then the overall performance of the code will be reduced.

## Why Create Data Structures?
- Data structures serve a number of important functions in a program. They ensure that each line of code performs its function correctly and efficiently, they help the programmer identify and fix problems with his/her code, and they help to create a clear and organized code base.
-## Explain the process behind storing a variable in memory.
- A variable is stored in memory based on the amount of memory that is needed. Following are the steps followed to store a variable:
- The required amount of memory is assigned first.
- Then, it is stored based on the data structure being used.
- Using concepts like dynamic allocation ensures high efficiency and that the storage units can be accessed based on requirements in real-time.

## Can you explain the difference between file structure and storage structure?
- File Structure: Representation of data into secondary or auxiliary memory say any device such as a hard disk or pen drives that stores data which remains intact until manually deleted is known as a file structure representation.
- Storage Structure: In this type, data is stored in the main memory i.e RAM, and is deleted once the function that uses this data gets completely executed.
- The difference is that the storage structure has data stored in the memory of the computer system, whereas the file structure has the data stored in the auxiliary memory.
 - What is a stack data structure? What are the applications of stack?
- A stack is a data structure that is used to represent the state of an application at a particular point in time. The stack consists of a series of items that are added to the top of the stack and then removed from the top. It is a linear data structure that follows a particular order in which operations are performed. LIFO (Last In First Out) or FILO (First In Last Out) are two possible orders. A stack consists of a sequence of items. The element that's added last will come out first, a real-life example might be a stack of clothes on top of each other. When we remove the cloth that was previously on top, we can say that the cloth that was added last comes out first.
- Following are some applications for stack data structure:

- It acts as temporary storage during recursive operations
- Redo and Undo operations in doc editors
- Reversing a string
- Parenthesis matching
- Postfix to Infix Expressions
- Function calls order

## What is a queue data structure? What are the applications of queue?
- A queue is a linear data structure that allows users to store items in a list in a systematic manner. The items are added to the queue at the rear end until they are full, at which point they are removed from the queue from the front. Queues are commonly used in situations where the users want to hold items for a long period of time, such as during a checkout process. A good example of a queue is any queue of customers for a resource where the first consumer is served first.

### What is an Algorithm?
- An algorithm is a finite sequence of well-defined instructions used to solve a class of problems or conduct a computation in mathematics and computer science.
- Algorithms are used to specify how calculations, data processing, automated reasoning, automated decision making, and other tasks should be done. An algorithm is a method for calculating a function that can be represented in a finite amount of space and time and in a well defined formal language. The instructions describe a computation that, when run, continues through a finite number of well defined subsequent stages, finally creating "output" and terminating at a final ending state, starting from an initial state and initial input (possibly empty). The shift from one state to the next is not always predictable; some algorithms, known as randomised algorithms, take random input into account.
### Advatages:
- Algorithms boost the effectiveness of an existing method.
It is easy to compare an algorithm's performance to those of other approaches using various methods (Time Complexity, Space Complexity, etc.).
Algorithms provide the designers with a detailed description of the criteria and goals of the problems.
They also enable a reasonable comprehension of the program's flow.
Algorithms evaluate how well the approaches work in various scenarios (Best cases, worst cases, average cases).
An algorithm also determines which resources (input/output, memory) cycles are necessary.
We can quantify and assess the problem's complexity in terms of time and space using an algorithm.
The cost of design is also reduced if proper algorithms are used.

- How can we compare between two algorithms written for the same problem?
- The complexity of an algorithm is a technique that is used to categorise how efficient it is in comparison to other algorithms. It focuses on how the size of the data set to be processed affects execution time. In computing, the algorithm's computational complexity is critical. It is a good idea to categorise algorithms according to how much time or space they take up and to describe how much time or space they take up as a function of input size.

- Complexity of Time: The running time of a program as a function of the size of the input is known as time complexity.
- Complexity of Space: Space complexity examines algorithms based on how much space they require to fulfil their tasks. In the early days of computers, space complexity analysis was crucial (when storage space on the computer was limited).

- What is asynchronous programming?
- Allows tasks to be excuted independntly and concurrently without waiting for each other to complete ,
- It inables a non-blocking operations , allowing a program to continue processing other tasks while waiting for certain operations to finish. 

## Data Structure
### Arrays:

An ordered collection of elements, where each element is identified by an index or a key.
Elements are stored in contiguous memory locations.
Access time is constant, O(1), but inserting or deleting elements may be less efficient, O(n).
### Linked Lists:

A collection of nodes, where each node contains data and a reference (or link) to the next node in the sequence.
Dynamic in size and can easily grow or shrink.
Efficient insertion and deletion, but access time is O(n) since you have to traverse the list.
### Stacks:

A Last In, First Out (LIFO) data structure.
Elements are added and removed from the same end, called the top.
Common operations: push (add), pop (remove), and peek (view the top element).
### Queues:

A First In, First Out (FIFO) data structure.
Elements are added at the rear (enqueue) and removed from the front (dequeue).
Common operations: enqueue, dequeue, and peek.
### Trees:

A hierarchical data structure with a root node and branches leading to leaf nodes.
Binary trees have at most two children per node.
Common types include Binary Trees, Binary Search Trees (BST), and AVL Trees.
### Graphs:

A collection of nodes connected by edges.
Can be directed or undirected, weighted or unweighted.
Common representations: adjacency matrix or adjacency list.
### Hash Tables:

A data structure that uses a hash function to map keys to indexes in an array.
Provides constant time average-case complexity for search, insert, and delete operations.
### Heaps:

A specialized tree-based data structure.
Max heap: parent nodes are greater than or equal to their children.
Min heap: parent nodes are less than or equal to their children.
Useful for priority queues.

## What is a data structure?

A data structure is a way of organizing and storing data to perform operations efficiently.
## Explain the difference between an array and a linked list.

An array is a static data structure with fixed size, while a linked list is dynamic and can grow or shrink. Arrays have constant time access, but insertion/deletion is less efficient. Linked lists have efficient insertion/deletion but slower access.
## What is a stack?

A stack is a Last In, First Out (LIFO) data structure where elements are added and removed from the same end (top). Common operations include push (add), pop (remove), and peek (view the top element).
## Explain the concept of recursion.

Recursion is a programming technique where a function calls itself in its own definition. It is often used to break down a problem into smaller subproblems.
## What is a binary search tree (BST)?
A binary search tree is a binary tree where the left subtree of a node contains only nodes with keys less than the node's key, and the right subtree contains only nodes with keys greater than the node's key.
## Describe the depth-first search (DFS) algorithm.

DFS is an algorithm for traversing or searching tree or graph data structures. It explores as far as possible along each branch before backtracking.
## What is the time complexity of searching in a balanced binary search tree?

The time complexity is O(log n) for a balanced binary search tree, where n is the number of nodes.
## Explain the concept of hashing.

Hashing is the process of converting a key into an index within a hash table using a hash function. It enables efficient retrieval, insertion, and deletion of data.
## What is a queue?

A queue is a First In, First Out (FIFO) data structure where elements are added at the rear and removed from the front. Common operations include enqueue (add), dequeue (remove), and peek.
## How does a hash table handle collisions?

Collisions are handled by using techniques such as chaining (using linked lists to store multiple elements at the same index) or open addressing (finding the next available slot in the array).
## Linear Search:

Sequentially checks each element in a list until a match is found or the end of the list is reached.
Time Complexity: O(n)
## Binary Search:

Efficiently finds a target value within a sorted array by repeatedly dividing the search interval in half.
Time Complexity: O(log n)
## Bubble Sort:

Repeatedly steps through the list, compares adjacent elements, and swaps them if they are in the wrong order.
Time Complexity: O(n^2)
## Insertion Sort:

Builds the final sorted array one item at a time by repeatedly taking the next element and inserting it into the proper position.
Time Complexity: O(n^2)
## Merge Sort:

Divides the unsorted list into n sublists, each containing one element, and then repeatedly merges sublists to produce new sorted sublists.
Time Complexity: O(n log n)
## Quick Sort:

Chooses a 'pivot' element and partitions the array into two sub-arrays according to whether elements are less than or greater than the pivot.
Time Complexity: O(n log n) on average, but can degrade to O(n^2) in worst-case scenarios.
## Depth-First Search (DFS):

Explores as far as possible along each branch before backtracking in a tree or graph.
Used for: Tree and graph traversal.
## Breadth-First Search (BFS):

Visits all the vertices of a graph in breadth-first order, i.e., it visits all the vertices at the same level before moving on to the next level.
Used for: Shortest path problems, network broadcasting.
## Dijkstra's Algorithm:

Finds the shortest path between two nodes in a graph with non-negative edge weights.
Used for: Shortest path problems in weighted graphs.
## Dynamic Programming:

Breaks down a problem into simpler overlapping subproblems and solves each subproblem only once, storing the solutions to subproblems to avoid redundant computations.
Used for: Optimization problems, such as the Fibonacci sequence or the knapsack problem.

## What is an algorithm?

An algorithm is a step-by-step procedure or set of rules for solving a specific problem or accomplishing a particular task.
## Explain the difference between time complexity and space complexity.

Time complexity measures the amount of time an algorithm takes to complete, while space complexity measures the amount of memory an algorithm uses.
## What is the time complexity of binary search?

O(log n) - Binary search efficiently finds a target value within a sorted array by dividing the search interval in half.
## Describe the concept of Big O notation.

Big O notation is used to describe the upper bound on the growth rate of an algorithm's time or space complexity in terms of the input size.
## What is the difference between best-case, average-case, and worst-case time complexity?

Best-case time complexity is the minimum time an algorithm takes, average-case is the expected time, and worst-case is the maximum time for any input size.
## Explain the quicksort algorithm.

Quicksort is a divide-and-conquer algorithm that selects a pivot, partitions the array into two subarrays, and recursively sorts the subarrays.
## What is the significance of Dijkstra's algorithm?

Dijkstra's algorithm is used to find the shortest path between two nodes in a graph with non-negative edge weights.
## How does a hash table work, and what is its time complexity for search, insert, and delete operations?

A hash table uses a hash function to map keys to indexes. The time complexity for search, insert, and delete is O(1) on average, but can be O(n) in the worst case due to collisions.
## Explain the concept of dynamic programming.

Dynamic programming breaks down a problem into simpler overlapping subproblems and solves each subproblem only once, storing solutions to avoid redundant computations.
## What is the difference between breadth-first search (BFS) and depth-first search (DFS)?

BFS explores all vertices of a graph in breadth-first order, while DFS explores as far as possible along each branch before backtracking.

