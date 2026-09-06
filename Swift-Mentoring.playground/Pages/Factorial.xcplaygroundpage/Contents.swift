//: [Previous](@previous)

import Foundation

// N! = 1 * 2 * 3 * 4 ... * N
func factorial(_ number: Int) -> Int {
    // Base condition
    if number < 0 {
        return 0
    }
    
    if number == 0 || number == 1 {
        return 1
    }
    
    // Reduce the problem
    return number * factorial(number-1)
}

factorial(20)














//: [Next](@next)
