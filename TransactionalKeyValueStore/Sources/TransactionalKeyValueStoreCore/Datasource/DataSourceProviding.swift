import Foundation

public protocol DataSourceProviding {
    func getDataSource() -> KeyValueStore & KeyValueCountable & KeyValueDeletable
    func beginTransaction()
    func commitTransaction() throws
    func rollbackTransaction() throws
}
