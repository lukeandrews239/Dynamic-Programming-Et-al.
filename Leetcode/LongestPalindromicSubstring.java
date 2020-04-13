
//        5. Longest Palindromic Substring
//        Medium
//
//        Given a string s, find the longest palindromic substring in s.
//        You may assume that the maximum length of s is 1000.
//
//        Example 1:
//
//        Input: "babad"
//        Output: "bab"
//        Note: "aba" is also a valid answer.
//        Example 2:
//
//        Input: "cbbd"
//        Output: "bb"


class Solution {
  public String longestPalindrome(String s) {
    if (s.length() == 0) return "";
    int stringLength = s.length();
    int retBeginIndex = 0;
    int retEndIndex = 0;
    int longestYet = 1;
    boolean[][] table = new boolean[stringLength][stringLength];
    for (int i = 0; i < stringLength; i++) {
      table[i][i] = true;
    }
    for (int i = 0; i < stringLength - 1; i++) {
      int j = i + 1;
      if (s.charAt(i) == s.charAt(j)) {
        table[i][j] = true;
        retBeginIndex = i;
        retEndIndex = j;
        longestYet = 2;
      } else {
        table[i][j] = false;
      }
    }
    for (int lengthToExamine = 3; lengthToExamine <= stringLength; lengthToExamine++) {
      int j = lengthToExamine - 1;
      for (int i = 0; i <= stringLength - lengthToExamine; i++) {
        if (s.charAt(i) == s.charAt(j) && table[i + 1][j - 1]) {
          table[i][j] = true;
          if (lengthToExamine >= longestYet) {
            longestYet = lengthToExamine;
            retBeginIndex = i;
            retEndIndex = j;
          }
        } else {
          table[i][j] = false;
        }
        j++;
      }
    }
    return s.substring(retBeginIndex, retEndIndex + 1);
  }
}

//        Success
//        Details
//        Runtime: 116 ms, faster than 21.73% of Java online submissions for
//        Longest Palindromic Substring.
//        Memory Usage: 42 MB, less than 6.86% of Java online submissions for
//        Longest Palindromic Substring.