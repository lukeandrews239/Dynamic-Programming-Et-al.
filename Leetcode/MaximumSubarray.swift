
// Given an integer array nums, find the contiguous subarray (containing at least one number)
// which has the largest sum and return its sum.
//
// Example:
//
// Input: [-2,1,-3,4,-1,2,1,-5,4],
// Output: 6
// Explanation: [4,-1,2,1] has the largest sum = 6.
// Follow up:
//
// If you have figured out the O(n) solution, try coding another solution using
// the divide and conquer approach, which is more subtle.

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {

        if (nums.count <= 1) {
            return nums.first ?? Int.min
        }

        var retValue = nums[0]
        var tracker = Array<Int>(repeating: Int.min, count: nums.count)
        tracker[0] = retValue

        for each in 1 ..< nums.count {

            var current = nums[each]
            var proposed = current + tracker[each - 1]
            tracker[each] = max(proposed, current)

            if tracker[each] > retValue {
                retValue = tracker[each]
            }
        }
        return retValue
    }
}

// Success
// Details
// Runtime: 40 ms, faster than 64.93% of Swift online submissions for Maximum Subarray.
// Memory Usage: 21.2 MB, less than 16.67% of Swift online submissions for Maximum Subarray.