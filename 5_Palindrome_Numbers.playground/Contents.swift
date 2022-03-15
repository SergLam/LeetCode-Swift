import UIKit
import PlaygroundSupport
import MobileCoreServices

PlaygroundPage.current.needsIndefiniteExecution = false

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        if x >= 0 && x<=9 {
            return true
        }
        if x % 10 == 0 {
            return false
        } else {
            // Create an array to split a number by digits
            let digitsArray: [Int] = String(describing: x).compactMap { Int(String($0)) }
            return digitsArray.elementsEqual(digitsArray.reversed())
        }
    }
}

// print(Solution().isPalindrome(121))
// print(Solution().isPalindrome(0))
