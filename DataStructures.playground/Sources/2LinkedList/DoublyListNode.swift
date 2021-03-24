import Foundation

public class DoublyListNode<Element: Equatable> {
    public var value: Element
    public var next: DoublyListNode<Element>?
    public var previous: DoublyListNode<Element>?

    public init(_ value: Element, next: DoublyListNode<Element>? = nil, previous: DoublyListNode<Element>? = nil) {
        self.value = value
        self.next = next
        self.previous = previous
    }
}

extension DoublyListNode: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> \(String(describing: next))" + " "
    }
}

