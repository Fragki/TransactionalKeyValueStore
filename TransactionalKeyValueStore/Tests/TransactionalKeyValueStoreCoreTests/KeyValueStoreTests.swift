import Foundation

import XCTest
import TransactionalKeyValueStoreCore

final class KeyValueStoreTests: XCTestCase {
    
    func testGetValue_WhenKeyIsNotSaved_ReturnsNil() {
        let sut = KeyValueStore()
        
        XCTAssertNil(sut.getValue(for: "key"))
    }
    
    func testSetValue_WhenKeyIsNotSaved() {
        let sut = KeyValueStore()
        
        sut.setValue("100", for: "key")
        
        let result = sut.getValue(for: "key")
        XCTAssertEqual(result, "100")
    }
    
    func testSetValue_WhenKeyIsSaved_UpdatesValue() {
        let sut = KeyValueStore()
        sut.setValue("100", for: "key")
        
        sut.setValue("150", for: "key")
        
        let result = sut.getValue(for: "key")
        XCTAssertEqual(result, "150")
    }
    
    func testDeletetValue() {
        let sut = KeyValueStore()
        sut.setValue("100", for: "key")
        
        sut.deleteEntry(for: "key")
        
        XCTAssertNil(sut.getValue(for: "key"))
    }
    
    func testMultipleKeys() {
        let sut = KeyValueStore()
        sut.setValue("100", for: "key")
        sut.setValue("150", for: "key2")
        
        let result = sut.getValue(for: "key")
        XCTAssertEqual(result, "100")
    }
    
    func testGetCount_WhenValueIsNotSaved() {
        let sut = KeyValueStore()
        
        XCTAssertEqual(sut.getCount(for: "100"), 0)
    }
    
    func testGetCount_WhenValueIsSaved() {
        let sut = KeyValueStore()
        sut.setValue("100", for: "key")

        XCTAssertEqual(sut.getCount(for: "100"), 1)
    }
    
    func testGetCount_WhenValueIsSavedMultipleTimes() {
        let sut = KeyValueStore()
        sut.setValue("100", for: "key")
        sut.setValue("100", for: "key2")

        XCTAssertEqual(sut.getCount(for: "100"), 2)
    }
}
