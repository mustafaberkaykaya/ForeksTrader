//
//  AppContainer.swift
//  ForeksTrader
//
//  Created by Berkay on 14.01.2023.
//

import Foundation
import DataProvider

let app = AppContainer()

final class AppContainer {

    let router = AppRouter()
    let foreksService: ForeksServiceProtocol = ForeksService()
}
