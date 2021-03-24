//: [Previous](@previous)

import Foundation

example(of: "Queue with array") {
    var queue = QueueWithArray<Int>()
    (1...6).forEach { queue.enqueue($0) }
    print(queue)
    
    queue.dequeue()
    queue.dequeue()
    print(queue)
}

example(of: "Queue with Doubly Linked list") {
    var queue = QueueDoublyLinkedList<Int>()
    (1...6).forEach { queue.enqueue($0) }
    print(queue)
}

example(of: "Queue with circular array") {
    
}

example(of: "Queue with double stack") {
    
}
//: [Next](@next)
