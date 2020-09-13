//
//  DesignableImageView.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/8/20.
//  Copyright © 2020 Zidane. All rights reserved.
//

import UIKit

@IBDesignable class DesignableImageView: UIImageView {
    
    @IBInspectable var fireShadow: Bool = false
        {
        didSet
        {
            if fireShadow
            {
                layer.cornerRadius = 10
                layer.masksToBounds = false
                layer.shadowColor = shadowColor?.cgColor
                layer.shadowOffset = CGSize(width: 5, height: -10)
                layer.shadowOpacity = 0.1
                layer.shadowPath = UIBezierPath(rect: bounds).cgPath
                clipsToBounds = false
                layer.shadowRadius = 8
                layer.shadowOpacity = 0.1
                layer.masksToBounds = false
            }
            else
            {
                layer.cornerRadius = 0.0
                layer.shadowColor = UIColor.white.cgColor
                layer.shadowOpacity = 0.0
                layer.shadowRadius = 0.0
                layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            }
        }
    }
    
    @IBInspectable
    var circleCorner: Bool
    {
        get {
            return min(bounds.size.height, bounds.size.width) / 2 == cornerRadius
        }
        set {
            cornerRadius = newValue ? min(bounds.size.height, bounds.size.width) / 2 : cornerRadius
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .black {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
}

