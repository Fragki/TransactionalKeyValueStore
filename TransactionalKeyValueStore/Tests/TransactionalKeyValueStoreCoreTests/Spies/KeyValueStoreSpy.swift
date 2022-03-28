import Foundation
import TransactionalKeyValueStoreCore

class KeyValueStoreSpy: KeyValueStorable, KeyValueDeletable, KeyValueCountable {
    
    var setValueCalled: [(value: String, key: String)] = []
    func setValue(_ value: String, for key: String) {
        setValueCalled.append((value, key))
    }
    
    var getValueCalled: [String] = []
    func getValue(for key: String) -> String? {
        getValueCalled.append(key)
        return nil
    }
    
    var deleteEntryCalled: [String] = []
    func deleteEntry(for key: String) {
        deleteEntryCalled.append(key)
    }
    
    var getCountCalled: [String] = []
    func getCount(for value: String) -> Int {
        getCountCalled.append(value)
        return 0
    }
}
