//
//  ViewController.swift
//  TestProb
//
//  Created by Anupriya V on 18/03/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        print(verifyAlienDict(words: ["hello", "leetcode"], order: "hlabcdefgijkmnopqrstuvwxyz"))
//        print(astroiodCollision(astroids: [10,2, -5]))
//        print(maxKKilledEnemies(grid: [["0", "E", "0","0"], ["E", "0", "w", "E"], ["0", "E", "0", "0"]]))
//        print(canPlaceFlowers(flowerBed: [0,0,0,0,1,0, 0], n: 3))
//        print(diagonalMatrix(matrix: [[1,2,3],[4,5,6],[7,8,9]]))
//        print(isValidParanthesis(s: "{]"))
//        recursivePrint(count: 5)
//        print(printFibonicci(n: 8))
//        print(removeDuplicates([1,1,2]))
//        var arr = [0,1,2,2,3,0,4,2]
//        print(removeElementExcept(nums: &arr, val: 2))
//        print(strStr(haystack: "osadpop", needle: "sad"))
//        print(insertElementInSortedOrder(nums: [1,3,5,6], target: 2))
//        print(lengthOfLastWord(s:"Hello world "))
//        print(binarySearchRecursion(arr: [1,5,9,11], low: 0, high: 4, key: 1))
//        print(factorial(n: 5))
//        print(sumOfDigits(n: 1342))
//        var sum = 0
//        print(reverseNumber(n: 3428))
//        var count = 0
//        print(countNumberOfZeros(count: &count, n:0403010))
//        customPrivateQueue()
//        dispatchGroup()
//        dispatchSemaphore()
//        dispatchSource()
        var node1 = SinglyList<Int>(value: 1)
        var node2 = SinglyList<Int>(value: 2)
        var node3 = SinglyList<Int>(value: 6)
        var node4 = SinglyList<Int>(value: 3)
        var node5 = SinglyList<Int>(value: 4)
        var node6 = SinglyList<Int>(value: 5)

        node1.nextNode = node2
        node2.nextNode = node3
        node3.nextNode = node4
        node4.nextNode = node5
        node5.nextNode = node6
        
//        print(removeDuplicates(head: node1))
        print(removeElementFromLinkedList(node1, 6))
    }
}
