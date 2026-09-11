//: [Previous](@previous)

import Foundation

// Stack
// A Data structure where elements gets added
// on top and always gets removed from the top.

// Example: Stack of plates in the kitchen.

public struct Stack<Element> {
    private var container: [Element]
    
    init(container: [Element] = []) {
        self.container = container
    }
    
    public mutating func push(_ element: Element) {
        container.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        container.popLast()
    }
    
    var top: Element? {
        container.last
    }
    
    var isEmpty: Bool {
        container.isEmpty
    }
    
    var count: Int {
        container.count
    }
}

extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        self.init(container: elements)
    }
}

var stack: Stack = [1, 2, 3]
stack.top
stack.count
stack.pop()
stack.count

//: [Next](@next)
