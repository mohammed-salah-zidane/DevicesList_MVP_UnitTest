//
//  AppDelegate.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/8/20.
//  Copyright © 2020 Zidane. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
     
        LibrariesManager.initLibraries(for: application, launchOptions: launchOptions)
        NavigationManager.start()
    
        return true
    }
}

