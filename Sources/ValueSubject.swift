import Combine

public class ValueSubject<T>: Publisher {
    let currentValueSubject: CurrentValueSubject<Output, Failure>

    public var value: Output { currentValueSubject.value }

    init(_ value: Output) {
        self.currentValueSubject = CurrentValueSubject(value)
    }

    // MARK: Publisher

    public typealias Output = T
    public typealias Failure = Never

    public func receive<S>(subscriber: S) where S: Subscriber, S.Failure == Failure, S.Input == Output {
        currentValueSubject.receive(subscriber: subscriber)
    }
}
