//
//  LinkedList.swift
//  TestProb
//
//  Created by Anupriya V on 05/04/23.
//

import Foundation
class SinglyList<T> {
    var value: T
    var nextNode: SinglyList?
    init(value: T, nextNode: SinglyList? = nil) {
        self.value = value
        self.nextNode = nextNode
    }
}
extension ViewController {
    func removeDuplicates(head: SinglyList<Int>?) -> SinglyList<Int>? {
        //Recursive
//        if head?.nextNode == nil {
//            return head
//        }
//        if head?.value == head?.nextNode?.value {
//            head?.nextNode = removeDuplicates(head: head?.nextNode?.nextNode)
//        }
//        return head?.nextNode
        
        //Iterative
        if head == nil {
            return nil
        }
        var currentNode = head
        while currentNode!.nextNode != nil {
            if currentNode?.value == currentNode?.nextNode!.value {
                currentNode?.nextNode = currentNode?.nextNode!.nextNode
            } else {
                currentNode = currentNode?.nextNode
            }
        }
        return head
    }
    func removeElementFromLinkedList(_ head: SinglyList<Int>?, _ val: Int) -> SinglyList<Int>? {
        if head?.nextNode == nil {
            return nil
        }
        var prev: SinglyList? = head
        var curr: SinglyList? = head
        while curr?.nextNode != nil {
            if curr?.value == val {
                prev?.nextNode = curr?.nextNode
                curr = prev
            } else {
                prev = curr
                curr = curr?.nextNode
            }
        }
        return head
    }
}
