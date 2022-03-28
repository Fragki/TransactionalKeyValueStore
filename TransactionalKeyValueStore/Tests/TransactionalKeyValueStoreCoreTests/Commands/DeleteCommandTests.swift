import Foundation
import XCTest
import TransactionalKeyValueStoreCore

class DeleteCommandTests: XCTestCase {
    
    // I am following London School of testing, mockist
    func test_DeleteCommand_run_callsCorerectAPI() {
        let spyDatasource = KeyValueStoreSpy()
        let sut = DeleteCommand(key: "key", datasource: spyDatasource)
        
        sut.run()
        
        XCTAssertEqual(spyDatasource.deleteEntryCalled.first, "key")
        XCTAssertEqual(spyDatasource.deleteEntryCalled.count, 1)
    }
}
