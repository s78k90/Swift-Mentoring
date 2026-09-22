//: [Previous](@previous)

import Foundation

struct Queue<T> {
    private var store:[T?]
    private var front = 0
    private var rear = 0
    private var capacity: Int
    private var size = 0
    
    init(capacity: Int) {
        self.capacity = capacity
        self.store = Array(repeating: nil, count: capacity)
    }

    var isFull: Bool {
        size == capacity
    }
    
    var isEmpty: Bool {
        size == 0
    }
    
    mutating func enqueue(_ element: T) -> Bool {
        if isFull {
            print("Queue is already full for element: \(element)")
            return false
        }
        
        store[rear] = element
        rear = (rear + 1) % capacity
        size += 1
        return true
    }
    
    mutating func dequeue() -> T? {
        if isEmpty {
            print("Queue is empty...")
            return nil
        }
        
        let element = store[front]
        front = (front + 1) % capacity
        size -= 1
        return element
    }
    
}

var queue = Queue<Int>(capacity: 4)
for element in (1...5) {
    queue.enqueue(element)
}

(1...10).forEach { _ in
    if let element = queue.dequeue() {
        print(element)
    }
}


//: [Next](@next)
