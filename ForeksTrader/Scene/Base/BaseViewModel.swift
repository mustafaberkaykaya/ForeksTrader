//
//  BaseViewModel.swift
//  ForeksTrader
//
//  Created by Berkay on 14.01.2023.
//

import Foundation

protocol BaseViewModelDataSource: AnyObject {
}

protocol BaseViewModelEventSource: AnyObject {
    
    var showLoading: VoidClosure? { get set }
    var hideLoading: VoidClosure? { get set }
}

protocol BaseViewModelProtocol: BaseViewModelDataSource, BaseViewModelEventSource {
}

class BaseViewModel: BaseViewModelProtocol {
    
    // MARK: - Loading
    var showLoading: VoidClosure?
    var hideLoading: VoidClosure?
                
    #if DEBUG || DEVELOP
    deinit {
        debugPrint("deinit \(self)")
    }
    #endif
}
