import Foundation

public struct QueueCircularArray<T>: Queue {
    
    private var data: [T?] = []
    private var front = -1
    private var rear = -1
    
    public init() {}
    
    mutating public func enqueue(_ element: T) {
        
    }
    
    mutating public func dequeue() -> T? {
        return nil
    }
    
    public var isEmpty: Bool {
        front == rear
    }
    
    public var peek: T? {
        data[front]
    }
}

extension QueueCircularArray: CustomStringConvertible {
    public var description: String {
        String(describing: data)
    }
}
