//
//  TableViewUseCaseTests.swift
//  ExerciseTests

import XCTest
@testable import Exercise

class TableViewUseCaseTests: XCTestCase {

    var useCase: TableViewUseCase?
    
    override func setUp() {
        super.setUp()
        let service = TableViewServiceMock()
        useCase = TableViewUseCaseImpl(service: service)
    }

    override func tearDown() {
        useCase = nil
        super.tearDown()
    }
    
    func testFetchData() {
        let expectation = self.expectation(description: "FetchData: FetchData")
        useCase?.fetchData(completion: { (isSucces, model, error) in
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 0.5, handler: nil)
    }
}
