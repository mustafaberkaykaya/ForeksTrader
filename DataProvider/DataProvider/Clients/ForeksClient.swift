//
//  ForeksClient.swift
//  DataProvider
//
//  Created by Berkay on 14.01.2023.
//

import Foundation

public enum ForeksAPI : BaseClientGenerator {
    
    // MARK: - Requests
    case fetchStockList
    case fetchStockData(fields: String, stcs: String)
    
    public var scheme: String { "https" }
    
    public var host: String { "sui7963dq6.execute-api.eu-central-1.amazonaws.com"}
    
    // MARK: - PATH
    public var path: String {
        switch self {
        case .fetchStockList:
            return "/default/ForeksMobileInterviewSettings"
        case .fetchStockData(_, _):
            return "/default/ForeksMobileInterview"
        }
    }
    
    //MARK: - Query Items
    public var queryItems: [URLQueryItem]?{
        var items: [URLQueryItem] = []
        switch self {
        case .fetchStockList:
            break
        case .fetchStockData(let fields, let stcs):
            items.append(.init(name: "fields", value: fields))
            items.append(.init(name: "stcs", value: stcs))
        }
        return items
    }
    
    //MARK: - Default GET
    public var method: HttpMethod{
        switch self {
        default:
            return .get
        }
    }
    
    // MARK: - HEADER
    public var header: [HttpHeader]? {
        return [
            .contentType(),
        ]
    }
    
    //MARK: - Default Nil
    public var body: [String : Any]? {
        switch self {
        default:
            return nil
        }
    }
}
