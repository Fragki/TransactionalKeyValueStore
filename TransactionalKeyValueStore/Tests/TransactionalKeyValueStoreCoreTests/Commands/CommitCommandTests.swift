import Foundation
import XCTest
import TransactionalKeyValueStoreCore

class CommitCommandTests: XCTestCase {
    
    // I am following London School of testing, mockist
    func test_BeginCommand_run_callsCorerectAPI() throws {
        let spyDatasource = DataSourceProviderSpy()
        let sut = CommitCommand(dataSourceProvider: spyDatasource)
        
        try sut.run()
        
        XCTAssertEqual(spyDatasource.commitTransactionCalled, 1)
    }
}
