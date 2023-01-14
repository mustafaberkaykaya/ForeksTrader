//
//  HomeRouter.swift
//  ForeksTrader
//
//  Created by Berkay on 14.01.2023.
//

import DataProvider

final class HomeRouter {

    static func create() -> HomeViewController {
        let stockRepository = StockRepository(foreksService: app.foreksService)
        let viewModel = HomeViewModel(stockRepository: stockRepository)
        let viewController = HomeViewController(viewModel: viewModel)
        return viewController
    }
}
