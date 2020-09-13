//
//  UIViewController+Ex.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/10/20.
//  Copyright © 2020 Zidane. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func loadActivity(_ loading:Bool){
        if loading{
            Activity.startAnimating()
        }else {
            Activity.stopAnimating()
        }
    }
}
