//
//  main.swift
//  LongestSubstringWithoutRepeatingCharacters
//
//  Created by Serhii Liamtsev on 3/27/22.
//

import Foundation

// https://www.youtube.com/watch?v=wiGpQwVHdE0
// https://www.youtube.com/watch?v=hg2cTWPvPwE
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        if s.isEmpty {
            return 0
        }
        
        // Sliding window approach.
        // Set for non-unique characters checking
        var charSet: Set<Character> = Set()
        
        // Pointer to the beginning of sliding window index
        var leftIndex: Int = 0
        var result: Int = 0
        
        let charArray: Array<Character> = Array(s)
        for (index, character) in charArray.enumerated() {
            while charSet.contains(character) {
                let leftPointerCharacter = charArray[leftIndex]
                charSet.remove(leftPointerCharacter)
                leftIndex += 1
            }
            let currentChar = charArray[index]
            charSet.insert(currentChar)
            result = max(result, index - leftIndex + 1)
        }
        return result
    }
    
    func lengthOfLongestSubstringOptimized(_ s: String) -> Int {
        
        if s.isEmpty {
            return 0
        }
        // Optimized sliding window approach.
        
        var maxLength: Int = 0
        var charDict: [Character: Int] = [:]
        // try to extend the range [altIndex, index]
        let charArray: Array<Character> = Array(s)
        
        var lastDuplicateIndex: Int = 0
        for index in 0..<charArray.count {
            
            let character: Character = charArray[index]
            let characterIndex: Int? = charDict[character]
            if (characterIndex != nil) {
                lastDuplicateIndex = max(charDict[character]!, lastDuplicateIndex)
            }
            maxLength = max(maxLength, index - lastDuplicateIndex + 1)
            charDict[character] = index + 1
            print(charDict)
        }
        return maxLength
    }
}

let solution = Solution()

//print(solution.lengthOfLongestSubstring("abcabcbb")) // 3
//print(solution.lengthOfLongestSubstring("bbbbb")) // 1
//print(solution.lengthOfLongestSubstring("pwwkew")) // 3

let start = CFAbsoluteTimeGetCurrent()

// print(solution.lengthOfLongestSubstring(TestData.longString))
// print(solution.lengthOfLongestSubstringOptimized(TestData.longString))
print(solution.lengthOfLongestSubstringOptimized("abcabcbb"))

let diff = CFAbsoluteTimeGetCurrent() - start
print("Took \(diff) seconds")
