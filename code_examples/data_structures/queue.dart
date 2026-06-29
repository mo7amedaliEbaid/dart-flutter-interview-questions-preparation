abstract class Queue<E> {
  bool enqueue(E element);
  E? dequeue();
  bool get isEmpty;
  E? get peek;
}

/*
These are the meanings of the core operations:
• enqueue : Insert an element at the back of the queue. Return true if the operation
was successful.
• dequeue : Remove the element at the front of the queue and return it.
• isEmpty : Check if the queue is empty.
• peek : Return the element at the front of the queue without removing it.*/



class QueueStack<E> implements Queue<E> {
  final _leftStack = <E>[];
  final _rightStack = <E>[];

  @override
  bool enqueue(E element) {
    _rightStack.add(element);
    return true;
  }
// Recall that the right stack is used to enqueue elements.
// You simply push to the stack by appending to the list. From implementing the
// QueueList previously, you know that appending an element is an O(1) operation.
  @override
  E? dequeue() {
    if (_leftStack.isEmpty) {
// 1
      _leftStack.addAll(_rightStack.reversed);
// 2
      _rightStack.clear();
    }
    if (_leftStack.isEmpty) return null;
// 3
    return _leftStack.removeLast();
  }
  // The following explanations refer to the numbered comments in the code above:
  // 1. If the left stack is empty, set it as the reverse of the right stack:
  // 2. Invalidate your right stack. Since you have transferred everything to the left, just
  // clear the right
  // 3.Remove the last element from the left stack:

  @override
  bool get isEmpty => _leftStack.isEmpty && _rightStack.isEmpty;

  // To check if the queue is empty, simply check that both the left and right stacks are
  // empty. This means that there are no elements left to dequeue and no new elements
  // have been enqueued.

  @override
  E? get peek => _leftStack.isNotEmpty ? _leftStack.last : _rightStack.first;

// You know that peeking looks at the top element. If the left stack is not empty, the
// element on top of this stack is at the front of the queue. If the left stack is empty, the
// right stack will be reversed and placed in the left stack. In this case, the element at
// the bottom of the right stack is next in the queue.
// Note that the two properties isEmpty and peek are still O(1) operations.

  @override
  String toString() {
    final combined = [
      ..._leftStack.reversed,
      ..._rightStack,
    ].join(', ');
    return '[$combined]';
  }
}
// The idea behind using two stacks is simple. Whenever you enqueue an element, it
// goes in the right stack.
// When you need to dequeue an element, you reverse the right stack, place it in the
// left stack, and remove the top element.
// This reversing operation is only required when the left stack is empty, making most
// enqueue and dequeue operations constant-time.
// Remember, you only transfer the elements in the right stack when the left stack is
// empty!
// Note: Yes, reversing the contents of a list is an O(n) operation. However, the
// overall dequeue cost is still amortized O(1). Imagine having a large number of
// items in both the left and right stacks. The reverse copy is only required
// infrequently when the left stack becomes empty.

main(){
  final queue = QueueStack<String>();
  queue.enqueue("Ray");
  queue.enqueue("Brian");
  queue.enqueue("Eric");
  print(queue); // [Ray, Brian, Eric]
  queue.dequeue();
  print(queue); // [Brian, Eric]
  queue.peek;
  print(queue); // [Brian, Eric]
}

// Compared to the list-based implementation, by leveraging two stacks, you were able
// to transform dequeue into an amortized O(1) operation.
// Moreover, your two-stack implementation is fully dynamic and doesn’t have the
// fixed size restriction that your ring-buffer-based queue implementation has. Worst-
// case performance is O(n) when the right queue needs to be reversed or runs out of
// capacity. Running out of capacity doesn’t happen very often thanks to the fact that
// Dart doubles the capacity every time.
// Finally, it beats the linked list in terms of spatial locality. This is because list
// elements are next to each other in memory blocks. So a large number of elements
// will be loaded in a cache on first access. Even though a list requires O(n) for simple
// copy operations, it’s a very fast O(n) happening close to memory bandwidth.