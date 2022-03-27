import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// https://www.youtube.com/watch?v=wiGpQwVHdE0
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        // Sliding window approach.
        // Set for non-unique characters checking
        var charSet: Set<String> = Set()
        
        // Pointer to the beginning of sliding window index
        var leftIndex = 0
        
        var result = 0
        
        for (index, character) in s.enumerated() {
            while charSet.contains(String(character)) {
                let leftPointerCharacter = s[s.index(s.startIndex, offsetBy: leftIndex)]
                charSet.remove(String(leftPointerCharacter))
                leftIndex += 1
            }
            let currentChar = s[s.index(s.startIndex, offsetBy: index)]
            charSet.insert(String(currentChar))
            result = max(result, index - leftIndex + 1)
        }
        return result
    }
}

// Input: s = "abcabcbb"
// Output: 3
// Explanation: The answer is "abc", with the length of 3.
//
// Input: s = "bbbbb"
// Output: 1
// Explanation: The answer is "b", with the length of 1.
//
// Input: s = "pwwkew"
// Output: 3
// Explanation: The answer is "wke", with the length of 3.
// Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.

let solution = Solution()

print(solution.lengthOfLongestSubstring("abcabcbb")) // 3
print(solution.lengthOfLongestSubstring("bbbbb")) // 1
print(solution.lengthOfLongestSubstring("pwwkew")) // 3
