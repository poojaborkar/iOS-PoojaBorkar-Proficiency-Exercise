//
//  TableContainerViewMock.swift
//  ExerciseTests

import Foundation
@testable import Exercise

class TableContainerViewMock: TableContainerView {
    var initialSetupCalled = false
    var reloadTableViewCalled = false
    var attachPresenterCalled = false
    
    func initialSetup() {
        initialSetupCalled = true
    }
    
    func reloadTableView() {
        reloadTableViewCalled = true
    }
    
    func attachPresenter(presenter: TableViewPresenter) {
        attachPresenterCalled = true
    }
}
