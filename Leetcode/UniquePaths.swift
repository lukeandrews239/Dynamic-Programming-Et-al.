//62. Unique Paths (Medium difficulty, about 30 minutes)
//Medium
//
//3810
//
//223
//
//Add to List
//
//Share
//A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
//
//The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
//
//How many possible unique paths are there?
//
//
//
//Example 1:
//
//
//Input: m = 3, n = 7
//Output: 28
//Example 2:
//
//Input: m = 3, n = 2
//Output: 3
//Explanation:
//From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
//1. Right -> Down -> Down
//2. Down -> Down -> Right
//3. Down -> Right -> Down
//Example 3:
//
//Input: m = 7, n = 3
//Output: 28
//Example 4:
//
//Input: m = 3, n = 3
//Output: 6
//
//
//Constraints:
//
//1 <= m, n <= 100
//It's guaranteed that the answer will be less than or equal to 2 * 109.

// RESULTS
//Success
//Details
//Runtime: 4 ms, faster than 90.38% of Swift online submissions for Unique Paths.
//Memory Usage: 20.4 MB, less than 92.31% of Swift online submissions for Unique Paths.
//Next challenges:
//Unique Paths II
//Minimum Path Sum
//Dungeon Game
//Show off your acceptance:

class Solution {
    
    
    
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        
        if (m <= 0 || n <= 0) {
            return 0
        } else if (m == 1 || n == 1) {
            return 1
        }
        
        // At any given step, there are 2 ways plus all previous ways, unless we are at the bottom or far right.
        var memoizer = [[Int]](repeating:[Int](repeating: 0, count: n + 1), count: m + 1)
        
        // Fill in base cases.
        for index in 1...m {
            memoizer[index][1] = 1
        }
        
        for index in 1...n {
            memoizer[1][index] = 1
        }
        
        for rowIndex in 2...m {
            for colIndex in 2...n {
                // Dynamic programming memoization recurrence
                memoizer[rowIndex][colIndex] = memoizer[rowIndex - 1][colIndex] + memoizer[rowIndex][colIndex - 1]
            }
        }
        
        return memoizer[m][n]
    }
    
    
}

// Testcase: 3
//           7


// Output  : 28
