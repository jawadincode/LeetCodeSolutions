void main(List<String> args) {
  // ListNode l1 =
  //     ListNode(val: 2, next: ListNode(val: 4, next: ListNode(val: 3)));
  // ListNode l2 =
  //     ListNode(val: 5, next: ListNode(val: 6, next: ListNode(val: 4)));
  // ListNode l1 = ListNode(val: 0);
  // ListNode l2 = ListNode(val: 0);
  // ListNode l1 = ListNode(
  //   val: 9,
  //   next: ListNode(
  //     val: 9,
  //     next: ListNode(
  //       val: 9,
  //       next: ListNode(
  //         val: 9,
  //         next: ListNode(
  //           val: 9,
  //           next: ListNode(
  //             val: 9,
  //             next: ListNode(
  //               val: 9,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   ),
  // );
  // ListNode l2 = ListNode(
  //   val: 9,
  //   next: ListNode(
  //     val: 9,
  //     next: ListNode(
  //       val: 9,
  //       next: ListNode(
  //         val: 9,
  //       ),
  //     ),
  //   ),
  // );

  ListNode l1 = ListNode(2, ListNode(4, ListNode(3)));
  ListNode l2 = ListNode(5, ListNode(6, ListNode(4)));

  ListNode finalNode = addTwoNumbers(l1, l2);
  printNode(finalNode);
}

ListNode addTwoNumbers(ListNode? l1, ListNode? l2) {
  BigInt n1 = getNumberFromSiglyList(l1);
  BigInt n2 = getNumberFromSiglyList(l2);
  ListNode nodeToReturn = getNodeFromNumber(n1 + n2);
  return nodeToReturn;
}

getNumberFromSiglyList(ListNode? l) {
  String number = '';
  List<ListNode> stack = [];
  while (l != null) {
    stack.add(l);
    l = l.next;
  }
  for (int i = stack.length - 1; i >= 0; i--) {
    number += stack[i].val.toString();
  }
  return BigInt.parse(number);
}

ListNode getNodeFromNumber(BigInt num) {
  List<int> nums = [];
  String number = num.toString();
  for (int i = 0; i < number.length; i++) {
    nums.add(int.parse(number[i]));
  }
  nums = nums.reversed.toList();
  ListNode nodeToReturn = ListNode(nums[0]);
  ListNode current = nodeToReturn;
  for (int i = 1; i < nums.length; i++) {
    current.next = ListNode(nums[i]);
    current = current.next!;
  }
  return nodeToReturn;
}

printNode(ListNode? node) {
  while (node != null) {
    print(node.val);
    node = node.next;
  }
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}
