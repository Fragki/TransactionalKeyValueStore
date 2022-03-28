import Foundation

public protocol KeyValueCountable {
    // O(n) time complexity. We can improve to O(1), if it is a frequent operation.
    func getCount(for value: String) -> Int
}
