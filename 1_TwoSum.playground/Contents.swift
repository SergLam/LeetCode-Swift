import UIKit
import PlaygroundSupport

class Solution {
    
    // MARK: - Brute force solution
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        for (index1, num1) in nums.enumerated() {
            for i in stride(from: index1 + 1,to: nums.count, by: 1) {
                if nums[i] == target - num1 {
                    return [i, index1]
                }
                
            }
        }
        return []
    }
    
}

PlaygroundPage.current.needsIndefiniteExecution = true

Solution().twoSum([3,2,4], 6)
