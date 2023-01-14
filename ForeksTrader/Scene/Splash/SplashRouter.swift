//
//  SplashRouter.swift
//  ForeksTrader
//
//  Created by Berkay on 14.01.2023.
//

final class SplashRouter {
    
    static func create() -> SplashViewController {
        let viewModel = SplashViewModel()
        let viewController = SplashViewController(viewModel: viewModel)
        viewModel.routeDelegate = viewController
        return viewController
    }
}
