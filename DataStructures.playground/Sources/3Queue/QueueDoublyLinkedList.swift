import Foundation

public struct QueueDoublyLinkedList<T: Equatable>: Queue {
    
    private var data = DoublyLinkedList<T>()
    
    public init() {}
    
    mutating public func enqueue(_ element: T) {
        data.append(element)
    }
    
    @discardableResult
    mutating public func dequeue() -> T? {
//        guard !data.isEmpty else { return nil }
//        return data.remove(data.first)
        return nil
    }
    
    public var isEmpty: Bool {
        data.isEmpty
    }
    
    public var peek: T? {
        data.first?.value
    }
}

extension QueueDoublyLinkedList: CustomStringConvertible {
    public var description: String {
        String(describing: data)
    }
}
