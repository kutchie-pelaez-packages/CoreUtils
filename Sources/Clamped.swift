import SwiftExtensions

@propertyWrapper public struct Clamped<T: Comparable> {
    private let lowerBound: T?
    private let upperBound: T?
    private var value: T

    public var wrappedValue: T {
        get { value }
        set { value = newValue.clamped(from: lowerBound, to: upperBound) }
    }

    public init(wrappedValue: T, _ range: ClosedRange<T>) {
        self.lowerBound = range.lowerBound
        self.upperBound = range.upperBound
        self.value = wrappedValue.clamped(from: lowerBound, to: upperBound)
    }

    public init(wrappedValue: T, _ range: PartialRangeFrom<T>) {
        self.lowerBound = range.lowerBound
        self.upperBound = nil
        self.value = wrappedValue.clamped(from: lowerBound, to: upperBound)
    }

    public init(wrappedValue: T, _ range: PartialRangeThrough<T>) {
        self.lowerBound = nil
        self.upperBound = range.upperBound
        self.value = wrappedValue.clamped(from: lowerBound, to: upperBound)
    }
}
