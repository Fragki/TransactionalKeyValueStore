import Foundation

public struct BeginCommand: Command {
    private let dataSourceProvider: DataSourceProviding
    
    public init(
        dataSourceProvider: DataSourceProviding
    ) {
        self.dataSourceProvider = dataSourceProvider
    }
    
    public func run() {
        dataSourceProvider.beginTransaction()
    }
}
