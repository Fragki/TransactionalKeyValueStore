import Foundation
import XCTest
import TransactionalKeyValueStoreCore

class SetCommandTests: XCTestCase {
    
    // I am following London School of testing, mockist
    func test_SetCommand_run_callsCorerectAPI() {
        let spyDatasource = KeyValueStoreSpy()
        let sut = SetCommand(key: "key", value: "200", datasource: spyDatasource)
        
        sut.run()
        
        XCTAssertEqual(spyDatasource.setValueCalled.first?.key, "key")
        XCTAssertEqual(spyDatasource.setValueCalled.first?.value, "200")
        XCTAssertEqual(spyDatasource.setValueCalled.count, 1)
    }
    
}
