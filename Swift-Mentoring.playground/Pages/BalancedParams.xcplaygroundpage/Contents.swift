//: [Previous](@previous)

import Foundation

func isBalanced(_ string: String) -> Bool {
    var stack: Stack<Character> = []
    
    let braces: [(Character, Character)] = [("{", "}"), ("(", ")"), ("[", "]")]
    let openBraces: Set<Character> = Set(braces.map { $0.0 })
    let matchingOpeningBrace: [Character: Character] = Dictionary(uniqueKeysWithValues: braces.map { ($0.1, $0.0) })
    
    for character in string {
        // if open brace then put on the stack
        if openBraces.contains(character) {
            stack.push(character)
        }
        else {
            if let openingBrace = matchingOpeningBrace[character] {
                guard let topElement = stack.pop(), openingBrace == topElement else {
                    return false
                }
            }
        }
    }

    return stack.isEmpty
}

isBalanced("[a + { c * (d + b) } ]")
isBalanced("[(({)})")

//: [Next](@next)
