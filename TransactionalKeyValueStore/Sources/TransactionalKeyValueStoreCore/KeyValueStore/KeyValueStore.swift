import Foundation

public class KeyValueStore: KeyValueStorable, KeyValueDeletable, KeyValueCountable {
    private(set) var datasource: [String: String]
    
    public init(datasource: [String: String] = [:]) {
        self.datasource = datasource
    }
    
    public func setValue(_ value: String, for key: String) {
        datasource[key] = value
    }
    
    public func getValue(for key: String) -> String? {
        return datasource[key]
    }
    
    public func deleteEntry(for key: String) {
        datasource[key] = nil
    }
    
    public func getCount(for value: String) -> Int {
        return datasource.values.filter{ $0 == value}.count
    }
}
