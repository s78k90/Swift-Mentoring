//: [Previous](@previous)

import Foundation

// Exercise for Palindrome

extension Array where Element: Equatable {
    func isPalindrome() -> Bool {
        // Compare as arrays: reversed() returns a ReversedCollection, so
        // convert it back to Array before comparing.
        self == self.reversed()
    }
}

extension String {
    func isPalindrome() -> Bool {
        // Normalize: lowercase and keep only letters and numbers, so that
        // phrases with spaces/punctuation are handled correctly.
        let cleaned = self.lowercased().filter { $0.isLetter || $0.isNumber }
        return Array(cleaned).isPalindrome()
    }
}

[1, 2, 3, 4, 5, 4, 3, 2, 1].isPalindrome()
"22022022".isPalindrome()
"Step on no pets".isPalindrome()
"Not a palindrome".isPalindrome()

//: [Next](@next)
