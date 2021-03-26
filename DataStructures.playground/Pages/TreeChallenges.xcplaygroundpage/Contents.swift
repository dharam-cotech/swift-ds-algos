//: [Previous](@previous)

import Foundation

example(of: "BinaryTree with Linkedlist") {
    var tree = BinaryTree<Int>()
    let root = BinaryTreeNode<Int>(1)
    let leftNode = BinaryTreeNode<Int>(2)
    leftNode.left = BinaryTreeNode<Int>(4)
    leftNode.right = BinaryTreeNode<Int>(5)
    let rightNode = BinaryTreeNode<Int>(3)
    rightNode.left = BinaryTreeNode<Int>(6)
    rightNode.right = BinaryTreeNode<Int>(7)
    root.left = leftNode
    root.right = rightNode
    tree.root = root
    tree.preOrder()
//    tree.levelOrder()
//    print("Height of Binarytree : \(tree.height())")
    print("Height of Binarytree : \(tree.heightOfTheTree())")
    var serializedTree = tree.serializeTree()
    print("Serialize Tree : \(serializedTree)")
    
    print("De-serialize Tree Efficient :  \(BinaryTree.deSerializeTreeEfficient(serializedTree)!)")
    
    print("De-serialize Tree :  \(BinaryTree.deSerializeTree(&serializedTree)!)")
}
//: [Next](@next)
