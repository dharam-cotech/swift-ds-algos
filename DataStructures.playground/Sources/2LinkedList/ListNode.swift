import Foundation

public class ListNode<Element> {
    public var value: Element
    public var next: ListNode<Element>?
    
    public init(_ value: Element) {
        self.value = value
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> \(String(describing: next))" + " "
    }
}

