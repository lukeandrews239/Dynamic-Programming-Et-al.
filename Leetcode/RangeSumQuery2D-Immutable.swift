// 304. Range Sum Query 2D - Immutable (About 45 minutes: solution in 15, painful edge case/bad value handling for remaining 30)

//Given a 2D matrix matrix, find the sum of the elements inside the rectangle defined by its upper left corner (row1, col1) and lower right corner (row2, col2).
//
//Range Sum Query 2D
//The above rectangle (with the red border) is defined by (row1, col1) = (2, 1) and (row2, col2) = (4, 3), which contains sum = 8.
//
//Example:
//Given matrix = [
//  [3, 0, 1, 4, 2],
//  [5, 6, 3, 2, 1],
//  [1, 2, 0, 1, 5],
//  [4, 1, 0, 1, 7],
//  [1, 0, 3, 0, 5]
//]
//
//sumRegion(2, 1, 4, 3) -> 8
//sumRegion(1, 1, 2, 2) -> 11
//sumRegion(1, 2, 2, 4) -> 12
//Note:
//You may assume that the matrix does not change.
//There are many calls to sumRegion function.
//You may assume that row1 ≤ row2 and col1 ≤ col2.


//Success
//Details
//Runtime: 636 ms, faster than 30.36% of Swift online submissions for Range Sum Query 2D - Immutable.
//Memory Usage: 21.8 MB, less than 80.36% of Swift online submissions for Range Sum Query 2D - Immutable.


class NumMatrix {
    
    private var matrix: [[Int]]

    init(_ matrix: [[Int]]) {
        
        self.matrix = matrix
        
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        
        // Can't compute portions of the matrix with nil values
        if (row1 == nil || row2 == nil || col1 == nil || col2 == nil || self.matrix == nil) {
            return 0
        }
        
        // Negative values should pick up at 0
        var newRow1 = row1 < 0 ? 0 : row1
        var newRow2 = row2 < 0 ? 0 : row2
        var newCol1 = col1 < 0 ? 0 : col1
        var newCol2 = col2 < 0 ? 0 : col2
        
        // Super ugly guard logic, but it's late and I'm tired.
        if (newRow1 > self.matrix.count - 1) {
            return 0
        } else if (newRow1 == newRow2 && newCol1 == newCol2) {
            if (newRow1 <= self.matrix.count - 1) {
                if (newCol1 <= self.matrix[newRow1].count - 1) {
                    return self.matrix[newRow1][newCol1]
                }
            }
            return 0
        }
        
        var accumulator = 0
        var index = newRow1
        var endIndex = newRow2 <= (self.matrix.count - 1) ? newRow2 : (self.matrix.count - 1)
        while (index <= endIndex) {
            var relevantRow = self.matrix[index]
            // If the column begins after the final index of this row, pass.
            if !(newCol1 > relevantRow.count - 1) {
                accumulator = accumulator + self.sumRowProportionally(relevantRow, newCol1, newCol2)
            }
            index = index + 1
        }
        
        return accumulator
    }
    
    // Where row is row1, start is col1, end is col2. This needs to execute for (row2-row1) times.
    func sumRowProportionally(_ row: [Int], _ start: Int, _ end: Int) -> Int {
        
        if (row == nil || row as? [Int] == nil || start > row.count - 1) {
            return 0
        } else if (start == end) {
            return row[start]
        }
        
        var rowSum = 0
        var index = start
        var endIndex = end <= (row.count - 1) ? end : (row.count - 1)
        while (index <= endIndex) {
            // Leetcode loves to throw random things at you at the medium level.
            let num: Int = row[index] as? Int ?? 0
            rowSum = rowSum + num
            index = index + 1
        }
        
        return rowSum
    }
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */

// Leetcode test case:

// ["NumMatrix","sumRegion","sumRegion","sumRegion"]
// [[[[3,0,1,4,2],[5,6,3,2,1],[1,2,0,1,5],[4,1,0,1,7],[1,0,3,0,5]]],[2,1,4,3],[1,1,2,2],[1,2,2,4]]

// Expected output
// [null,8,11,12]
