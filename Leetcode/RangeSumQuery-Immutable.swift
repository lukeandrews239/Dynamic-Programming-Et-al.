// 303. Range Sum Query - Immutable (5 minutes or less—pretty fun)

//Success
//Details
//Runtime: 1936 ms, faster than 22.35% of Swift online submissions for Range Sum Query - Immutable.
//Memory Usage: 22.1 MB, less than 32.94% of Swift online submissions for Range Sum Query - Immutable.


//Given an integer array nums, find the sum of the elements between indices i and j (i ≤ j), inclusive.
//
//Example:
//
//Given nums = [-2, 0, 3, -5, 2, -1]
//
//sumRange(0, 2) -> 1
//sumRange(2, 5) -> -1
//sumRange(0, 5) -> -3
//
//
//Constraints:
//
//You may assume that the array does not change.
//There are many calls to sumRange function.
//0 <= nums.length <= 10^4
//-10^5 <= nums[i] <= 10^5
//0 <= i <= j < nums.length

import Foundation

class NumArray {
    
    private var nums: [Int]

    init(_ nums: [Int]) {
        
        self.nums = nums
        
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        if (i == j) {
            return nums[i]
        }
        
        var sum = 0
        var index = i
        while (index <= j) {
            sum = sum + nums[index]
            index = index + 1
        }
        
        return sum
    }
}
