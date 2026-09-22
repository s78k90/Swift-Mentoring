//: [Previous](@previous)

import Foundation

struct QueueFromArray<T> {
    private var store: [T]
    
    init(store: [T] = []) {
        self.store = store
    }
    
    mutating func enqueue(_ elememt: T) {
        store.append(elememt)
    }
    
    mutating func dequeue() -> T? {
        store.removeFirst()
    }
    
    var isEmpty: Bool {
        store.isEmpty
    }
    
    var size: Int {
        store.count
    }
}

var queue = QueueFromArray(store: [1, 2, 3])
queue.enqueue(4)
queue.enqueue(100)

while !queue.isEmpty {
    if let element = queue.dequeue() {
        print(element)
    }
}

//: [Next](@next)
