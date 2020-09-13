//
//  Environment.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/10/20.
//  Copyright © 2020 Zidane. All rights reserved.
//


import Foundation

enum Environment: String
{
    case development = "development"
    case production = "production"

    var baseURL: String
    {
        switch self
        {
        case .development: return "https://www.mocky.io/v2/"
        case .production: return "https://www.mocky.io/v2/"
        }
    }

}
