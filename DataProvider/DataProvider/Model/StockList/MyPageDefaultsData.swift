//
//  MyPageDefaultsData.swift
//  DataProvider
//
//  Created by Berkay on 14.01.2023.
//

import Foundation

public struct MyPageDefaultsData: Decodable, Equatable {
    public let cod: String?
    public let gro: String?
    public let tke: String?
    public let def: String?

    enum CodingKeys: String, CodingKey {
        case cod
        case gro
        case tke
        case def
    }
    
    public static func == (lhs: MyPageDefaultsData, rhs: MyPageDefaultsData) -> Bool {
         return lhs.cod == rhs.cod && lhs.gro == rhs.gro && lhs.tke == rhs.tke && lhs.def == rhs.def
     }
}
