import Foundation

public struct LinkedList<Element: Equatable> {
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
        guard !isKnownUniquelyReferenced(&head) else { return }
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

// MARK: Algos

extension LinkedList {
    public func printListInReverse() {
        printInReverse(node: head)
    }
    
    private func printInReverse(node: ListNode<Element>?) {
        guard node != nil else { return }
        printInReverse(node: node?.next)
        guard let value = node?.value else { return }
        print("\(value) -> ")
    }
    
    @discardableResult
    public mutating func reverseLinkedList() -> ListNode<Element>? {
        guard head != nil else {
            return head
        }
        
        var cNode = head?.next
        let pNode = head
        
        while pNode?.next != nil {
            pNode?.next = cNode?.next
            cNode?.next = head
            head = cNode
            cNode = pNode?.next
        }
        
        tail = pNode
        return head
    }
    
    public func middleNode() -> ListNode<Element>? {
        guard head != nil else {
            return head
        }
        
        var sNode = head
        var fNode = head
        
        while fNode?.next != nil {
            fNode = fNode?.next?.next
            sNode = sNode?.next
        }
        
        return sNode
    }
    
    public mutating func removeAllOccurences(of value: Element) {
        copyNodes()
        guard head != nil else {
            return
        }
        
        while let headNode = head, headNode.value == value {
            self.head = self.head?.next
        }
        
        var node = head?.next
        var pNode = head
        
        while node != nil {
            if value == node?.value {
                pNode?.next = node?.next
                node = pNode?.next
                continue
            }
            pNode = node
            node = node?.next
        }
        
        tail = pNode
    }
    
    public static func mergeLists(list1: LinkedList<Int>?, list2: LinkedList<Int>?) -> LinkedList<Int>? {
        guard var list1 = list1,
              var list2 = list2 else {
            return nil
        }
        
        guard !list1.isEmpty else {
            return list2
        }
        
        guard !list2.isEmpty else {
            return list1
        }
        
        var newList = LinkedList<Int>()
        
        var val1 = list1.pop()
        var val2 = list2.pop()
        
        while let value1 = val1,
              let value2 = val2 {
            if value1 < value2 {
                newList.append(value1)
                val1 = list1.pop()
            } else {
                newList.append(value2)
                val2 = list2.pop()
            }
        }
        
        while let value1 = val1 {
            newList.append(value1)
            val1 = list1.pop()
        }
        
        while let value2 = val2 {
            newList.append(value2)
            val2 = list2.pop()
        }
        
        return newList
    }
}
