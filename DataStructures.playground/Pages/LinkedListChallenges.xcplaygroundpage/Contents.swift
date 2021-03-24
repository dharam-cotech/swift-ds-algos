//: [Previous](@previous)

import Foundation

// MARK: LinkedList

example(of: "using LinkedList") {
    
    var list = LinkedList<Int>()
    list.push(1)
    list.push(2)
    list.push(3)
    list.push(4)
    list.push(5)
    print(list)
    
    list.append(6)
    print(list)
    
    list.insert(7, after: 2)
    print(list)
    
    list.insert(7, after: 5)
    print(list)
    
    list.insert(8, after: 7)
    print(list)
    
    list.insert(9, after: 0)
    print(list)
    
    list.pop()
    print(list)
    list.remove(after: 1)
    list.remove(after: 2)
    print(list)
    print("Remove last : " + String(list.removeLast() ?? -1))
    print("Remove last : " + String(list.removeLast() ?? -1))
    print("Remove last : " + String(list.removeLast() ?? -1))
    print("Remove last : " + String(list.removeLast() ?? -1))
    print("Remove last : " + String(list.removeLast() ?? -1))
    print(list)
    
    list.push(1)
    print(list)
}

example(of: "using collection") {
  var list = LinkedList<Int>()
  for i in 0...9 {
    list.append(i)
  }
  
  print("List: \(list)")
  print("First element: \(list[list.startIndex])")
  print("Array containing first 3 elements: \(Array(list.prefix(3)))")
  print("Array containing last 3 elements: \(Array(list.suffix(3)))")
  
  let sum = list.reduce(0, +)
  print("Sum of all values: \(sum)")
}
//: [Next](@next)
