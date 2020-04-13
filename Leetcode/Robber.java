
//        198. House Robber
//        Easy
//
//        You are a professional robber planning to rob houses along a street.
//        Each house has a certain amount of money stashed, the only constraint stopping you
//        from robbing each of them is that adjacent houses have security system connected and
//        it will automatically contact the police if two adjacent houses were broken into on
//        the same night.
//
//        Given a list of non-negative integers representing the amount of money of each house,
//        determine the maximum amount of money you can rob tonight without alerting the police.
//
//        Example 1:
//
//        Input: [1,2,3,1]
//        Output: 4
//        Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
//        Total amount you can rob = 1 + 3 = 4.
//        Example 2:
//
//        Input: [2,7,9,3,1]
//        Output: 12
//        Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
//        Total amount you can rob = 2 + 9 + 1 = 12.

class Solution {
  public int rob(int[] nums) {
    int len = nums.length;
    if (len == 0) {
      return 0;
    } else if (len == 1) {
      return nums[0];
    } else if (len == 2) {
      return nums[0] > nums[1] ? nums[0] : nums[1];
    }
    int[] tracker = new int[len + 1];
    tracker[0] = 0;
    tracker[1] = nums[0];
    for (int i = 2; i <= len; i++) {
      tracker[i] = Math.max(tracker[i - 2] + nums[i - 1], tracker[i - 1]);
    }

    return tracker[len];
  }
}

//        Success
//        Details
//        Runtime: 0 ms, faster than 100.00% of Java online submissions for House Robber.
//        Memory Usage: 37 MB, less than 5.26% of Java online submissions for House Robber.