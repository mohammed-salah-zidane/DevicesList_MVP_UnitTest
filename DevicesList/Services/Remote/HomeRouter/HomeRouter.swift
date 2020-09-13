//
//  HomeRouter.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/10/20.
//  Copyright © 2020 Zidane. All rights reserved.
//

import Moya

enum HomeRouter {
    
    case fetchHomeContent
}

extension HomeRouter: TargetType {
    
    var baseURL: URL {
        return URL(string: Environment.production.baseURL )!
    }
    
    var path: String {
        
        switch self {
        case .fetchHomeContent:
            return "5c5c46f13900005a18e05b90"
        }
        
    }
    
    var method: Method {
        
        switch self {
        case .fetchHomeContent:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self
        {
        default:
            return Data()
        }
    }
    
    var task: Task {
        
        switch self
        {
        case .fetchHomeContent:  return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
