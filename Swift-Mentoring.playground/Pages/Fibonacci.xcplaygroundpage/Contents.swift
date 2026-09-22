//: [Previous](@previous)

import Foundation

// Overlapping Sub-problems

func fib(_ n: Int) -> Int {
    if n == 0 { return 0 }
    if n == 1 { return 1 }
    
    return fib(n-1) + fib(n-2)
}

func fibo(_ n: Int) -> Int {
    var array = Array(repeating: 0, count: n+1)
    array[0] = 0
    array[1] = 1
    
    for index in 2...n {
        array[index] = array[index-1] + array[index-2]
    }
    
    return array[n]
}

func fibo1(_ n: Int) -> Int {
    if n == 0 { return 0 }
    if n == 1 { return 1 }
    
    var a = 0
    var b = 1
    var c = a + b
    
    for index in 2...n {
        c = a + b
        a = b
        b = c
    }
    
    return c
}

let n = 25

/* Helper to measue the time for a fucntion call */
var clock = ContinuousClock()

@MainActor
func measure(_ closure: @Sendable (Int) -> Int) {
    let time = clock.measure {
        _ = closure(n)
    }
    
    print("Time Taken: \(time)")
}

measure { _ in fib(n) }
measure { _ in fibo(n) }
measure { _ in fibo1(n) }

//: [Next](@next)
