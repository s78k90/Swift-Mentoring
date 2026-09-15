//: [Previous](@previous)

import Foundation

private func min(_ a: Int, _ b: Int, _ c: Int) -> Int {
    min(min(a, b), c)
}

func editDistance(_ s1: [Character], _ s2: [Character], m: Int, n: Int) -> Int {
    print("m = \(m), n = \(n)")
    
    if m == 0 { return n }
    if n == 0 { return m }
    
    // if the characters matches
    if s1[m-1] == s2[n-1] {
        return editDistance(s1, s2, m: m-1, n: n-1)
    }
    
    return 1 + min (
        editDistance(s1, s2, m: m-1, n: n),
        editDistance(s1, s2, m: m, n: n-1),
        editDistance(s1, s2, m: m-1, n: n-1)
    )
}

let s1 = Array("Sumit")
let s2 = Array("Kumar")
let distance = editDistance(s1, s2, m: s1.count, n: s2.count)
print(distance)

//: [Next](@next)
