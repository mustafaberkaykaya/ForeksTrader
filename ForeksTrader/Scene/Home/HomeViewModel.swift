//
//  HomeViewModel.swift
//  ForeksTrader
//
//  Created by Berkay on 14.01.2023.
//

import Foundation
import DataProvider
import UIComponents

protocol HomeViewDataSource {
    var numberOfRowsInSection: Int { get }
    
    func cellForRowAt(indexPath: IndexPath) -> StockCellProtocol
}

protocol HomeViewEventSource {}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {}

final class HomeViewModel: BaseViewModel, HomeViewProtocol {
    
    // Privates
    private var items: [StockCellProtocol] = [StockCellModel(stockName: "deneme")]
    
    // DataSource
    var stockRepository: StockRepositoryProtocol
    var numberOfRowsInSection: Int {
        return 1
    }

    init(stockRepository: StockRepositoryProtocol) {
        self.stockRepository = stockRepository
    }
    
    func cellForRowAt(indexPath: IndexPath) -> StockCellProtocol {
        return items[indexPath.row]
    }
}
