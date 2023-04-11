//
//  LeetcodeProblems.swift
//  TestProb
//
//  Created by Anupriya V on 03/04/23.
//

import Foundation
extension ViewController {
    
    func verifyAlienDict(words: [String], order: String) -> Bool {
        let charOrder = Dictionary(uniqueKeysWithValues: order.enumerated().map{ ($0.1, $0.0)})
        print(charOrder)
        for i in 0..<words.count-1 {
            var j = 0
            var currentword = Array(words[i])
            var nextWord = Array(words[i+1])
            while j < min(currentword.count, nextWord.count) {
                let currentChar = currentword[j]
                let nextChar = nextWord[j]
                guard currentChar != nextChar else {
                    j += 1
                    continue
                }
                if charOrder[currentChar]! > charOrder[nextChar]! {
                    return false
                } else {
                    break
                }
                if j == nextWord.count && currentword.count > nextWord.count {
                    return false
                }
            }
        }
        return true
    }

    /*We are given an array asteroids of integers representing asteroids in a row.
     
     For each asteroid, the absolute value represents its size, and the sign represents its direction (positive meaning right, negative meaning left). Each asteroid moves at the same speed.

     Find out the state of the asteroids after all collisions. If two asteroids meet, the smaller one will explode. If both are the same size, both will explode. Two asteroids moving in the same direction will never meet.

      

     Example 1:

     Input: asteroids = [5,10,-5]
     Output: [5,10]
     Explanation: The 10 and -5 collide resulting in 10. The 5 and 10 never collide.
     Example 2:

     Input: asteroids = [8,-8]
     Output: []
     Explanation: The 8 and -8 collide exploding each other.
     Example 3:

     Input: asteroids = [10,2,-5]
     Output: [10]
     Explanation: The 2 and -5 collide resulting in -5. The 10 and -5 collide resulting in 10.
*/
    func astroiodCollision(astroids: [Int]) -> [Int] {
        var positive = [Int]()
        var negatiives = [Int]()
        for astroid in astroids {
            if astroid > 0 {
                positive.append(astroid)
            } else {
                var shouldAppendToNegatives = true
                while positive.count > 0 {
                    if positive.last! > -astroid {
                        shouldAppendToNegatives = false
                        break
                    } else {
                        let last = positive.removeLast()
                        if positive.last == -astroid {
                            shouldAppendToNegatives = false
                            break
                        }
                    }
                }
                if shouldAppendToNegatives {
                    negatiives.append(astroid)
                }
            }
        }
        return positive + negatiives
    }

/*Given a 2D grid, each cell is either a wall 'W', an enemy 'E' or empty '0' (the number zero), return the maximum enemies you can kill using one bomb.
 The bomb kills all the enemies in the same row and column from the planted point until it hits the wall since the wall is too strong to be destroyed.
 Note: You can only put the bomb at an empty cell.
 Example:
 Input: [["0","E","0","0"],["E","0","W","E"],["0","E","0","0"]]
 Output: 3
 Explanation: For the given grid,

 0 E 0 0
 E 0 W E
 0 E 0 0

 Placing a bomb at (1,1) kills 3 enemies.*/
    func maxKKilledEnemies(grid: [[Character]]) -> Int {
        var res = 0
        let row = grid.count
        let col = grid[0].count
        var columnHit = Array(repeating: 0, count: col)
        var rowHit = 0
        for i in 0..<row {
            for j in 0..<col {
                //row
                if j == 0 || grid[i][j-1] == "w" {
                    rowHit = 0
                    for y in j..<col {
                        if grid[i][y] == "w" {
                            break
                        }
                        if grid[i][y] == "E" {
                            rowHit += 1
                        }
                    }
                }
                //column
                if i == 0 || grid[i-1][j] == "w" {
                    columnHit[j] = 0
                    for x in i..<row {
                        if grid[x][j] == "w" {
                            break
                        }
                        if grid[x][j] == "E" {
                            columnHit[j] += 1
                        }
                    }
                }
                if grid[i][j] == "0" {
                    res = max(res, rowHit+columnHit[j])
                }
            }
        }
        return res
    }

/*You have a long flowerbed in which some of the plots are planted, and some are not. However, flowers cannot be planted in adjacent plots.
 
 Given an integer array flowerbed containing 0's and 1's, where 0 means empty and 1 means not empty, and an integer n, return if n new flowers can be planted in the flowerbed without violating the no-adjacent-flowers rule.

  
 4
 Example 1:

 Input: flowerbed = [1,0,0,0,1], n = 1
 Output: true
 Example 2:

 Input: flowerbed = [1,0,0,0,1], n = 2
 Output: false
*/
    func canPlaceFlowers(flowerBed: [Int], n: Int) -> Bool {
        var flowerBed = flowerBed
        var count = 0
        for i in 0..<flowerBed.count {
            if flowerBed[i] == 0 {
                var prev = (i==0 || flowerBed[i-1] == 0) ? 0 : 1
                var next = (i == flowerBed.count-1 || flowerBed[i+1] == 0) ? 0 : 1
                if prev == 0 && next == 0 {
                    flowerBed[i] = 1
                    count += 1
                }
            }
        }
        return count >= n
    }
    
   // Given an m x n matrix mat, return an array of all the elements of the array in a diagonal order.
//Input: mat = [[1,2,3],[4,5,6],[7,8,9]]
//Output: [1,2,4,7,5,3,6,8,9]


    func diagonalMatrix(matrix:[[Int]]) -> [Int] {
        var value = 121
        let arra = Array(String(describing: 121).map{$0})
        if matrix.count == 0 {
            return [0]
        }
        //
        var m = matrix.count
        var n = matrix[0].count
        var r = 0 // Row
        var c = 0 // column
        var result = Array(repeating: 0, count: m*n)
        for i in 0..<result.count {
            result[i] = matrix[r][c]
            // Add row and colum for all diagonal items r+c would be same
            //Even
            if (r+c) % 2 == 0 {
                if c == n-1 {
                    r += 1
                } else if r == 0 {
                    c += 1
                } else {
                    r -= 1
                    c += 1
                }
            } else { // Odd
                if r == m-1 {
                    c += 1
                } else if c == 0 {
                    r += 1
                } else {
                    r += 1
                    c -= 1
                }
            }
        }
        return result
    }
    func romanToInt(s: String) -> Int {
        var result = 0
        var lastSymbol = Roman.I
        for character in s.reversed() {
            let symbol = String(character).toRoman
            if symbol.rawValue < lastSymbol.rawValue {
                result -= symbol.rawValue
            } else {
                result += symbol.rawValue
            }
            lastSymbol = symbol
        }
        return result
    }
    func isValidParanthesis(s: String) -> Bool {
        var dict = ["[":"]", "{":"}", "(":")"]
        var arr = Array(String(describing: s).map{String($0)})
        var i = 0
        while i < arr.count-2 {
            let val = arr[i]
            
            if dict[arr[i]] == arr[i+1] {
                i += 2
            } else {
                return false
            }
        }
        if arr.count == 2, dict[arr.first!] != arr.last! {
            return false
        }

        return true
    }
}

enum Roman: Int {
    case I = 1
    case V = 5
    case X = 10
    case L = 50
    case C = 100
    case D = 500
    case M = 1000
}
extension String {
    var toRoman: Roman {
        switch self {
        case "I":
            return .I
        case "V":
            return .V
        case "X":
            return .X
        case "L":
            return .L
        case "C":
            return .C
        case "D":
            return .D
        case "M":
            return .M
        default:
            return .I
        }
    }
}
