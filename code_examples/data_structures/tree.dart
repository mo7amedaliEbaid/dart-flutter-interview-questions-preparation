import 'package:win_interview/ds/queue.dart';


class TreeNode<T> {
  TreeNode(this.value);

  T value;
  List<TreeNode<T>> children = [];

  // Like a linked-list node, each TreeNode stores a value . However, since tree nodes can
// point to multiple other nodes, you use a list to hold references to all the children .

  void add(TreeNode<T> child) {
    children.add(child);
  }

  // recursive code is where a method calls itself. It’s
  // particularly useful for visiting all of the members of a tree data structure.
  // Note: It’s also possible to use a stack if you don’t want your implementation
  // to be recursive. Recursion uses a stack under the hood.
  void forEachDepthFirst(void Function(TreeNode<T> node) performAction) {
    performAction(this);
    for (final child in children) {
      child.forEachDepthFirst(performAction);
    }
  }

  // The queue ensures that the nodes are visited in the right level-order. A simple
  // recursion, which implicitly uses a stack, would not have worked!
  // You first enqueue the root node (level 0) and then add the children (level 1). The
  // while loop subsequently enqueues all of the children on the next level down.
  // Since a queue is first-in-first-out, this will result in each level dequeuing in order
  // from top to bottom.
  void forEachLevelOrder(void Function(TreeNode<T> node) performAction) {
    final queue = QueueStack<TreeNode<T>>();
    performAction(this);
    children.forEach(queue.enqueue);
    var node = queue.dequeue();
    while (node != null) {
      performAction(node);
      node.children.forEach(queue.enqueue);
      node = queue.dequeue();
    }
  }

  TreeNode? search(T value) {
    TreeNode? result;
    forEachLevelOrder((node) {
      if (node.value == value) {
        result = node;
      }
    });
    return result;
  }
}

void main() {
  final tree = makeBeverageTree();
  tree.forEachDepthFirst((node) => print(node.value));

  tree.forEachLevelOrder((node) => print(node.value));
  final searchResult1 = tree.search('ginger ale');
  print(searchResult1?.value); // ginger ale
  final searchResult2 = tree.search('water');
  print(searchResult2?.value); // null
}

TreeNode<String> makeBeverageTree() {
  final tree = TreeNode('beverages');
  final hot = TreeNode('hot');
  final cold = TreeNode('cold');
  final tea = TreeNode('tea');
  final coffee = TreeNode('coffee');
  final chocolate = TreeNode('cocoa');
  final blackTea = TreeNode('black');
  final greenTea = TreeNode('green');
  final chaiTea = TreeNode('chai');
  final soda = TreeNode('soda');
  final milk = TreeNode('milk');
  final gingerAle = TreeNode('ginger ale');
  final bitterLemon = TreeNode('bitter lemon');
  tree.add(hot);
  tree.add(cold);
  hot.add(tea);
  hot.add(coffee);
  hot.add(chocolate);
  cold.add(soda);
  cold.add(milk);
  tea.add(blackTea);
  tea.add(greenTea);
  tea.add(chaiTea);
  soda.add(gingerAle);
  soda.add(bitterLemon);
  return tree;
}