import Foundation
import XCTest
import TransactionalKeyValueStoreCore

final class DataSourceProviderTests: XCTestCase {
    
    func test_BeginTransaction_CreatesNewKeyValueStore() {
        let sut = DataSourceProvider()
        XCTAssertEqual(sut.dataSourceStack.count, 1)
        
        sut.beginTransaction()
        
        XCTAssertEqual(sut.dataSourceStack.count, 2)
    }
    
    func test_CommitTransaction_RemovesLastKeyValueStore() {
        let sut = DataSourceProvider()
        XCTAssertEqual(sut.dataSourceStack.count, 1)

        sut.beginTransaction()
        let afterTransactionDatasource = sut.getDataSource()
        try? sut.commitTransaction()
        
        XCTAssertEqual(sut.dataSourceStack.count, 1)
        let latestDatasource = sut.getDataSource()
        XCTAssert(latestDatasource === afterTransactionDatasource)
    }
    
    func test_CommitTransaction_ThrowsWhenStackHasOnlyOneStore() {
        let sut = DataSourceProvider()
        XCTAssertEqual(sut.dataSourceStack.count, 1)
        
        do {
            try sut.commitTransaction()
        } catch {
            XCTAssert(true)
            return
        }
        XCTFail()
    }
    
    func test_RollbackTransaction_RemovesLastKeyValueStore() {
        let sut = DataSourceProvider()
        XCTAssertEqual(sut.dataSourceStack.count, 1)
        
        sut.beginTransaction()
        try? sut.rollbackTransaction()
        
        XCTAssertEqual(sut.dataSourceStack.count, 1)
    }
    
    func test_RollbackTransaction_ThrowsWhenStackHasOnlyOneStore() {
        let sut = DataSourceProvider()
        XCTAssertEqual(sut.dataSourceStack.count, 1)
        
        do {
            try sut.rollbackTransaction()
        } catch {
            XCTAssert(true)
            return
        }
        XCTFail()
    }
    
    func test_GetTransaction_ReturnsCorrectStore() {
        let sut = DataSourceProvider()
        let datasource = sut.getDataSource()
        sut.beginTransaction()
        
        let latestDatasource = sut.getDataSource()
        XCTAssert(latestDatasource !== datasource)
    }
    
}
