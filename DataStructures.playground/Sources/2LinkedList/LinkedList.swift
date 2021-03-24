import Foundation

public struct LinkedList<Element> {
    private var head: ListNode<Element>?
    private var tail: ListNode<Element>?
    
    public init() {}
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public mutating func push(_ value: Element) {
        copyNodes()
        let node = ListNode<Element>(value)
        if head == nil {
            head = node
            tail = node
            return
        }
        node.next = head
        head = node
    }
    
    public mutating func insert(_ value: Element, after index: Int) {
        copyNodes()
        if index == 0 {
            push(value)
            return
        }
        var tempIndex = 0
        var node = head
        while node != nil && tempIndex < index {
            tempIndex += 1
            node = node?.next
        }
        if node === tail {
            append(value)
            return
        }
        let newNode = ListNode<Element>(value)
        newNode.next = node?.next
        node?.next = newNode
    }
    
    public mutating func append(_ value: Element) {
        copyNodes()
        let node = ListNode<Element>(value)
        if isEmpty {
            head = node
            tail = node
            return
        }
        tail?.next = node
        tail = node
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        copyNodes()
        guard let headNode = head else { return nil }
        let value = headNode.value
        self.head = headNode.next
        if isEmpty {
            self.tail = nil
        }
        return value
    }
    
    @discardableResult
    public mutating func removeLast() -> Element? {
        copyNodes()
        guard let headNode = head else { return nil }
        //        print("head : \(String(describing: headNode))")
        //        print("tail : \(String(describing: tail!))")
        
        guard headNode !== tail else {
            self.head = nil
            self.tail = nil
            return headNode.value
        }
        
        var node: ListNode<Element>? = headNode
        
        while node?.next !== tail {
            node = node?.next
        }
        
        let removedNode = tail
        tail = node
        node?.next = nil
        return removedNode?.value
    }
    
    @discardableResult
    public mutating func remove(after index: Int) -> Element? {
        copyNodes()
        var tempIndex = 0
        var node = head
        while node != nil && tempIndex < index {
            tempIndex += 1
            node = node?.next
        }
        guard node !== tail else { return nil }
        let removedNode = node?.next
        node?.next = removedNode?.next
        return removedNode?.value
    }
}

// MARK: Print LinkedList

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

// MARK: Collection

extension LinkedList: Collection {
    
    public struct Index: Comparable {
        public var node: ListNode<Element>?
        
        static public func ==(lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }
        
        static public func <(lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else {
                return false
            }
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains { $0 === rhs.node }
        }
    }
    
    // 1
    public var startIndex: Index {
        Index(node: head)
    }
    // 2
    public var endIndex: Index {
        Index(node: tail?.next)
    }
    // 3
    public func index(after i: Index) -> Index {
        Index(node: i.node?.next)
    }
    // 4
    public subscript(position: Index) -> Element {
        position.node!.value
    }
}

// MARK: COW

extension LinkedList {
    private mutating func copyNodes() {
        guard head != nil else { return }
        
        guard let value = head?.value else {
            return
        }

        var oldNode = head
        var newNode: ListNode? = ListNode<Element>(value)
        head = newNode
        
        while let nextOldNode = oldNode?.next {
            newNode?.next = ListNode<Element>(nextOldNode.value)
            newNode = newNode?.next
            oldNode = oldNode?.next
        }
        tail = newNode
    }
}
