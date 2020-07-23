//
//  TableViewServiceMock.swift
//  ExerciseTests

import Foundation
@testable import Exercise

class TableViewServiceMock: TableViewService {
    var fetchDataCalled = false
    
    func fetchData(completion: (Bool, TableViewUIModel?, Error?) -> Void) {
        fetchDataCalled = true
        let parseUtil = ParsingUtil()
        
        if let json = parseUtil.getJsonFromFile(fileName: JsonFileName.response.rawValue, bundle: Bundle(for: type(of: self))) {
            guard let jsonData = json.data(using: .utf8) else {return}
            
            let (response, error, _) = parseUtil.deserialization(TableViewDataModel.self, from: jsonData)
            if let response = response {
                let uiModel = TableViewMapper.getUIModel(from: response)
                completion(true, uiModel, nil)
            } else if let error = error {
                completion(false, nil, error)
            }
        }
    }
}
