import Foundation

public struct QueueCircularArray<T>: Queue {
    
    private var array: [T?]
    private var read = 0
    private var write = 0
    
    public init(capacity: Int) {
        array = Array.init(repeating: nil, count: capacity)
    }
    
    mutating public func enqueue(_ element: T) {
        guard !isFull else {
            return
        }
        array[write % array.count] = element
        write += 1
    }
    
    mutating public func dequeue() -> T? {
        guard !isEmpty else {
            return nil
        }
        let readValue = array[read]
        array[read % array.count] = nil
        read = read + 1
        return readValue
    }
    
    public var isEmpty: Bool {
        availableSpaceForReading == 0
    }
    
    public var isFull: Bool {
        availableSpaceForWriting == 0
    }
    
    private var availableSpaceForReading: Int {
        write - read
    }
    
    private var availableSpaceForWriting: Int {
        array.count - availableSpaceForReading
    }
    
    public var peek: T? {
        array[read]
    }
}

extension QueueCircularArray: CustomStringConvertible {
    public var description: String {
        String(describing: array)
    }
}
