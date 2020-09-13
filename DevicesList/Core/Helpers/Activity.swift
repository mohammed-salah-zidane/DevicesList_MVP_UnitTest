//
//  Indicator.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/10/20.
//  Copyright © 2020 Zidane. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
//* use this activityActionsDelegate if thier a kind of animation in viewController if the app is loading
public protocol ActivitayActionsDelegate: class {
    static func startAnimating(withBackGround:Bool)
    static func stopAnimating()
}

final class Activity: NSObject, ActivitayActionsDelegate {
    
    private static let restorationIdentifier: String = "NVActivityIndicator"
    private static var keyWindow: UIView? {
        get {
            guard let keywindow = UIApplication.getTopViewController()?.view else { return nil}
            return keywindow
        }
    }
    
    static func startAnimating(withBackGround:Bool = false) {
        Activity.stopAnimating()
        guard let keyWindow = keyWindow else { return }
        let loaderView = DesignableView()
        loaderView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        loaderView.cornerRadius = 10
        
        if withBackGround{
            loaderView.backgroundColor = .white
        }
        let activity = NVActivityIndicatorView(frame: CGRect(x: UIScreen.main.bounds.width / 2 ,
                                                             y: UIScreen.main.bounds.height / 2,
                                                             width: 50,
                                                             height: 50),
                                               type: .ballClipRotatePulse,
                                               color: Colors.darkBlue.color,
                                               padding: 0.0)
        
        activity.center = loaderView.center
        loaderView.center = keyWindow.center
        loaderView.restorationIdentifier = restorationIdentifier
        loaderView.addSubview(activity)
        keyWindow.addSubview(loaderView)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            keyWindow.bringSubviewToFront(loaderView)
        }
        activity.startAnimating()
        
    }
    
    static func stopAnimating() {
        guard let keyWindow = keyWindow else { return }
        
        for item in keyWindow.subviews
            where item.restorationIdentifier == restorationIdentifier {
                item.removeFromSuperview()
        }
    }
}
