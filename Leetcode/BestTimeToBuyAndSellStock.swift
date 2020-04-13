// 121. Best Time to Buy and Sell Stock
// Easy
//
// 4341
//
// 196
//
// Add to List
//
// Share
// Say you have an array for which the ith element is the price of a given stock on day i.
//
// If you were only permitted to complete at most one transaction
// (i.e., buy one and sell one share of the stock), design an algorithm to find the maximum profit.
//
// Note that you cannot sell a stock before you buy one.
//
// Example 1:
//
// Input: [7,1,5,3,6,4]
// Output: 5
// Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
//              Not 7-1 = 6, as selling price needs to be larger than buying price.
// Example 2:
//
// Input: [7,6,4,3,1]
// Output: 0
// Explanation: In this case, no transaction is done, i.e. max profit = 0.
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if (prices.count <= 1) {
            return 0
        }

        var profit = Int.min
        var curLow = prices[0]
        var tracker = Array<Int>(repeating: Int.max, count: prices.count)
        tracker[0] = prices[0]
        for each in 1..<prices.count {
            var proposedProfit = prices[each] - curLow
            tracker[each] = proposedProfit >= 0 ? proposedProfit : 0
            if tracker[each] > profit {
                profit = tracker[each]
            }
            curLow = prices[each] < curLow ?  prices[each] : curLow
        }
        return profit
    }
}
// Success
// Details
// Runtime: 36 ms, faster than 87.93% of Swift online submissions
// for Best Time to Buy and Sell Stock.
// Memory Usage: 21.4 MB, less than 16.67% of Swift online submissions
// for Best Time to Buy and Sell Stock.