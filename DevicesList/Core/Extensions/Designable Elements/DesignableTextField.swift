//
//  DesignableTextField.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/8/20.
//  Copyright © 2020 Zidane. All rights reserved.
//


import UIKit

@IBDesignable class DesignableTextField: UITextField{
    
    //@IBInspectable var SHADOW_COLOR: CGFloat = 155.0 / 255.0
    
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
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightPadding: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    private var _isRightViewVisible: Bool = true
    var isRightViewVisible: Bool {
        get {
            return _isRightViewVisible
        }
        set {
            _isRightViewVisible = newValue
            updateView()
        }
    }
    
    func updateView() {
        setLeftImage(leftImage: leftImage, rightPadding: rightPadding, leftPadding: leftPadding)
        setRightImage(rightImage: rightImage, rightPadding: rightPadding, leftPadding: leftPadding)
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?
            placeholder! :
            "", attributes:[NSAttributedString.Key.foregroundColor: tintColor!])
    }
    
    
    // MARK: - Corner Radius
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}

extension DesignableTextField
{
    
    
    func setBottomLine(color: UIColor?)
    {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: frame.height - 1, width: frame.width, height: 1.0)
        bottomLine.backgroundColor = color?.cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
}

extension UITextField
{
    func setPlaceHolder(text:String,color:UIColor){
        attributedPlaceholder = NSAttributedString(string: text, attributes:[NSAttributedString.Key.font:font as Any])
    }
    func setLeftImage(leftImage:UIImage?,rightPadding:CGFloat,leftPadding:CGFloat) {
        leftViewMode = UITextField.ViewMode.always
        var view: UIView
        
        if let image = leftImage {
            let imageView = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: 20, height: 20))
            imageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = tintColor
            
            var width = imageView.frame.width + leftPadding
            
            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line {
                width += 15
                
            }
            
            view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(imageView)
        } else {
            view = UIView(frame: CGRect(x: 0, y: 0, width: leftPadding, height: 20))
        }
        
        leftView = view
    }
    
    func setRightImage(rightImage:UIImage?,rightPadding:CGFloat,leftPadding:CGFloat) {
        rightViewMode = UITextField.ViewMode.always
        var view: UIView
        
        if let image = rightImage {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = tintColor
            
            var width = imageView.frame.width + rightPadding
            
            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line {
                width += 15
                
            }
            
            view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(imageView)
            
        } else {
            view = UIView(frame: CGRect(x: 0, y: 0, width: rightPadding, height: 20))
        }
        
        rightView = view
    }

}
