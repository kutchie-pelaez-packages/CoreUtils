import Foundation

public protocol UserDefaultsSerializable {}

extension Data: UserDefaultsSerializable {}
extension Date: UserDefaultsSerializable {}
extension URL: UserDefaultsSerializable {}
extension String: UserDefaultsSerializable {}
extension Int: UserDefaultsSerializable {}
extension Double: UserDefaultsSerializable {}
extension Bool: UserDefaultsSerializable {}
extension Array: UserDefaultsSerializable where Element: UserDefaultsSerializable {}
extension Dictionary: UserDefaultsSerializable where Key == String, Value: UserDefaultsSerializable {}
