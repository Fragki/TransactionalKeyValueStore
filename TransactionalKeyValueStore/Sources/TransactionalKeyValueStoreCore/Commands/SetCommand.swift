public struct SetCommand: Command {
    let key: String
    let value: String
    private let datasource: KeyValueStorable & KeyValueDeletable
    
    public init(
        key: String,
        value: String,
        datasource: KeyValueStorable & KeyValueDeletable
    ) {
        self.key = key
        self.value = value
        self.datasource = datasource
    }
    
    public func run() {
        datasource.setValue(value, for: key)
    }
}
