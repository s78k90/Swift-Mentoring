//: [Previous](@previous)

import Foundation

// Reverse array in place, without creating a new array.
// Create the Mirror image for the Array.
func reverse<T>(input: inout [T]) {
    var left = 0
    var right = input.count - 1
    
    while left < right {
        // swap elements at left and right
        (input[left], input[right]) = (input[right], input[left])
        left += 1
        right -= 1
    }
}

var array = [1, 2, 3, 4]
reverse(input: &array)
print(array)

let greeting = "Hello, playground"
var newArray = Array(greeting)
reverse(input: &newArray)
print(newArray.map { String($0) }.joined())

// Problem 2:
// Sum of all previous + current element(s) in the Array.
// Using recursion.
func sum(for array: inout [Int], index: Int = 0, total: Int = 0) {
    guard !array.isEmpty else { return }
    if index < 0 || index >= array.count { return }
    
    array[index] += total
    sum(for: &array, index: index+1, total: array[index])
}

var elements = [1, 12, -3, 4, 21, -42, 78, -4, 89]
sum(for: &elements)
print(elements)

//: [Next](@next)
