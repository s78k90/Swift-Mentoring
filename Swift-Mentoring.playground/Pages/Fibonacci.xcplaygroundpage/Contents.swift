//: [Previous](@previous)

import Foundation

// Overlapping Sub-problems

func fib(_ n: Int) -> Int {
    if n == 1 || n == 2 {
        return 1
    }
    
    return fib(n-1) + fib(n-2)
}

fib(25)

//: [Next](@next)
