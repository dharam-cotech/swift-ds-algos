import Foundation

public struct QueueDoubleStack<T>: Queue {
    
    private var leftStack = Stack<T>()
    private var rightStack = Stack<T>()

    public init() {}
    
    mutating public func enqueue(_ element: T) {
        leftStack.push(element: element)
    }
    
    @discardableResult
    mutating public func dequeue() -> T? {
        guard !isEmpty else { return nil }
        if rightStack.isEmpty {
            copyLeftToRightStack()
        }
        return rightStack.pop()
    }
    
    public var isEmpty: Bool {
        leftStack.isEmpty && rightStack.isEmpty
    }
    
    public var peek: T? {
        //!leftStack.isEmpty ? leftStack.last : rightStack.first
        nil
    }
    
    private mutating func copyLeftToRightStack() {
        while !leftStack.isEmpty {
            if let element = leftStack.pop() {
                rightStack.push(element: element)
            }
        }
    }
}

extension QueueDoubleStack: CustomStringConvertible {
    public var description: String {
        guard !isEmpty else {
            return "Empty queue"
        }
        return String(describing: leftStack) + String(describing: rightStack)
    }
}
