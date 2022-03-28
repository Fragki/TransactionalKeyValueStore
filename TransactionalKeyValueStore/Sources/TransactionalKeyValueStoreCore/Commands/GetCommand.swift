public struct GetCommand: Command {
    let key: String
    private let datasource: KeyValueStorable
    
    public init(
        key: String,
        datasource: KeyValueStorable & KeyValueDeletable
    ) {
        self.key = key
        self.datasource = datasource
    }
    
    public func run() throws {
        guard let value = datasource.getValue(for: key) else {
            throw CommandLineParserError.keyNotSet
        }
        print(value)
    }
}
