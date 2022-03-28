import Foundation
import XCTest
import TransactionalKeyValueStoreCore

class BeginCommandTests: XCTestCase {
    
    // I am following London School of testing, mockist
    func test_BeginCommand_run_callsCorerectAPI() {
        let spyDatasource = DataSourceProviderSpy()
        let sut = BeginCommand(dataSourceProvider: spyDatasource)
        
        sut.run()
        
        XCTAssertEqual(spyDatasource.beginTransactionCalled, 1)
    }
}
