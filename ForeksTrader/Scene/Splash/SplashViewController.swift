//
//  SplashViewController.swift
//  ForeksTrader
//
//  Created by Berkay on 14.01.2023.
//

import UIKit
import TinyConstraints

final class SplashViewController: BaseViewController<SplashViewModel> {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .interBold14
        label.textColor = .appWhite
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        subscribeViewModel()
        viewModel.viewDidLoad()
    }
}

// MARK: - UI Layout
extension SplashViewController {
    
    private func addSubViews() {
        addTitleLabel()
    }
    
    private func addTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.centerInSuperview()
    }
}

// MARK: - SubscribeViewModel
extension SplashViewController {
    
    private func subscribeViewModel() {
        viewModel.updateTitle = { [weak self] text in
            guard let self = self else { return }
            self.titleLabel.text = text
        }
    }
}

// MARK: - RouteDelegate
extension SplashViewController: SplashViewRouteDelegate {
    
    func showHome() {
        guard let window = app.router.window else { return }
        let homeViewController = HomeRouter.create()
        UIView.transition(with: window, duration: 1, options: .transitionFlipFromBottom, animations: {
            UIView.performWithoutAnimation {
                window.rootViewController = homeViewController
            }
        }, completion: nil)
    }
}
