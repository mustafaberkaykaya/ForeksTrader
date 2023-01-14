//
//  StockData.swift
//  DataProvider
//
//  Created by Berkay on 14.01.2023.
//

import Foundation

public struct StockData: Decodable {
    public let first: [StockFirstData]?
    public let second: String?

    enum CodingKeys: String, CodingKey {
        case first = "l"
        case second = "z"
    }
}
