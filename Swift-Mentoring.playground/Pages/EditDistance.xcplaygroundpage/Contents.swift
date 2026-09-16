//: [Previous](@previous)

import Foundation

private func min(_ a: Int, _ b: Int, _ c: Int) -> Int {
    min(min(a, b), c)
}

@MainActor
func editDistance(_ s1: [Character], _ s2: [Character], m: Int, n: Int) -> Int {
    // print("m = \(m), n = \(n)")
    
    if m == 0 { return n }
    if n == 0 { return m }
    
    if memo[m][n] != -1 {
        return memo[m][n]
    }
    
    // if the characters matches
    if s1[m-1] == s2[n-1] {
        memo[m][n] = editDistance(s1, s2, m: m-1, n: n-1)
        return memo[m][n]
    }
    
    memo[m][n] = 1 + min (
        editDistance(s1, s2, m: m-1, n: n),
        editDistance(s1, s2, m: m, n: n-1),
        editDistance(s1, s2, m: m-1, n: n-1)
    )
    
    return memo[m][n]
}

let s1 = Array("Sumit")
let s2 = Array("Kumar")
let m = s1.count
let n = s2.count

// memorization
var memo: [[Int]] = Array(repeating: Array(repeating: -1, count: n+1), count: m+1)

let distance = editDistance(s1, s2, m: m, n: n)
print(distance)

//: [Next](@next)
