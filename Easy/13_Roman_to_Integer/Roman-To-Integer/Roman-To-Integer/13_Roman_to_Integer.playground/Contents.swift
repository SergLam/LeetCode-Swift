import UIKit
import PlaygroundSupport
import MobileCoreServices

PlaygroundPage.current.needsIndefiniteExecution = true

class Solution {
    func romanToInt(_ s: String) -> Int {
        // Use hashmap for key-value mapping + memory optimization
        let values: [String: Int] = [
            "I":1, "V":5, "X": 10, "L":50, "C":100, "D": 500, "M": 1000
        ]
        let characters: [String] = s.components(separatedBy: "")
        print(characters)
        
        var result: Int = 0
        for (index, char) in characters.enumerated() {
            // We need to check first whether we are substracting or adding the value
            if index + 1 < characters.count {
                // If the next digint is less - then substract
                if values[characters[index]]! < values[characters[index + 1]]! {
                    result -= values[characters[index]]!
                    print("Substration \(result)")
                    // If the next digint is greater - then add
                } else {
                    result += values[characters[index]]!
                    print("Summ \(result)")
                }
            }
        }
        print("Result \(result)")
        return result
    }
}

print(Solution().romanToInt("III")) // 3
print(Solution().romanToInt("LVIII")) // 58
print(Solution().romanToInt("MCMXCIV")) // 1994

// print(Solution().isPalindrome(0))
