//
//  UISearchBar+Ex.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/10/20.
//  Copyright © 2020 Zidane. All rights reserved.
//

import Foundation
import UIKit

extension UISearchBar {
    
    var textField: UITextField? {
        if #available(iOS 13.0, *) {
            return searchTextField
        }
        let subViews = subviews.flatMap { $0.subviews }
        return (subViews.filter { $0 is UITextField }).first as? UITextField
    }
    
    func setCenteredPlaceHolder(){
        let searchBarWidth = self.frame.width
        let placeHolderWidth = textField?.attributedPlaceholder?.size().width
        let offsetIconToPlaceholder: CGFloat = 8
        let offset = UIOffset(horizontal: ((searchBarWidth / 2) - (placeHolderWidth! / 2) - offsetIconToPlaceholder), vertical: 0)
        self.setPositionAdjustment(offset, for: .search)
    }
    
   
}
