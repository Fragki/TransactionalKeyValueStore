import Foundation

public enum CommandLineParserError: Error {
    case operationNotSupported
    case keyNotSet
    case noTransaction
}

public final class CommandLineParser {
    
    let dataSourceProvider: DataSourceProviding = DataSourceProvider()
    
    public init() { }

    public func createCommand(args: [String]) throws {
        guard let commandName = args.first else {
            throw CommandLineParserError.operationNotSupported
        }
        
        do {
            let command = try CommandFactory.createCommand(
                commandName: commandName,
                args: Array(args.dropFirst()),
                dataSourceProviding: dataSourceProvider
            )
            try command.run()
        } catch CommandLineParserError.noTransaction {
            throw CommandLineParserError.noTransaction
        } catch CommandLineParserError.keyNotSet {
            throw CommandLineParserError.keyNotSet
        } catch {
            throw CommandLineParserError.operationNotSupported
        }
    }
}
