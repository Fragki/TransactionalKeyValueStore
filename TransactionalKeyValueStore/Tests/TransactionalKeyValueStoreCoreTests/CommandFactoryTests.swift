import Foundation
import XCTest
import TransactionalKeyValueStoreCore

final class CommandFactoryTests: XCTestCase {
    
    func test_GetCommand() {
        let cmd = try? CommandFactory.createCommand(
            commandName: "GET",
            args: ["a key"],
            dataSourceProviding: DataSourceProvider())
        
        XCTAssert(cmd is GetCommand)
    }
    
    func test_SetCommand() {
        let cmd = try? CommandFactory.createCommand(
            commandName: "SET",
            args: ["a key", "a value"],
            dataSourceProviding: DataSourceProvider())
        
        XCTAssert(cmd is SetCommand)
    }
    
    func test_DeleteCommand() {
        let cmd = try? CommandFactory.createCommand(
            commandName: "DELETE",
            args: ["a key"],
            dataSourceProviding: DataSourceProvider())
        
        XCTAssert(cmd is DeleteCommand)
    }
    
    func test_CountCommand() {
        let cmd = try? CommandFactory.createCommand(
            commandName: "COUNT",
            args: ["a value"],
            dataSourceProviding: DataSourceProvider())
        
        XCTAssert(cmd is CountCommand)
    }
    
    func test_BeginCommand() {
        let cmd = try? CommandFactory.createCommand(
            commandName: "BEGIN",
            args: [],
            dataSourceProviding: DataSourceProvider())
        
        XCTAssert(cmd is BeginCommand)
    }
    
    func test_CommitCommand() {
        let cmd = try? CommandFactory.createCommand(
            commandName: "COMMIT",
            args: [],
            dataSourceProviding: DataSourceProvider())
        
        XCTAssert(cmd is CommitCommand)
    }
    
    func test_RollbackCommand() {
        let cmd = try? CommandFactory.createCommand(
            commandName: "ROLLBACK",
            args: [],
            dataSourceProviding: DataSourceProvider())
        
        XCTAssert(cmd is RollbackCommand)
    }
    
    func test_UnsupportedCommand() {
        do {
            let _ = try CommandFactory.createCommand(
                commandName: "Something",
                args: [],
                dataSourceProviding: DataSourceProvider())
        } catch {
            XCTAssert(true)
            return
        }
        XCTFail()
    }
}
