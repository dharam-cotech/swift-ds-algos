
example(of: "using Stack") {
    
    var stack = Stack<String>()
    stack.push(element: "ram")
    stack.push(element: "sia")
    stack.push(element: "maruti")
    stack.push(element: "lakhan")
    stack.push(element: "ram")
    print(stack)
}

// MARK: reversedArray

func reversedArray(elements: [String]) -> [String] {
    var stack = Stack<String>()
    elements.forEach {
        stack.push(element: $0)
    }
    return elements.compactMap { _ in stack.pop() }
}

example(of: "using reversedArray") {
    let reverseArray = reversedArray(elements: ["a", "b", "c", "d"])
    print("Reversed Array : " + reverseArray.description)
}

// MARK: Balance the parentheses

func hasParenthesesBalanced(input: String) -> Bool {
    var stack = Stack<Character>()
    for char in input {
        if case "(" = char {
            stack.push(element: char)
        } else if case ")" = char {
            if stack.isEmpty {
                return false
            } else {
                stack.pop()
            }
        }
    }
    return stack.isEmpty
}

example(of: "using hasParenthesesBalanced") {
    let input1 = "h((e))llo(world)()"
    let input2 = "(hello world"
    print("hasParenthesesBalanced1 : " + String(hasParenthesesBalanced(input: input1)))
    print("hasParenthesesBalanced2 : " + String(hasParenthesesBalanced(input: input2)))
}



