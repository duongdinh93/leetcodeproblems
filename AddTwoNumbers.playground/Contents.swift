import UIKit

/// Definition for singly-linked list.
class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var currentL2Node: ListNode? = l2
        var currentL1Node: ListNode? = l1
        var storage = 0
        var resultFirstNode: ListNode?
        var currentNode = resultFirstNode
        
        while let cL1Node = currentL1Node, let cL2Node = currentL2Node {
            var nextNewNodeValue = cL1Node.val + cL2Node.val + storage
            
            if nextNewNodeValue >= 10 {
                storage = 1
                nextNewNodeValue = nextNewNodeValue - 10
            } else {
                storage = 0
            }
            
            let nextNewNode = ListNode(nextNewNodeValue)
            
            if currentNode == nil {
                // Store the first node
                currentNode = nextNewNode
                resultFirstNode = nextNewNode
            } else {
                // Append to the list
                currentNode?.next = nextNewNode
            }
            
            // Move the current node to the next
            currentNode = nextNewNode
            currentL1Node = cL1Node.next
            currentL2Node = cL2Node.next
        }
        
        var cNode = currentL1Node != nil ? currentL1Node : currentL2Node
        
        if cNode != nil {
            
            if storage == 0 {
                currentNode?.next = cNode
            } else {
                while let ccNode = cNode {
                    let newNodeValue = ccNode.val + storage
                    
                    if newNodeValue >= 10 {
                        currentNode?.next = ListNode(newNodeValue - 10)
                        storage = 1
                        cNode = cNode?.next
                        currentNode = currentNode?.next
                    } else {
                        currentNode?.next = ListNode(newNodeValue)
                        currentNode = currentNode?.next
                        currentNode?.next = cNode?.next
                        storage = 0
                        break
                    }
                }
            }
        }
        
        // Append the '1' node to the last
        if storage == 1 {
            currentNode?.next = ListNode(1)
            storage = 0
        }
        
        return resultFirstNode
    }
}

let firstNodeFirstList = ListNode(1)
//let f2l1 = ListNode(7)
//let f3l1 = ListNode(3)
//
//firstNodeFirstList.next = f2l1
//f2l1.next = f3l1


let firstNodeSecondList = ListNode(9)
//let f2l2 = ListNode(2)
//let f3l2 = ListNode(4)
//
//firstNodeSecondList.next = f2l2
//f2l2.next = f3l2

let solution = Solution()
let result = solution.addTwoNumbers(firstNodeFirstList, firstNodeSecondList)


