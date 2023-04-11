//
//  RecursionProoblems.swift
//  TestProb
//
//  Created by Anupriya V on 03/04/23.
//

import Foundation
extension ViewController {
    func countNumberOfZeros(count: inout Int, n: Int) -> Int {
        if n%10 == n {
            return count
        }
        if n%10 == 0 {
            count += 1
            
        }
        return countNumberOfZeros(count: &count, n: n/10)
        
    }
    func recursivePalindrome(n: Int) -> Bool {
        let reverse = reverseNumber(n: n)
        return n == reverse
    }
    func reverseNumber(n: Int) -> Int {
        var sum = 0
        return reverse(sum: &sum, n: n)
    }

    func reverse(sum: inout Int, n: Int) -> Int {
        // f(324)
        // (4*10)+ 2 = 42
        // 420*10 + 3 = 423
        // sum = sum*10 + reminder
        // return n/10
        if n == 0 { return sum}
        sum = (sum*10)
        sum = sum + n%10
        return reverse(sum: &sum, n: n/10)
    }
    func sumOfDigits(n:Int) -> Int {
        guard n > 0 else {
            return 0
        }
        print(n%10)
        let sum = (n%10) + sumOfDigits(n: n/10)
        //Similarly product of every number
//        let product = (n%10) * sumOfDigits(n: n/10)// But return must be guard (n%10 == n), return n
        return sum
        
        /*//Iterative
        var val = 0
        var i = n
        while (i%10) > 0 {
            val = val + (i%10)
            i /= 10
            if n%10 == n { i -= 1}
        }
        return val
        */
    }

    func factorial(n:Int) -> Int {
        guard n >= 1 else {
            return 0
        }
        if n == 1 {
            return 1
        }
        let factorial = n * factorial(n: n-1)
        print(factorial)
        return factorial
    }
    func binarySearchRecursion(arr:[Int], low: Int, high: Int, key: Int) -> Int {
        guard low < high else {
            return -1
        }
        let mid = low + (high-low)/2
        if key < arr[mid] {
            return binarySearchRecursion(arr: arr, low: low, high: mid, key: key)
        } else if key > arr[mid] {
            return binarySearchRecursion(arr: arr, low: mid+1, high: high, key: key)
        } else {
            return mid
        }
    }
    func lengthOfLastWord(s:String) -> Int {
        let arr = Array(s)
        var count = 0
        for var i in (0..<arr.count).reversed() {
            if arr[i] == " ", count == 0 {
                i -= 1
            } else if arr[i] == " " {
                return count
            } else {
                count += 1
            }
        }
        return count
    }
 
    func insertElementInSortedOrder(nums: [Int], target: Int) -> Int? {
        var lowerBound = 0
        var upperBound = nums.count
        while lowerBound < upperBound {
            let mid = lowerBound + (upperBound-lowerBound)/2
            if nums[mid] < target {
                lowerBound = mid+1
            } else if nums[mid] > target {
                upperBound = mid
            } else {
                return mid
            }
        }
        return lowerBound
    }
    func removeDuplicates(_ nums: [Int]) -> Int {
        var arr = nums
        var index = arr.count-1
        while index > 0 {
            if arr[index] == arr[index-1] {
                arr.remove(at: index)
            }
            index -= 1
        }
        print(arr)
        return arr.count
    }

    func strStr(haystack: String, needle: String) -> Int {
        //sadbutsad //sad
        //start from index 0 check if needle value matches, else increment the index bt needle.count.
        guard needle.count <= haystack.count else {
            return -1
        }
        let arr = Array(haystack)
        for var i in 0...arr.count-needle.count {
            let str = arr[i...(i+needle.count-1)]
            if String(str) == needle {
                return i
            } else {
                i += needle.count-1
            }
        }
        return -1
        //ALTERNATE SOLUTION
        if let range = haystack.range(of: needle) {
            return range.lowerBound.utf16Offset(in: needle)
        }
        return -1
    }
    func recursivePrint(n: Int? = nil, count: Int) {
        var printVal = n ?? 1
        print(printVal)

        //Base condition where recusrion will stop making new calls
        if printVal == count {
            return
        }
        recursivePrint(n: printVal+1, count: count)
    }
    
    func printFibonicci(n: Int) -> Int {
        //0,1,1,2,3,5,8,13...
        // How to identify whether prob can be solved viaa recursion
        // If there is smaller version of the problem/ brak into smaller problems thenn choose recursion
        //fib(n) = fib(n-1)+fib(n-2) // adding previous 2 numbers give fibonocci number // Bigger problem is divvided into smaller prooblem
        // Base condition: fib(0) and fib(1) is known and return it
        var dict = [Int:Int]()
        if n < 2 {
            return n
        }
        var fib:Int
        if let val = dict[n] {
            return val
        } else {
            fib = printFibonicci(n: n-1) + printFibonicci(n: n-2)
            dict[n] = fib
        }
        return fib
    }

}
