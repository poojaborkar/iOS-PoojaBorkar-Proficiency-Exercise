//
//  TableViewUseCaseMock.swift
//  ExerciseTests

import Foundation
@testable import Exercise

class TableViewUseCaseMock: TableViewUseCase {
    var fetchDataCalled = false
    var service: TableViewService
    
    required init(service: TableViewService) {
        self.service = service
    }
    
    func fetchData(completion: @escaping CompletionHandler) {
        fetchDataCalled = true
        service.fetchData(completion: completion)
    }
}
