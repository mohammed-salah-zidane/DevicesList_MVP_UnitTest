//
//  NavigationManager.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/10/20.
//  Copyright © 2020 Zidane. All rights reserved.
//

import Foundation
import UIKit

class NavigationManager
{
    static let window :UIWindow = UIWindow(frame: UIScreen.main.bounds)
    private static var viewController : UIViewController? {
        return UIApplication.getTopViewController()
    }
    
    static func start()
    {
        showHome()
    }
    
//    static func showSplash(){
//        let splashVC = SplachVC.instantiate(storyboard: .home)
//        window.rootViewController = splashVC
//        window.makeKeyAndVisible()
//    }
    static func showHome()
    {
        let homeVC = HomeVC.instantiate(storyboard: .main)
        window.rootViewController = homeVC
        window.makeKeyAndVisible()
    }
    
    
}
