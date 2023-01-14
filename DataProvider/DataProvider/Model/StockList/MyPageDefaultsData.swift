//
//  MyPageDefaultsData.swift
//  DataProvider
//
//  Created by Berkay on 14.01.2023.
//

import Foundation

public struct MyPageDefaultsData: Decodable {
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
}
