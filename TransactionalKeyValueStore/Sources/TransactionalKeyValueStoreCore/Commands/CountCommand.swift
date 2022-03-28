import Foundation

public struct CountCommand: Command {
    let value: String
    private let datasource: KeyValueCountable
    
    public init(
        value: String,
        datasource: KeyValueCountable
    ) {
        self.value = value
        self.datasource = datasource
    }
    
    public func run() {
        print(datasource.getCount(for: value))
    }
}
