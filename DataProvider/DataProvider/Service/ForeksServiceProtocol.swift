//
//  ForeksServiceProtocol.swift
//  DataProvider
//
//  Created by Berkay on 14.01.2023.
//

import Foundation

public protocol ForeksServiceProtocol {
    func getStocks(completion: @escaping (Result<Stock, NetworkError>) -> Void)
    func getStocksData(field: String, stcs: String, completion: @escaping (Result<StockData, NetworkError>) -> Void)
}
