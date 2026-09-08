//: [Previous](@previous)

import Foundation

func hanoi(disk: Int, source: Character, auxilary: Character, destination: Character) {
    // base condition
    guard disk > 0 else {
        return
    }
    
    // reduce the probelm
    hanoi(disk: disk-1, source: source, auxilary: destination, destination: auxilary)
    print("Moving disk \(disk) from \(source) to \(destination)")
    hanoi(disk: disk-1, source: auxilary, auxilary: source, destination: destination)
}

hanoi(disk: 1, source: "A", auxilary: "B", destination: "C")

//: [Next](@next)
