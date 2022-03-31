import UIKit
import PlaygroundSupport
import MobileCoreServices

PlaygroundPage.current.needsIndefiniteExecution = false

class Solution {
    func isValidParentheses(_ s: String) -> Bool {
            
            // If the given string char count is not odd - string is not valid
            if s.count % 2 != 0 {
                return false
            }
            
            // This time we are going to use array as a "Stack" data structure.
            // So the only allowed operations - is "append" and "popLast"
            var stack: [Character] = []
            
            // Swift is sucks when working with characters!
            let characters: [Character] = s.map{ $0 }
            
            for char in characters {
                
                // Dirty hack to simplify string comparison
                let charString = String(char)
                let lastStackChar = String(stack.last ?? Character("@"))
                
                // If the brace is opening - push to stack
                // If the brace is closing - pop from stack
                if charString == "(" || charString == "{" || charString == "[" {
                    stack.append(char)
                } else if charString == ")" && !stack.isEmpty && lastStackChar == "(" {
                    stack.popLast()
                } else if charString == "}" && !stack.isEmpty && lastStackChar == "{" {
                    stack.popLast()
                } else if charString == "]" && !stack.isEmpty && lastStackChar == "[" {
                    stack.popLast()
                }
            }
            
            return stack.isEmpty
        }
}

let solution = Solution()

print(solution.isValidParentheses("()")) // true
print(solution.isValidParentheses("([}}])")) // false
//print(solution.longestCommonPrefix())
