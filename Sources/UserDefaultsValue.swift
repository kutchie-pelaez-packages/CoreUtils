import Foundation
import SwiftExtensions

@propertyWrapper public struct UserDefaultsValue<T: UserDefaultsSerializable> {
    private let key: String
    private let defaultValue: T
    private let userDefaults: UserDefaults

    public var wrappedValue: T {
        get {
            let persistedValue: Any?
            if T.self == URL.self {
                persistedValue = userDefaults.url(forKey: key)
            } else {
                persistedValue = userDefaults.value(forKey: key)
            }
            return persistedValue as? T ?? defaultValue
        }
        set {
            if case Optional<Any>.none = newValue as Any {
                userDefaults.removeObject(forKey: key)
            } else if T.self == URL.self  {
                userDefaults.set(newValue as? URL, forKey: key)
            } else {
                userDefaults.set(newValue, forKey: key)
            }
        }
    }

    public init(key: String, defaultValue: T, userDefaults: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.userDefaults = userDefaults
        userDefaults.register(defaults: [key: defaultValue].unwrapped())
    }
}

extension UserDefaultsValue where T: ExpressibleByNilLiteral {
    public init(key: String, userDefaults: UserDefaults = .standard) {
        self.init(key: key, defaultValue: nil, userDefaults: userDefaults)
    }
}
