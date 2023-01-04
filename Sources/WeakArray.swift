public struct WeakArray<T>: BidirectionalCollection, RangeReplaceableCollection, ExpressibleByArrayLiteral {
    private var buffer: [() -> T?]

    private var values: [T] { buffer.compactMap { $0() } }

    public init() {
        self.buffer = []
    }

    // MARK: Collection

    public var startIndex: Int { values.startIndex }

    public var endIndex: Int { values.endIndex }

    public subscript(index: Int) -> T { values[index] }

    public func index(after i: Int) -> Int { values.index(after: i) }

    // MARK: BidirectionalCollection

    public func index(before i: Int) -> Int { values.index(before: i) }

    // MARK: RangeReplaceableCollection

    public mutating func replaceSubrange<C>(
        _ subrange: Range<Int>, with newElements: C
    ) where C: Collection, T == C.Element {
        buffer.replaceSubrange(subrange, with: newElements.map(resolver))
    }

    // MARK: ExpressibleByArrayLiteral

    public init(arrayLiteral elements: T...) {
        self.buffer = elements.map(resolver)
    }
}

private func resolver<T>(for value: T) -> () -> T? {
    let object = value as AnyObject
    return { [weak object] in object as? T }
}
