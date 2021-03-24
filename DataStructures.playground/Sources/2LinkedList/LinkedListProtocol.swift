import Foundation

public protocol LinkedListProtocol {
    associatedtype Element: Equatable
    var isEmpty: Bool { get }
    
    mutating func push(_ value: Element)
    mutating func insert(_ value: Element, after index: Int)
    mutating func append(_ value: Element)
    @discardableResult
    mutating func pop() -> Element?
    @discardableResult
    mutating func removeLast() -> Element?
    @discardableResult
    mutating func remove(after index: Int) -> Element?
    mutating func remove(_ node: DoublyListNode<Element>) -> Element?
    func peek() -> Element?
}
