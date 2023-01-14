//
//  MyPageData.swift
//  DataProvider
//
//  Created by Berkay on 14.01.2023.
//

import Foundation

public struct MyPageData: Decodable {
    public let name: String?
    public let key: String?

    enum CodingKeys: String, CodingKey {
        case name
        case key
    }
}
