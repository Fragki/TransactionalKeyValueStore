import Foundation

public struct DeleteCommand: Command {
    let key: String
    private let datasource: KeyValueDeletable
    
    public init(
        key: String,
        datasource: KeyValueDeletable
    ) {
        self.key = key
        self.datasource = datasource
    }
    
    public func run() {
        datasource.deleteEntry(for: key)
    }
}
