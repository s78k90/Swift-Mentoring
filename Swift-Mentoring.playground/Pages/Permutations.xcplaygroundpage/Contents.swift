import UIKit

// Recursion

// 2 Conditions
// Base condition
// Reduce the size of the problem

// String -> permutations

extension String {
    func permutations() -> [String] {
        // Base case
        guard count > 1 else { return [self] }
        
        let array = Array(self)
        var results: [String] = []
        
        // Reduce the size of the problem
        for index in 0 ..< array.count {
            let letter = array[index]
            
            let remainingString = String(array[0 ..< index]) + String(array[index + 1 ..< array.count])
            let permutation = remainingString.permutations()
            
            for p in permutation {
                results.append("\(letter)" + p)
            }
        }
        
        return results
    }
}

"ab".permutations()
"abcd".permutations()

