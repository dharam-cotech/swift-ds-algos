import Foundation

public class BinaryTreeNode<T> {
    public private(set) var value: T
    public var left: BinaryTreeNode<T>?
    public var right: BinaryTreeNode<T>?
    
    public init(_ value: T) {
        self.value = value
    }
}

extension BinaryTreeNode: CustomStringConvertible {
    public var description: String {
        return "\(value) "
    }
}

public struct BinaryTree<T> {
    public var root: BinaryTreeNode<T>?
    
    public init() {}
    
    public mutating func add(_ value: T) {
        
    }
    
    public mutating func remove(_ value: T) {
        
    }
    
    public func inOrder() {
        guard let root = root else {
            print("Empty tree")
            return
        }
        inOrder(root)
    }
    
    private func inOrder(_ node: BinaryTreeNode<T>?) {
        guard let node = node else {
            return
        }
        
        inOrder(node.left)
        print(node)
        inOrder(node.right)
    }
    
    public func preOrder() {
        guard let root = root else {
            print("Empty tree")
            return
        }
        preOrder(root)
    }
    
    private func preOrder(_ node: BinaryTreeNode<T>?) {
        guard let node = node else {
            return
        }
        
        print(node)
        inOrder(node.left)
        inOrder(node.right)
    }
    
    public func postOrder() {
        guard let root = root else {
            print("Empty tree")
            return
        }
        postOrder(root)
    }
    
    private func postOrder(_ node: BinaryTreeNode<T>?) {
        guard let node = node else {
            return
        }
        
        inOrder(node.left)
        inOrder(node.right)
        print(node)
    }
    
    public func levelOrder() {
        guard let root = root else {
            print("Empty tree")
            return
        }
        
        var queue = QueueCircularArray<BinaryTreeNode<T>?>(capacity: 7)
        queue.enqueue(root)
        
        while !queue.isEmpty, let node = queue.dequeue() {
            print(node)
            
            queue.enqueue(node?.left)
            queue.enqueue(node?.right)
        }
    }
}

extension BinaryTree {
    public func height() -> Int {
        guard let root = root else {
            return 0
        }
        
        var height = 0
        var queue = QueueCircularArray<BinaryTreeNode<T>?>(capacity: 17)
        queue.enqueue(root)
        queue.enqueue(nil)
        while !queue.isEmpty {
            if case let node?? = queue.dequeue() {
                print(node)
                queue.enqueue(node.left)
                queue.enqueue(node.right)
            } else {
                height += 1
                queue.enqueue(nil)
            }
        }
        return height
    }
    
    public func heightOfTheTree() -> Int {
        heightWithRecursion(root)
    }
    
    private func heightWithRecursion<T>(_ node: BinaryTreeNode<T>?) -> Int {
        guard node != nil else { return -1 }
        return max(heightWithRecursion(node?.left), heightWithRecursion(node?.right)) + 1
    }
    
    public func serializeTree() -> [T?] {
        var serializedArray: [T?] = []
        traversePreOrder(root) { (value) in
            serializedArray.append(value)
        }
        return serializedArray
    }
    
    private func traversePreOrder<T>(_ node: BinaryTreeNode<T>?, visit: (T?) -> Void) {
        visit(node?.value)

        guard node != nil else {
            return
        }
        
        traversePreOrder(node?.left, visit: visit)
        traversePreOrder(node?.right, visit: visit)
    }
    
    // O(n2)
    public static func deSerializeTree(_ tree: inout [T?]) -> BinaryTreeNode<T>? {
        guard let value = tree.removeFirst() else {
            return nil
        }
        
        let node = BinaryTreeNode(value)
        node.left = deSerializeTree(&tree)
        node.right = deSerializeTree(&tree)

        return node
    }
    
    // O(n)
    public static func deSerializeTreeEfficient(_ tree: [T?]) -> BinaryTreeNode<T>? {
        var reversed = Array(tree.reversed())
        return deSerialize(&reversed)
    }
    
    private static func deSerialize(_ tree: inout [T?]) -> BinaryTreeNode<T>? {
        guard !tree.isEmpty, let value = tree.removeLast() else {
            return nil
        }
        
        let node = BinaryTreeNode(value)
        node.left = deSerializeTree(&tree)
        node.right = deSerializeTree(&tree)

        return node
    }
}
