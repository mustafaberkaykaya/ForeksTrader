//
//  StockCellModel.swift
//  UIComponents
//
//  Created by Berkay on 14.01.2023.
//

import Foundation
import UIKit

public protocol StockCellDataSource: AnyObject {
    var stockName: String? { get set }
    var firstCriterionText: String? { get set }
    var secondCriterionText: String? { get set }
    var firstCriterionTextColor: UIColor? { get set }
    var secondCriterionTextColor: UIColor? { get set }
    var clockText: String? { get set }
    var isUpArrowHidden: Bool? { get set }
    var isDownArrowHidden: Bool? { get set }
    var cellBackgroundColor: UIColor? { get set }
    var arrowViewBackgroundColor: UIColor? { get }
}

public protocol StockCellEventSource: AnyObject {
    
}

public protocol StockCellProtocol: StockCellDataSource, StockCellEventSource {
    
}

public final class StockCellModel: StockCellProtocol {
    
    public var stockName: String?
    public var firstCriterionText: String?
    public var secondCriterionText: String?
    public var firstCriterionTextColor: UIColor?
    public var secondCriterionTextColor: UIColor?
    public var clockText: String?
    public var isUpArrowHidden: Bool?
    public var isDownArrowHidden: Bool?
    public var cellBackgroundColor: UIColor?
    
    public init(stockName: String? = nil,
                firstCriterionText: String? = nil,
                secondCriterionText: String? = nil,
                firstCriterionTextColor: UIColor? = .appWhite,
                secondCriterionTextColor: UIColor? = .appWhite,
                clockText: String? = nil,
                isUpArrowHidden: Bool? = nil,
                isDownArrowHidden: Bool? = nil,
                cellBackgroundColor: UIColor? = UIColor.appDark) {
        self.stockName = stockName
        self.firstCriterionText = firstCriterionText
        self.secondCriterionText = secondCriterionText
        self.firstCriterionTextColor = firstCriterionTextColor
        self.secondCriterionTextColor = secondCriterionTextColor
        self.clockText = clockText
        self.isUpArrowHidden = isUpArrowHidden
        self.isDownArrowHidden = isDownArrowHidden
        self.cellBackgroundColor = cellBackgroundColor
    }
    
    public var arrowViewBackgroundColor: UIColor? {
        if isUpArrowHidden == false   {
            return .appPear
        } else if isDownArrowHidden == false {
            return .appCherry
        } else {
            return .appDark
        }
    }
    
}
