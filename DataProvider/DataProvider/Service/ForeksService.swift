//
//  ForeksService.swift
//  DataProvider
//
//  Created by Berkay on 14.01.2023.
//

import Foundation

final public class ForeksService: ForeksServiceProtocol {
    
    
    public init() {
        
    }
    
    public func getStocks(completion: @escaping (Result<Stock, NetworkError>) -> Void) {
        NetworkExecuter.shared.execute(route: ForeksAPI.fetchStockList, responseModel: Stock.self, completion: completion)
    }
    
    public func getStocksData(field: String, stcs: String, completion: @escaping (Result<StockData, NetworkError>) -> Void) {
        NetworkExecuter.shared.execute(
            route: ForeksAPI.fetchStockData(fields: field, stcs: stcs),
            responseModel: StockData.self,
            completion: completion)
    }
}

