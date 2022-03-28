import Foundation

public struct RollbackCommand: Command {
    private let dataSourceProvider: DataSourceProviding
    
    public init(
        dataSourceProvider: DataSourceProviding
    ) {
        self.dataSourceProvider = dataSourceProvider
    }
    
    public func run() throws {
        do {
            try dataSourceProvider.rollbackTransaction()
        } catch CommandLineParserError.noTransaction {
            throw CommandLineParserError.noTransaction
        }
    }
}
