//
//  LibrariesManger.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/10/20.
//  Copyright © 2020 Zidane. All rights reserved.
//


import IQKeyboardManagerSwift
import UIKit
import Nuke
class LibrariesManager {
    
    private init() { }
    
    static func initLibraries(for application: UIApplication,
                              launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) {
        //IQKeyboard Manager
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true

        UIApplication.shared.isStatusBarHidden = true // for status bar hide
        
        NotifiyMessage.shared.configNotify()

        DataLoader.sharedUrlCache.diskCapacity = 0
        let pipeline = ImagePipeline {
            guard let dataCache = try? DataCache(name: "com.zidane.MobileNoc") else {return}
            dataCache.sizeLimit = 200 * 1024 * 1024
            $0.dataCache = dataCache
        }
        ImagePipeline.shared = pipeline
    }
}
