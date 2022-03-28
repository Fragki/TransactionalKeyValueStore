import Foundation
import XCTest
import TransactionalKeyValueStoreCore

class RollbackCommandTests: XCTestCase {
    
    // I am following London School of testing, mockist
    func test_BeginCommand_run_callsCorerectAPI() throws {
        let spyDatasource = DataSourceProviderSpy()
        let sut = RollbackCommand(dataSourceProvider: spyDatasource)
        
        try sut.run()
        
        XCTAssertEqual(spyDatasource.rollbackTransactionCalled, 1)
    }
}
