import Foundation

public class DataSourceProvider: DataSourceProviding {
    public private(set) var dataSourceStack: [KeyValueStore] = []
    
    public init() {
        dataSourceStack.append(KeyValueStore())
    }
    
    public func getDataSource() -> KeyValueStore & KeyValueCountable & KeyValueDeletable {
        guard let dataSource = dataSourceStack.last else {
            fatalError("Should always have a datasource")
        }
        return dataSource
    }
    
    public func beginTransaction() {
        let current = getDataSource()
        let transactionDataSource = KeyValueStore(datasource: current.datasource)
        dataSourceStack.append(transactionDataSource)
    }
    
    public func commitTransaction() throws {
        if dataSourceStack.count < 2 {
            throw CommandLineParserError.noTransaction
        }
        
        let transactionDataSource = dataSourceStack.removeLast()
        _ = dataSourceStack.removeLast()
        
        dataSourceStack.append(transactionDataSource)
    }
    
    public func rollbackTransaction() throws {
        if dataSourceStack.count < 2 {
            throw CommandLineParserError.noTransaction
        }
        
        _ = dataSourceStack.removeLast()
    }
}
