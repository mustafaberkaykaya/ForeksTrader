//
//  NetworkError.swift
//  DataProvider
//
//  Created by Berkay on 14.01.2023.
//

import Foundation

public enum NetworkError : Error, LocalizedError{
    case invalidURL
    case request(statusCode : Int,data : Data?)
    case badRequest
    case decodeError
    case noInternet
    case noResponse
    case responseConvert
    case noData
}

