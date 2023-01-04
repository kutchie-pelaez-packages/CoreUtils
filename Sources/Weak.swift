@propertyWrapper public struct Weak<T> {
    private var wrappedValueResolver: () -> T?

    public var wrappedValue: T? {
        get { wrappedValueResolver() }
        set { wrappedValueResolver = resolver(for: newValue) }
    }

    public init(wrappedValue: T?) {
        self.wrappedValueResolver = resolver(for: wrappedValue)
    }
}

private func resolver<T>(for value: T?) -> () -> T? {
    let object = value as AnyObject
    return { [weak object] in object as? T }
}
