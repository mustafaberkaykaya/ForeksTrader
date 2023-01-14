//
//  StockCellModel.swift
//  UIComponents
//
//  Created by Berkay on 14.01.2023.
//

import Foundation

public protocol StockCellDataSource: AnyObject {
    var stockName: String? { get set }
}

public protocol StockCellEventSource: AnyObject {
    
}

public protocol StockCellProtocol: StockCellDataSource, StockCellEventSource {
    
}

public final class StockCellModel: StockCellProtocol {
    
    public var stockName: String?
    
    public init(stockName: String?) {
        self.stockName = stockName
    }
    
}
