//
//  StatusModel.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/11/20.
//  Copyright © 2020 Zidane. All rights reserved.
//

import UIKit
// MARK: - Status
struct Status: Codable {
    var id: Int?
    var statusValue, legacyValue: String?
    var statusIcon:StatusIcon?{
        return StatusIcon(rawValue: id ?? 1)
    }
}

enum StatusIcon :Int,Codable{
    
    case one
    case two
    case three
    case four
    
    func Icon() -> UIImage {
        
        switch self {
        case .one :
            return #imageLiteral(resourceName: "green")
        case .two :
            return #imageLiteral(resourceName: "orange")
        case .three :
            return #imageLiteral(resourceName: "yellow")
        case .four :
            return  #imageLiteral(resourceName: "red")
        }
    }
    
}
