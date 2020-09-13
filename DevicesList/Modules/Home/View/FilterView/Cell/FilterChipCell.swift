//
// Created by Apple on 30/08/2020.
// Copyright (c) 2020 Usman Shahid. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialChips

class FilterChipCell: MDCChipCollectionViewCell {
    
    func setup(item:FilterItem) {
        chipView.titleLabel.text = item.name
        chipView.setTitleColor(.white, for: .selected)
        chipView.setTitleColor(.gray, for: .normal)
        chipView.setBackgroundColor(Colors.cyan.color, for: .selected)
        chipView.setBackgroundColor(.white, for: .normal)
        chipView.setBorderWidth(1, for: .normal)
        chipView.setBorderWidth(0, for: .selected)
        chipView.setBorderColor(Colors.background.color, for: .normal)
        chipView.titleFont = UIFont.systemFont(ofSize: 10)
        
        if let icon = item.icon {
            chipView.imageView.image = icon
        }
        chipView.centerVisibleArea = true
        chipView.invalidateIntrinsicContentSize()
    }
}
