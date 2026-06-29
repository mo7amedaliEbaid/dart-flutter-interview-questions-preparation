# Tree
- A tree is a hierarchical data structure commonly used to represent organized information.
- It consists of connected nodes that resemble an upside-down tree structure.

## Nodes:

- The fundamental building blocks of a tree.
- Each node contains data and references (pointers) to other nodes.

### Types of Nodes:

- Root Node: The single topmost node in the tree, with no parent nodes.
- Parent Node: A node connected to one or more child nodes below it in the hierarchy.
- Child Node: A node connected to a single parent node above it.
- Leaf: A node is a leaf if it has no children.
## Properties of a Tree:

- Uniqueness of Parent: Each node, except the root, has exactly one parent node. This ensures a clear hierarchical structure and avoids cycles (loops) in the tree.
- Connectedness: All nodes are connected through a path of edges (references) from the root node.
## Benefits of Tree Structures:

- Efficient Searching: Due to the organized hierarchical nature, searching for specific data can be done efficiently using algorithms like depth-first search (DFS) or breadth-first search (BFS).
- Ordering: The hierarchical structure allows for inherent ordering of data, which is useful for tasks like sorting or representing parent-child relationships.
- Dynamic Updates: Adding or removing nodes is relatively straightforward as it only involves modifying the connections between nodes.
## Common Types of Trees:

- Binary Tree: Each node can have at most two child nodes (left and right). Useful for efficient searching and sorting algorithms.
- Binary Search Tree (BST): A variation of a binary tree where the data in each node follows a specific order (left child has less value, right child has more value). This enables efficient searching with a guaranteed average time complexity.
- N-ary Tree: A node can have any number of child nodes.
## Applications of Trees:

- File systems on computers utilize tree structures to represent directories and subdirectories.
- Family trees depict hierarchical family relationships.
- HTML documents can be represented as trees, where the root node is the main document element and child nodes represent sub-elements like headings, paragraphs, etc.

## Iterating through trees:
### Depth-first search (DFS):
- Depth-first search (DFS) is an algorithm for traversing or searching tree or graph data structures. It starts at a root node (any starting node in the case of a graph) and explores as far as possible along each branch before backtracking.

- Here's a breakdown of how DFS works:

    - Start at a Node: Begin at a chosen node (usually the root node in a tree or any node in a graph).
    - Explore Neighbors: Visit all the unvisited neighbor nodes of the current node.
    - Mark Visited: Add the current node to a list of visited nodes to avoid revisiting it.
    - Recursive Call: For each unvisited neighbor, recursively call the DFS algorithm on that neighbor node.
    - Backtrack: If there are no more unvisited neighbors of the current node, backtrack to the previous node in the search path.
- DFS uses a stack data structure to keep track of the nodes to be explored.
- As the algorithm explores a branch, it pushes the neighbor nodes onto the stack.
- When it reaches a dead end (no more unvisited neighbors), it pops a node from the stack and repeats the process from that node.

- Here are some common applications of DFS:

    - Finding connected components in a graph
    - Topological sorting (ordering a directed acyclic graph)
    - Finding paths in a maze
    - Cycle detection in graphs
### Level-order traversal - Breadth-First Search(BFS)
- Level-order traversal is a way of visiting all nodes in a tree structure.
- A level-order traversal means that you visit all of the nodes at an upper level before visiting any of the nodes at the next level down.
- Unlike depth-first search (DFS) which explores as deep as possible along each branch,
- level-order traversal visits all nodes at a specific level (distance from the root) before moving down to the next level.
- Imagine you're walking down the floors of a building, visiting all the offices on each floor before moving to the next.

- Here's a breakdown of level-order traversal:

    - Start at the Root: Begin with the root node of the tree.
    - Process the Level: Add the root node to a queue data structure (typically a FIFO - First-In-First-Out queue).
    - Iterate While Queue is Not Empty:
    - Dequeue a node from the queue (this is the current node).
    - Process the data of the current node (visit or print the data).
    - If the current node has any child nodes:
        - Add all child nodes of the current node to the back of the queue.
    - Move to Next Level: Repeat step 3 until the queue becomes empty. This signifies that all nodes have been processed.
- Benefits of Level-Order Traversal:

    - Simple and intuitive: Easier to understand compared to DFS which can involve backtracking.
    - Useful for printing tree structure: Shows the tree level by level, providing a clear visual representation.
    - Applications in BFS algorithms: Level-order traversal forms the basis for Breadth-First Search (BFS) algorithms used for various graph and tree problems like finding shortest paths or level-by-level processing.
- Implementation:

    - Level-order traversal can be implemented using a queue data structure.
    - You can iterate through the tree level by level, adding child nodes of the current level to the queue and processing the data of nodes removed from the queue.

- Comparison with DFS:

    - Exploration Strategy: DFS explores as deep as possible on a single branch before backtracking, while level-order traversal focuses on visiting all nodes at a specific level first.
    - Applications: DFS is useful for tasks like finding specific nodes or cycles, while level-order traversal is often used for BFS algorithms or printing the tree structure.
