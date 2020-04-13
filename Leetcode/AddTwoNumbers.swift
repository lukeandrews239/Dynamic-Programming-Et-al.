// Not necessarily Dynamic Programming. Medium difficulty nonetheless...

// 2. Add Two Numbers
// Medium
//
// 7508
//
// 1941
//
// Add to List
//
// Share
// You are given two non-empty linked lists representing two non-negative integers.
// The digits are stored in reverse order and each of their nodes contain a single digit.
// Add the two numbers and return it as a linked list.
//
// You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//
// Example:
//
// Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
// Output: 7 -> 0 -> 8
// Explanation: 342 + 465 = 807.
// /**
//  * Definition for singly-linked list.
//  * public class ListNode {
//  *     public var val: Int
//  *     public var next: ListNode?
//  *     public init(_ val: Int) {
//  *         self.val = val
//  *         self.next = nil
//  *     }
//  * }
//  */
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        guard let listOne = l1 else {return l2}
        guard let listTwo = l2 else {return listOne}

        return compose(one: listOne, two: listTwo, num: 0)
    }

    func compose(one: ListNode?, two: ListNode?, num: Int) -> ListNode {
        var val : Int = num
        var pass = 0
        var first = one?.next ?? nil
        var second = two?.next ?? nil
        if let firstOne = one {
            val += firstOne.val
        }
        if let secondOne = two {
            val += secondOne.val
        }
        if val >= 10 {
            val = val % 10
            pass = 1
        }
        var node = ListNode(val)
        if first == nil && second == nil {
            if (pass != 0) {
                node.next = ListNode(1)
            }
            return node
        } else {
            node.next = compose(one: first, two: second, num: pass)
            return node
        }
    }
}
// Success
// Details
// Runtime: 48 ms, faster than 74.97% of Swift online submissions for Add Two Numbers.
// Memory Usage: 21 MB, less than 11.11% of Swift online submissions for Add Two Numbers.