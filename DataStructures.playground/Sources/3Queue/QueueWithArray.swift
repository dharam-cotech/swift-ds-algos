import Foundation

public struct QueueWithArray<T>: Queue {
    
    private var data: [T] = []
    
    public init() {}
    
    mutating public func enqueue(_ element: T) {
        data.append(element)
    }
    
    @discardableResult
    mutating public func dequeue() -> T? {
        isEmpty ? nil : data.removeFirst()
    }
    
    public var isEmpty: Bool {
        data.isEmpty
    }
    
    public var peek: T? {
        data.first
    }
}

extension QueueWithArray: CustomStringConvertible {
    public var description: String {
        String(describing: data)
    }
}

extension QueueWithArray {
    public mutating func reversed() {
        var stack = Stack<T>()
        while !isEmpty {
            if let value = dequeue() {
                stack.push(element: value)
            }
        }
        
        while !stack.isEmpty {
            if let value = stack.pop() {
                enqueue(value)
            }
        }
    }
}

