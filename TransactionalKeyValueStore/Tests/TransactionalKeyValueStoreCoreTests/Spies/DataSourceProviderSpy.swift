import Foundation
import TransactionalKeyValueStoreCore

class DataSourceProviderSpy: DataSourceProviding {
    
    var getDataSourceCalled: Int = 0
    func getDataSource() -> KeyValueStore & KeyValueCountable & KeyValueDeletable {
        getDataSourceCalled += 1
        return KeyValueStore()
    }
    
    var beginTransactionCalled: Int = 0
    func beginTransaction() {
        beginTransactionCalled += 1
    }
    
    var commitTransactionCalled: Int = 0
    func commitTransaction() throws {
        commitTransactionCalled += 1
    }
    
    var rollbackTransactionCalled: Int = 0
    func rollbackTransaction() throws {
        rollbackTransactionCalled += 1
    }
}
