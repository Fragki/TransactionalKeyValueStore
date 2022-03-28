import Foundation
import XCTest
import TransactionalKeyValueStoreCore

class GetCommandTests: XCTestCase {
    
    // I am following London School of testing, mockist
    func test_GetCommand_run_callsCorerectAPI() {
        let spyDatasource = KeyValueStoreSpy()
        let sut = GetCommand(key: "key", datasource: spyDatasource)
        
        try? sut.run()
        
        XCTAssertEqual(spyDatasource.getValueCalled.first, "key")
        XCTAssertEqual(spyDatasource.getValueCalled.count, 1)
    }
}
