import Foundation
import XCTest
import TransactionalKeyValueStoreCore

final class CommandLineParserTests: XCTestCase {
    
    func testCreateCommand_WhenNoTransactions() throws {
        let sut = CommandLineParser()
        
        do {
            try sut.createCommand(args: ["COMMIT"])
        } catch CommandLineParserError.noTransaction {
            XCTAssert(true)
            return
        }
        XCTFail()
    }
    
    func testCreateCommand_WhenKeyNotSet() throws {
        let sut = CommandLineParser()
        
        do {
            try sut.createCommand(args: ["GET", "a key"])
        } catch CommandLineParserError.keyNotSet {
            XCTAssert(true)
            return
        }
        XCTFail()
    }
    
    func testCreateCommand_WhenNoOperationSupported() throws {
        let sut = CommandLineParser()
        
        do {
            try sut.createCommand(args: ["Something"])
        } catch CommandLineParserError.operationNotSupported {
            XCTAssert(true)
            return
        }
        XCTFail()
    }
    
    func testCreateCommand_WhenNoName() throws {
        let sut = CommandLineParser()
        
        do {
            try sut.createCommand(args: [])
        } catch CommandLineParserError.operationNotSupported {
            XCTAssert(true)
            return
        }
        XCTFail()
    }
    
    func testCreateCommand_WhenNoError() throws {
        let sut = CommandLineParser()
        
        do {
            try sut.createCommand(args: ["SET", "a key", "a value"])
        } catch {
            XCTFail()
        }
        
    }
}
