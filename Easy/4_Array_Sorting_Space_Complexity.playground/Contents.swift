import UIKit
import PlaygroundSupport
import MobileCoreServices

PlaygroundPage.current.needsIndefiniteExecution = true

func report_memory() -> UInt64 {
    var taskInfo = mach_task_basic_info()
    var count = mach_msg_type_number_t(MemoryLayout<mach_task_basic_info>.size)/4
    let kerr: kern_return_t = withUnsafeMutablePointer(to: &taskInfo) {
        $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
            task_info(mach_task_self_, task_flavor_t(MACH_TASK_BASIC_INFO), $0, &count)
        }
    }
    return kerr == KERN_SUCCESS ? taskInfo.resident_size : 0
}

func printSortedNaive(_ array: [Int]) {
    let sorted = array.sorted()
    for element in sorted {
        autoreleasepool {
            print(element)
        }
    }
}

func printSortedOptimized(_ array: [Int]) {
    // 1
    guard !array.isEmpty else { return }
    // 2
    var currentCount = 0
    var minValue = Int.min
    // 3
    for value in array {
        if value == minValue {
            print(value)
            currentCount += 1
        }
    }
    while currentCount < array.count {
        // 4
        var currentValue = array.max()!
        for value in array {
            if value < currentValue && value > minValue {
                currentValue = value
            }
        }
        // 5
        for value in array {
            if value == currentValue {
                print(value)
                currentCount += 1
            }
        }
        // 6
        minValue = currentValue
    }
}

// Gather the initial information
let startNaiveMemory = report_memory()
print("Memory naive at start: \(startNaiveMemory / 1024 / 1024) mb")

let startNaive = CFAbsoluteTimeGetCurrent()
printSortedNaive(Array(0...10000))
let timeNaive = CFAbsoluteTimeGetCurrent() - startNaive
print("Naive sorting took \(timeNaive) seconds")

let endNaiveMemory = report_memory()
print("Memory naive at finish: \(Int(endNaiveMemory / 1024 / 1024)) mb")
let deltaNaive = (Int(Int(endNaiveMemory) - Int(startNaiveMemory)) / 1024 / 1024)
print("Memory naive delta: \(deltaNaive) mb")

let startOptimized = CFAbsoluteTimeGetCurrent()

let startOptimizedMemory = report_memory()
print("Memory Optimized at start: \(startOptimizedMemory / 1024 / 1024) mb")
printSortedOptimized(Array(0...10000))

let timeOptimized = CFAbsoluteTimeGetCurrent() - startOptimized
print("Optimized sorting took \(timeOptimized) seconds")

let endOptimizedMemory = report_memory()
print("Memory Optimized at finish: \(Int(endOptimizedMemory / 1024 / 1024)) mb")
let deltaOptimized = (Int(Int(endOptimizedMemory) - Int(startOptimizedMemory)) / 1024 / 1024)
print("Memory Optimized delta: \(deltaOptimized) mb")
