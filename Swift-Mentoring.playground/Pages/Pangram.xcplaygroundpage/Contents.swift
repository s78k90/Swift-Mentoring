//: [Previous](@previous)

import Foundation

// Pangram (English) - a string containing every letter (case-insensitive) of the alphabet at least once.
// Example: The quick brown fox jumps over the lazy dog.

extension String {
    func isPangram() -> Bool {
        guard count >= 26 else { return false }
        
        let text = self.lowercased().filter { $0.isLetter }
        
        // Dictionary (key, value)
//        var dictionary: [Character: Bool] = [:]
//        for character in text {
//            dictionary[character] = true
//        }
//        
//        return dictionary.keys.count == 26
        
        // Array
//        var array = Array(repeating: false, count: 26)
//        for character in text {
//            let index = Int((character.asciiValue ?? 0) - (Character("a").asciiValue ?? 0))
//            array[index] = true
//        }
//        
//        return array.allSatisfy { $0 == true }
        
        // Set
        return Set(text).count == 26
    }
}

"The quick brown fox jumps over the lazy dog.".isPangram()

//: [Next](@next)
