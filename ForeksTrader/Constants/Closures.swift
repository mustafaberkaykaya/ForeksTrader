//
//  Closures.swift
//  ForeksTrader
//
//  Created by Berkay on 14.01.2023.
//

import Foundation

typealias VoidClosure = (() -> Void)
typealias StringClosure = ((String) -> Void)
typealias IntClosure = ((Int) -> Void)
typealias DoubleClosure = ((Double) -> Void)
typealias AnyClosure<T: Any> = ((T) -> Void)
typealias BoolClosure = ((Bool) -> Void)
