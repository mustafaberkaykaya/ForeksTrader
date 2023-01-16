//
//  Stock.swift
//  DataProvider
//
//  Created by Berkay on 14.01.2023.
//

import Foundation

public struct Stock: Decodable {
    public let myPageDefaults: [MyPageDefaultsData]?
    public let myPage: [MyPageData]?

    enum CodingKeys: String, CodingKey {
        case myPageDefaults = "mypageDefaults"
        case myPage = "mypage"
    }
}
