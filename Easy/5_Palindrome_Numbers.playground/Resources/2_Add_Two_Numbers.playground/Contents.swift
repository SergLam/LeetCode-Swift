import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

public class ListNode {
    
    public var val: Int
    public var next: ListNode?
    
    public init() {
        self.val = 0
        self.next = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
    
}

class Solution {
    
  func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    let head: ListNode? = ListNode(0)
    var p: ListNode? = l1
    var q: ListNode? = l2
    var curr: ListNode? = head
    
    var carry: Int = 0
    
    while (p != nil || q != nil) {
        
        let x: Int = p?.val ?? 0
        let y: Int = q?.val ?? 0
        let sum: Int = carry + x + y
        print(sum)
        
        carry = sum / 10
        
        curr?.next = ListNode(sum % 10)
        curr = curr?.next
        print(curr?.val, curr?.next)
        
        p = p?.next
        q = q?.next
        print(head?.val, head?.next, head?.next?.val, head?.next?.next?.val, head?.next?.next?.next?.val)
    }
    if (carry > 0) {
        curr?.next = ListNode(carry)
    }
    return head?.next
  }
    
}

// [2,4,3]
// [5,6,4]

// [7,0,8]

let l1: ListNode = ListNode(2, ListNode(4, ListNode(3)))
let l2: ListNode = ListNode(5, ListNode(6, ListNode(4)))

let result = Solution().addTwoNumbers(l1, l2)
