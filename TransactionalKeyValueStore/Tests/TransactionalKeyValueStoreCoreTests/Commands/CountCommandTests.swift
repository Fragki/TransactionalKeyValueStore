import Foundation
import XCTest
import TransactionalKeyValueStoreCore

class CountCommandTests: XCTestCase {
    
    // I am following London School of testing, mockist
    func test_CountCommand_run_callsCorerectAPI() {
        let spyDatasource = KeyValueStoreSpy()
        let sut = CountCommand(value: "value", datasource: spyDatasource)
        
        sut.run()
        
        XCTAssertEqual(spyDatasource.getCountCalled.first, "value")
        XCTAssertEqual(spyDatasource.getCountCalled.count, 1)
    }
}
