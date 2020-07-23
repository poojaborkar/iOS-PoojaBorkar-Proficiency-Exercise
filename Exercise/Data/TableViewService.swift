//
//  TableViewService.swift
//  Exercise

import Foundation
import Alamofire

protocol TableViewService {
    func fetchData(completion: @escaping CompletionHandler)
}

class TableViewServiceImpl: SessionDelegate, TableViewService {
    
    var parser: ParsingUtilProtocol?
    var jsonDecoder = JSONDecoder()
    
    init(parser: ParsingUtilProtocol) {
        super.init()
        self.parser = parser
    }
    
    //Make an API and returns the completion with UI model
    func fetchData(completion: @escaping CompletionHandler) {
        guard let url = URL(string: URLManager.API_URL) else { return }
        
        Alamofire.request(url, method: .get, parameters: nil, headers: APIHeader.getHeader())
            .responseString(completionHandler: { [weak self] (responseString) in
                
                switch responseString.result {
                case .success(let string):
                    print(responseString)
                    do {
                        guard let data = string.data(using: .utf8) else {
                            completion(false, nil, responseString.result.error)
                            return }
                        let response = try self?.jsonDecoder.decode(TableViewDataModel.self, from: data)
                        let uiModel = TableViewMapper.getUIModel(from: response)
                        completion(true, uiModel, nil)
                        
                    } catch let error {
                        completion(false, nil, error as NSError)
                    }
                    
                case .failure(let error):
                    completion(false, nil, error)
                }
            })
    }
}
