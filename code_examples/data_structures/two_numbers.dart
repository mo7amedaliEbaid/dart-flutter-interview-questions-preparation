// You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
//
// You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//
// solve in dart using iteration
// class ListNode {
//   int val;
//   ListNode? next;
//
//   ListNode([this.val = 0, this.next]);
// }
// ChatGPT said:
// ChatGPT
// Here’s a Dart solution using iteration to solve the problem of adding two numbers represented as linked lists:
//
// dart
// Copy code
// class ListNode {
//   int val;
//   ListNode? next;
//
//   ListNode([this.val = 0, this.next]);
// }
//
// ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
//   ListNode dummy = ListNode(0); // Dummy node to simplify result list creation
//   ListNode current = dummy; // Pointer for the result list
//   int carry = 0; // Carry for sums greater than 9
//
//   while (l1 != null || l2 != null || carry != 0) {
//     int sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carry; // Sum of current digits and carry
//     carry = sum ~/ 10; // Calculate new carry
//     current.next = ListNode(sum % 10); // Create new node with the digit value
//     current = current.next!; // Move to the next node
//
//     // Move to the next nodes in l1 and l2 if available
//     l1 = l1?.next;
//     l2 = l2?.next;
//   }
//
//   return dummy.next; // Return result list, skipping the dummy node
// }
//
// // Helper function to print the linked list (for testing)
// void printList(ListNode? node) {
//   while (node != null) {
//     print(node.val);
//     node = node.next;
//   }
// }
//
// // Example usage:
// void main() {
//   // l1: 2 -> 4 -> 3 (represents 342)
//   ListNode l1 = ListNode(2, ListNode(4, ListNode(3)));
//
//   // l2: 5 -> 6 -> 4 (represents 465)
//   ListNode l2 = ListNode(5, ListNode(6, ListNode(4)));
//
//   ListNode? result = addTwoNumbers(l1, l2);
//   printList(result); // Output should be 7 -> 0 -> 8 (represents 807)
// }
// Explanation:
// Dummy Node: Simplifies the logic for handling the head of the result list.
// Carry: Tracks any value greater than 9 during the addition.
// Iteration: Loops through both lists until both are null and no carry remains.
// Helper Function: Prints the linked list for verification.
// This solution handles different list lengths and ensures carry-over is accounted for.