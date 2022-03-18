import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

func sumFromOneNaive(upto n: Int) -> Int {
    var result = 0
    for i in 1...n {
        result += i
    }
    return result
}

func sumFromOneInline(upto n: Int) -> Int {
  return (1...n).reduce(0, +)
}


func sumFromOneGaussRule(upto n: Int) -> Int {
    return (n + 1) * n / 2
}

let startNaive = CFAbsoluteTimeGetCurrent()
sumFromOneNaive(upto: 10000)
let timeNaive = CFAbsoluteTimeGetCurrent() - startNaive
print("Naive sum took \(timeNaive) seconds")

let startInline = CFAbsoluteTimeGetCurrent()
sumFromOneInline(upto: 10000)
let timeInline = CFAbsoluteTimeGetCurrent() - startInline
print("Inline sum took \(timeInline) seconds")

let startGauss = CFAbsoluteTimeGetCurrent()
sumFromOneGaussRule(upto: 10000)
let timeGauss = CFAbsoluteTimeGetCurrent() - startGauss
print("GaussRule sum took \(timeGauss) seconds")
