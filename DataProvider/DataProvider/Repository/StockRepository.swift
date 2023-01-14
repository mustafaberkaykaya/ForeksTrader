//
//  StockRepository.swift
//  DataProvider
//
//  Created by Berkay on 14.01.2023.
//

import Foundation

final public class StockRepository: StockRepositoryProtocol {
    
    private var foreksService : ForeksServiceProtocol
    
    //MARK: - Inject OmdbServiceProtocol
    public init(foreksService : ForeksServiceProtocol) {
        self.foreksService = foreksService
    }
    
    public func getStocks(completion: @escaping (Result<Stock, ForeksError>) -> Void) {
        foreksService.getStocks { result in
            switch result {
            case .success(let getStockResponse):
                return completion(.success(getStockResponse))
            case .failure(let error):
                return completion(.failure(ForeksError(message: error.localizedDescription)))
            }
        }
    }
    
    public func getStocksData(fields: String, stcs: String, completion: @escaping (Result<StockData, ForeksError>) -> Void) {
        foreksService.getStocksData(field: fields, stcs: stcs) { result in
            switch result {
            case .success(let stockData):
                return completion(.success(stockData))
            case .failure(let error):
                return completion(.failure(ForeksError(message: error.localizedDescription)))
            }
        }
    }
}


