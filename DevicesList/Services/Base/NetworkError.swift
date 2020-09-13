//
//  NetworkError.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/10/20.
//  Copyright © 2020 Zidane. All rights reserved.
//


import Foundation

extension Error
{
    var code: Int { return (self as NSError).code }
    var domain: String { return (self as NSError).domain }
}

public enum NetworkError: Error
{
    case badJSON
    case noConnection
    case noData
    case notAuthenticated
    case forbidden
    case notFound
    case serverError
    case timeout
    case conflict
    case unknownError
    case parsingJSONError
        
    init(_ error: Error)
    {
        let error: NSError = error as NSError
        if error.domain == NSURLErrorDomain
        {
            switch error.code
            {
            case NSURLErrorTimedOut:
                self = .timeout
            case NSURLErrorResourceUnavailable:
                self = .noData
            case NSURLErrorUserAuthenticationRequired:
                self = .notAuthenticated
            case NSURLErrorBadURL:
                self = .notFound
            case NSURLErrorNotConnectedToInternet:
                self = .noConnection
            case NSURLErrorCannotDecodeRawData, NSURLErrorCannotDecodeContentData, NSURLErrorCannotParseResponse:
                self = .parsingJSONError
            default:
                self = .unknownError
            }
            return
        }
        
        self = .unknownError
    }
    
    init(_ statusCode: Int)
    {
        switch statusCode
        {
        case 400:
            self = .serverError
        case 401:
            self = .notAuthenticated
        case 403:
            self = .forbidden
        case 404:
            self = .notFound
        case 409:
            self = .conflict
        case 500:
            self = .serverError
        default:
            self = .unknownError
        }
    }
}

extension NetworkError: LocalizedError
{
    public var errorDescription: String?
    {
        switch self
        {
        case .badJSON:
            return "The data from the server is dammeged"
            
        case .noConnection:
            return "Please check your internet connection and try again"
            
        case .timeout:
            return "It took us too long to load the data, please try again later"
            
        case .notAuthenticated, .forbidden:
            let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? ""
            return NSLocalizedString("please check your authorization with ", comment: "") + appName
            
        case .noData:
            let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? ""
            return NSLocalizedString("can not get data from \(appName) server", comment: "")
            
        case .notFound:
            return NSLocalizedString("seemes That your connection request un-avaliable link", comment: "")
            
        case .serverError:
            return NSLocalizedString("server error", comment: "")
        
        case .conflict:
            return NSLocalizedString("server conflict error", comment: "")
       
        case .parsingJSONError:
            return "CHECK YOUR MODEL KEYS AND VALUES"
       
        default:
            return NSLocalizedString("There is something wrong please try again later", comment: "")
        }
    }
}

public enum APIError
{
    case internetError(String)
    case serverMessage(String)
}
