import XCTest
import TransactionalKeyValueStoreCore
@testable import TransactionalKeyValueStore

class TransactionalKeyValueStoreTests: XCTestCase {
    
    func test_NoTransactions() throws {
        
        let commandLineParser = CommandLineParser()
        let output = try? parse("ROLLBACK", commandLineParser)

        XCTAssertEqual(output, "no transactions")
    }
    
    func test_KeyNotSet() throws {
        
        let commandLineParser = CommandLineParser()
        let output = try? parse("GET key", commandLineParser)

        XCTAssertEqual(output, "key not set")
    }
    
    func test_OperationNotSupported() throws {
        
        let commandLineParser = CommandLineParser()
        let output = try? parse("TYPO", commandLineParser)

        XCTAssertEqual(output, "Operation not supported")
    }
}
