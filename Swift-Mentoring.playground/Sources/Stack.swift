//
//  Stack.swift
//  
//
//  Created by Sumit Kumar on 11/09/26.
//

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
    
    public var top: Element? {
        container.last
    }
    
    public var isEmpty: Bool {
        container.isEmpty
    }
    
    public var count: Int {
        container.count
    }
}

extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        self.init(container: elements)
    }
}
