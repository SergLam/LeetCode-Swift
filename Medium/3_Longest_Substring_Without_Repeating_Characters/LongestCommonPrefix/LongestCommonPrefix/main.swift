//
//  main.swift
//  LongestCommonPrefix
//
//  Created by Serhii Liamtsev on 3/27/22.
//

import Foundation

class Solution {
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        var longestPrefix: String = ""
        if strs.isEmpty || strs.allSatisfy({ $0.isEmpty }) {
            return ""
        }
        
        let charArrays: [[Character]] = strs.map{ Array($0) }
        
        var charIndex: Int = 0
        
        // Pick up first string, we don't care about the shortest string
        // Cause we can simply check, if we have not exceed the characters range
        
        for character in charArrays[0] {
            
            // Iterate over given strigns
            for charArray in charArrays {
                
                // Check 2 conditions:
                // 1. Prevent "Index out of bounds" crash
                // 2. Compare the the character from current array with the
                // character from the first array.
                
                if charIndex >= charArray.count || charArray[charIndex] != character {
                    
                    // If we have go out of index or characters is not equal - return the result
                    return longestPrefix
                }
            }
            
            // Otherwise, append the character to result string.
            longestPrefix.append(contentsOf: String(character))
            // Increment array index.
            charIndex += 1
        }
        return longestPrefix
    }
}

let solution = Solution()

print("Result")
print(solution.longestCommonPrefix(["flower","flow","flight"]))
//print(solution.longestCommonPrefix())
