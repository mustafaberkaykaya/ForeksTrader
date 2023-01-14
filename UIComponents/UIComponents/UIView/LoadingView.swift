//
//  LoadingView.swift
//  UIComponents
//
//  Created by Berkay on 14.01.2023.
//

import Foundation
import UIKit
import Lottie
import TinyConstraints

public class LoadingView: UIView {
    
    private var animationView = AnimationView(name: "splashLoading")
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI Layout
extension LoadingView {
    
    private func addSubViews() {
        addAnimationView()
    }
    
    private func addAnimationView() {
        addSubview(animationView)
        animationView.centerInSuperview()
    }
}

// MARK: - Configure
extension LoadingView {
    
    private func configureContents() {
        backgroundColor = .black.withAlphaComponent(0.25)
        configureAnimationView()
    }
    
    private func configureAnimationView() {
        animationView.contentMode = .scaleAspectFit
        animationView.size(.init(width: 300, height: 300))
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.75
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.play()
    }
}
