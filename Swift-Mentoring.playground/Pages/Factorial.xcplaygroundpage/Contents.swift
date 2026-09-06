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

factorial(21)

/*
 Let's take an example of Multiplication for numbers 123 and 10
    1 2 3
  x   1 0
 ---------
    0 0 0
  1 2 3 x
 ---------
  1 2 3 0
 ---------
 */

// We can not use `Int` as that will casue arithmatic overflow for number >= 21, can we use String?

enum MultiplicationError: Error {
    case invalidInput
}

extension String {
    func multiply(with other: String) throws -> String {
        guard count >= 1, other.count >= 1 else { throw MultiplicationError.invalidInput }
        
        let multiplicant = reversedDigits(for: self)
        let multiplier = reversedDigits(for: other)
        
        var multiplication: [[Int]] = []
        var carry = 0
        var iteration = 0
        
        for digit1 in multiplier {
            var subProduct: [Int] = Array(repeating: 0, count: iteration)
            carry = 0
            
            for digit2 in multiplicant {
                let m = digit1 * digit2 + carry
                let onesDigit = m % 10
                carry = m / 10
                
                subProduct.append(onesDigit)
            }
            
            if carry > 0 {
                subProduct.append(carry)
            }
            
            multiplication.append(subProduct)
            
            iteration += 1
        }
        
        var result: [Int] = []
        carry = 0
        
        let maxSubProductSize = multiplication.map { $0.count }.max() ?? 0
        for index in 0 ..< maxSubProductSize {
            var sum = carry
            for subProduct in multiplication {
                if index < subProduct.count {
                    sum += subProduct[index]
                }
            }
            
            let onesDigit = sum % 10
            carry = sum / 10
            result.append(onesDigit)
        }
        
        if carry > 0 {
            result.append(carry)
        }
        
        return result.reversed().compactMap { String($0) }.joined()
    }
    
    private func digits(for number: String) -> [Int] {
        number.compactMap { Int("\($0)") }
    }
    
    private func reversedDigits(for number: String) -> [Int] {
        digits(for: number).reversed()
    }
}

// try "123".multiply(with: "11")

func factorialUpdated(_ number: Int) throws -> String {
    if number <= 20 {
        return factorial(number).description
    }
    
    var result = factorial(20).description
    for currentNumber in 21 ... number {
        result = try result.multiply(with: currentNumber.description)
    }
    
    return result
}

try factorialUpdated(50)




//: [Next](@next)
