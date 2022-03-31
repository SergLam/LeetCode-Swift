//
//  main.swift
//  Valid-Parentheses
//
//  Created by Serhii Liamtsev on 4/1/22.
//

import Foundation

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
            // If the brace is closing + stack have someting inside to compare + the top char in stack is identical opening char  - pop from stack.
            if charString == "(" || charString == "{" || charString == "[" {
                stack.append(char)
            } else if charString == ")" && !stack.isEmpty && lastStackChar == "(" {
                _ = stack.popLast()
            } else if charString == "}" && !stack.isEmpty && lastStackChar == "{" {
                _ = stack.popLast()
            } else if charString == "]" && !stack.isEmpty && lastStackChar == "[" {
                _ = stack.popLast()
            } else {
                // Oops! The given string is not valid, cause the order of parentheses is broken
                return false
            }
        }
        
        return stack.isEmpty
}

// print(isValidParentheses("()")) // true
print(isValidParentheses("([}}])")) // false
