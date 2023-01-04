import SwiftExtensions

public struct ContextError: Error, CustomStringConvertible, CustomReflectable {
    private let message: String
    private let context: Any?

    public init(message: String, context: Any? = nil) {
        self.message = message
        self.context = context
    }

    // MARK: - CustomStringConvertible

    public var description: String {
        if let context {
            return "\(message), context: \(context)"
        } else {
            return message
        }
    }

    // MARK: CustomReflectable

    public var customMirror: Mirror {
        let children = [
            ("message", message),
            context != nil ? ("context", context!) : nil
        ].unwrapped()

        return Mirror(self, children: children, displayStyle: .collection)
    }
}
