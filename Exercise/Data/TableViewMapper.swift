//
//  TableViewMapper.swift
//  Exercise

import Foundation

class TableViewMapper {
    
    //Maps the response object with UI Model
    static func getUIModel(from responseModel: TableViewDataModel?) -> TableViewUIModel {
        
        var tableViewUIModel = TableViewUIModel()
        guard let response = responseModel, let rows = response.rows  else {
            return tableViewUIModel
        }
        
        tableViewUIModel.navigationTitle = response.title
        tableViewUIModel.tableViewRow = [TableViewRowUIModel]()
        for model in rows {
            var uiResponseModel = TableViewRowUIModel()
            uiResponseModel.title = model.title
            uiResponseModel.imageUrl = model.imageHref
            uiResponseModel.description = model.description
            
            tableViewUIModel.tableViewRow?.append(uiResponseModel)
        }
        
        return tableViewUIModel
    }
}
