import Foundation

public struct Stack<Element> {
    private var data: [Element] = []
    
    public init() {}
    
    public mutating func pop() -> Element? {
        data.popLast()
    }
    
    public mutating func push(element: Element) {
        data.append(element)
    }
    
    public func peek() -> Element? {
        data.last
    }
    
    public var isEmpty: Bool {
        data.count == 0
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        "Stack : \(data.map { "\($0)" }.reversed().joined(separator: "-"))"
    }
}
