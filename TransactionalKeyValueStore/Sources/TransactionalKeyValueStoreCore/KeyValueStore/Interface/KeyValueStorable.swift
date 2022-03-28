import Foundation

public protocol KeyValueStorable {
    func setValue(_ value: String, for key: String)
    func getValue(for key: String) -> String?
}
