//
//  TableViewConfigurator.swift
//  Exercise

import Foundation

protocol TableViewConfigurator {
    func configure(view: TableContainerView)
}

class TableViewConfiguratorImpl: TableViewConfigurator {
    //Configures/Inject required object to presenter
    func configure(view: TableContainerView) {
        let useCase = TableViewUseCaseImpl(service: TableViewServiceImpl(parser: ParsingUtil()))
        let presenter = TableViewPresenterImpl(view: view, useCase: useCase)
        view.attachPresenter(presenter: presenter)
    }
}
