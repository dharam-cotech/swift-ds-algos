import Foundation

public class ListNode<Element: Equatable> {
    public var value: Element
    public var next: ListNode<Element>?
    
    public init(_ value: Element, next: ListNode<Element>? = nil) {
        self.value = value
        self.next = next
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

