//
//  SplashViewModel.swift
//  ForeksTrader
//
//  Created by Berkay on 14.01.2023.
//

import Foundation
import Alamofire
import UIComponents

protocol SplashViewDataSource {
    var routeDelegate: SplashViewRouteDelegate? { get set }
}

protocol SplashViewEventSource {
    var updateTitle: AnyClosure<String?>? { get set }
}

protocol SplashViewRouteDelegate: AnyObject {
    func showHome()
}

protocol SplashViewProtocol: SplashViewDataSource, SplashViewEventSource {
    func viewDidLoad()
}

final class SplashViewModel: BaseViewModel, SplashViewProtocol {

    // EventSource
    var updateTitle: AnyClosure<String?>?
    
    // DataSource
    weak var routeDelegate: SplashViewRouteDelegate?
    
    func viewDidLoad() {
        if  NetworkReachabilityManager()?.isReachable ?? false {
            self.showLoading?()
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
                guard let self = self else { return }
                self.routeDelegate?.showHome()
            }
        } else {
            updateTitle?(L10n.Splash.nonWifi)
        }
    }
}
