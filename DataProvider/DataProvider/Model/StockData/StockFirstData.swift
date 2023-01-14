//
//  StockFirstData.swift
//  DataProvider
//
//  Created by Berkay on 14.01.2023.
//

import Foundation

public struct StockFirstData: Decodable {
    
    public let tke: String?
    public let clo: String?
    public let flo: String?
    public let cei: String?
    public let pdd: String?
    public let low: String?
    public let sel: String?
    public let buy: String?
    public let ddi: String?
    public let hig: String?
    public let las: String?
    public let pdc: String?

    enum CodingKeys: String, CodingKey {
        case tke
        case clo
        case flo
        case cei
        case pdd
        case low
        case sel
        case buy
        case ddi
        case hig
        case las
        case pdc
    }
}

