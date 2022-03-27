import UIKit
import PlaygroundSupport
import MobileCoreServices

PlaygroundPage.current.needsIndefiniteExecution = false

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        let strsChars: [[Character]] = strs.map{ Array($0) }
        let smallestCharArrCount: Int = strsChars.map{ $0.count }.min() ?? 0
        
        let smallestCharArray: [Character] = strsChars.first(where: { $0.count == smallestCharArrCount}) ?? []
        
        var resultPrefix: [Character] = []
            
        for strsIndex in 0..<strsChars.count {
                
            var charByIndex: [Character] = []
            
            for index in 0..<smallestCharArray.count {
                charByIndex.append(strsChars[strsIndex][index])
            }
            
            let charByUnique: Set<Character> = Set(charByIndex)
            if charByUnique.count == 1 {
                resultPrefix.append(contentsOf: Array(charByUnique))
                continue
            } else {
                break
            }
        }
        return String(resultPrefix)
    }
}

let solution = Solution()

print(solution.longestCommonPrefix(["flower","flow","flight"]))
//print(solution.longestCommonPrefix())
