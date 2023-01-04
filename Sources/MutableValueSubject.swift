public final class MutableValueSubject<T>: ValueSubject<T> {
    public override var value: Output {
        get { super.value }
        set { currentValueSubject.value = newValue }
    }

    public override init(_ value: Output) {
        super.init(value)
    }
}
