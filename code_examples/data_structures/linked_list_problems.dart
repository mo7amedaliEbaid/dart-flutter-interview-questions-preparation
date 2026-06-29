// Singly Linked List

class ListNode {
  int val;
  ListNode? next;

  ListNode([this.val = 0, this.next]);
}

ListNode? reversList(ListNode? head) {
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


ListNode? reverse(ListNode? head){
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

// 1=>2=>3=>4
// 1<=2<=3<=4

// time O(n)
// space O(1)

class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    ListNode dummy = ListNode(0); // Dummy node to simplify result list creation
    ListNode current = dummy; // Pointer for the result list
    int carry = 0; // Carry for sums greater than 9

    while (l1 != null || l2 != null || carry != 0) {
      int sum = (l1?.val ?? 0) +
          (l2?.val ?? 0) +
          carry; // Sum of current digits and carry
      carry = sum ~/ 10; // Calculate new carry
      current.next = ListNode(sum % 10); // Create new node with the digit value
      current = current.next!; // Move to the next node

      // Move to the next nodes in l1 and l2 if available
      l1 = l1?.next;
      l2 = l2?.next;
    }

    return dummy.next; // Return result list, skipping the dummy node
  }
}

// Time & Space Complexity
// Time complexity:
// O(m+n)
// Space complexity:
// O(1)
// Where
// m is the length
// l1
// n is the length of
// l2.
void printList(ListNode? node) {
  while (node != null) {
    print(node.val);
    node = node.next;
  }
}

// Example usage:
void main() {
  // l1: 2 -> 4 -> 3 (represents 342)
  ListNode l1 = ListNode(2, ListNode(4, ListNode(3)));

  // l2: 5 -> 6 -> 4 (represents 465)
  ListNode l2 = ListNode(5, ListNode(6, ListNode(4)));

  ListNode? result = Solution().addTwoNumbers(l1, l2);
  printList(result); // Output should be 7 -> 0 -> 8 (represents 807)
}
