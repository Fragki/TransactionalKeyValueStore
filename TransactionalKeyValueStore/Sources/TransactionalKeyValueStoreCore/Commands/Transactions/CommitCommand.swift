import Foundation

public struct CommitCommand: Command {
    private let dataSourceProvider: DataSourceProviding
    
    public init(
        dataSourceProvider: DataSourceProviding
    ) {
        self.dataSourceProvider = dataSourceProvider
    }
    
    public func run() throws {
        do {
            try dataSourceProvider.commitTransaction()
        } catch CommandLineParserError.noTransaction {
            throw CommandLineParserError.noTransaction
        }
    }
}
