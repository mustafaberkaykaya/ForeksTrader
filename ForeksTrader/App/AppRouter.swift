//
//  AppRouter.swift
//  ForeksTrader
//
//  Created by Berkay on 14.01.2023.
//

import UIKit

final class AppRouter {

    var window: UIWindow?

    init() {}
    // swiftlint:disable: all
    func startApplication() {
        guard let window = window else { fatalError("Window value cannot be nil") }
        let viewController = SplashRouter.create()
        window.rootViewController = viewController
    }
}
