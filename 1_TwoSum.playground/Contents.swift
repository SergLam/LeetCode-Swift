import UIKit
import PlaygroundSupport

class Solution {
    
    // MARK: - Brute force solution
    func twoSumForce(_ nums: [Int], _ target: Int) -> [Int] {
        
        for (index1, num1) in nums.enumerated() {
            for i in stride(from: index1 + 1,to: nums.count, by: 1) {
                if nums[i] == target - num1 {
                    return [i, index1]
                }
                
            }
        }
        return []
    }
    
    // MARK: - Two-pass Hash Table
    func twoSumTwoPassHashTable(_ nums: [Int], _ target: Int) -> [Int] {
        
        var hashMap: [Int: Int] = [:]
        for (index, num) in nums.enumerated() {
            hashMap[num] = index
        }
        
        for (index, num) in nums.enumerated() {
            let complement = target - num
            if let index2 = hashMap[complement], (hashMap.keys.contains(complement) && index2 != index) {
                return [index, index2]
            }
        }
        return []
    }
    
    // MARK: - One-pass Hash Table
    func oneSumTwoPassHashTable(_ nums: [Int], _ target: Int) -> [Int] {
        
        var hashMap: [Int: Int] = [:]
        for (index, num) in nums.enumerated() {
            let complement = target - num
            if hashMap.keys.contains(complement), let index2 = hashMap[complement] {
                return [index, index2]
            }
            hashMap[num] = index
        }
        
        return []
    }
    
    
}

PlaygroundPage.current.needsIndefiniteExecution = true

Solution().twoSumForce([3,2,4], 6)

Solution().twoSumTwoPassHashTable([3,2,4], 6)

Solution().oneSumTwoPassHashTable([3,2,4], 6)
