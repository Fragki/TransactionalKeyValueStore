import Foundation

public struct CommandFactory {
    
    public static func createCommand(
        commandName: String,
        args: [String],
        dataSourceProviding: DataSourceProviding
    ) throws -> Command {
        
        switch (commandName, args.count) {
        case ("GET", 1):
            return GetCommand(key: args[0], datasource: dataSourceProviding.getDataSource())
        case ("SET", 2):
            return SetCommand(key: args[0], value: args[1], datasource: dataSourceProviding.getDataSource())
        case ("DELETE", 1):
            return DeleteCommand(key: args[0], datasource: dataSourceProviding.getDataSource())
        case ("COUNT", 1):
            return CountCommand(value: args[0], datasource: dataSourceProviding.getDataSource())
        case ("BEGIN", 0):
            return BeginCommand(dataSourceProvider: dataSourceProviding)
        case ("COMMIT", 0):
            return CommitCommand(dataSourceProvider: dataSourceProviding)
        case ("ROLLBACK", 0):
            return RollbackCommand(dataSourceProvider: dataSourceProviding)
        default:
            throw CommandLineParserError.operationNotSupported
        }
    }
}
