//
//  HomeViewModel.swift
//  ForeksTrader
//
//  Created by Berkay on 14.01.2023.
//

import Foundation
import DataProvider


protocol HomeViewDataSource {}

protocol HomeViewEventSource {}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {}

final class HomeViewModel: BaseViewModel, HomeViewProtocol {
    
    // DataSource
    var stockRepository: StockRepositoryProtocol

    public init(stockRepository: StockRepositoryProtocol) {
        self.stockRepository = stockRepository
    }
    
}

