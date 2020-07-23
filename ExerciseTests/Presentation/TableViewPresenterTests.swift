//
//  TableViewPresenterTests.swift
//  ExerciseTests

import XCTest
@testable import Exercise

class TableViewPresenterTests: XCTestCase {
    var presenter: TableViewPresenter?
    let view = TableContainerViewMock()
    
    override func setUp() {
        super.setUp()
        let useCase =  TableViewUseCaseImpl(service: TableViewServiceMock())
        presenter = TableViewPresenterImpl(view: view, useCase: useCase)
    }

    override func tearDown() {
        presenter = nil
        super.tearDown()
    }
    
    func testInitialSetup() {
        presenter?.initialSetup()
        XCTAssertTrue(view.initialSetupCalled)
    }
    
    func testTableViewRows() {
        presenter?.initialSetup()
        let rows = presenter?.tableView(numberOfRowsInSection: 0)
        XCTAssertNotNil(rows)
    }
    
    func testReloadTable() {
        presenter?.initialSetup()
        let model = presenter?.getCellMode(atIndexPath: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(model)
    }
    
    func testGetNavigationTitle() {
        presenter?.initialSetup()
        let title = presenter?.getNavigationTitle()
        XCTAssertNotNil(title)
    }
    
    func testFetchData() {
        presenter?.fetchData()
        XCTAssertTrue(view.reloadTableViewCalled)
    }
}
