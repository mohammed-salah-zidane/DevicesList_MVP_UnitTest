//
//  NetworkBase.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/10/20.
//  Copyright © 2020 Zidane. All rights reserved.
//


import Foundation
import Moya
import Result

protocol NetworkBase:class {
    
    func validate(_ response: Response, success: (() -> ()), failure: ErrorCallBack)
}

extension NetworkBase{
    
    func validate(_ response: Response, success: (() -> ()), failure: ErrorCallBack) {
        let code = response.statusCode
        if (200...299).contains(code){
            success()
        }else {
           failure(NetworkError(code).errorDescription ?? "")
        }
        
    }
    
    func process<T:Codable>(_ response: Response, success: ((T) -> ()), failure: ErrorCallBack) {
            }
    
}
