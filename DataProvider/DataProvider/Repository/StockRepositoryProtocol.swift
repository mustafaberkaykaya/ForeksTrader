//
//  StockRepositoryProtocol.swift
//  DataProvider
//
//  Created by Berkay on 14.01.2023.
//

import Foundation

public protocol StockRepositoryProtocol {
    func getStocks(completion: @escaping (Result<Stock, ForeksError>) -> Void)
    func getStocksData(fields: String, stcs: String, completion: @escaping (Result<StockData, ForeksError>) -> Void)
}
