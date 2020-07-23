//
//  TableViewServiceTests.swift
//  ExerciseTests

import XCTest
@testable import Exercise

class TableViewServiceTests: XCTestCase {

    var service: TableViewService?
    let parsingUtil = ParsingUtilMock()
    
    override func setUp() {
        super.setUp()
        service = TableViewServiceImpl(parser: parsingUtil)
    }

    override func tearDown() {
        service = nil
        super.tearDown()
    }
    
    func testFetchData() {
        service?.fetchData(completion: { (isSucces, model, error) in
            XCTAssertTrue(self.parsingUtil.getJsonFromFileCalled)
        })
    }
}
