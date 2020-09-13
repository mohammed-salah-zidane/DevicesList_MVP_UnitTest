//
//  ContentItemCell.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/10/20.
//  Copyright © 2020 Zidane. All rights reserved.
//

import UIKit

class ContentItemCell: UITableViewCell {
    
    @IBOutlet weak var serialNumberLbl: UILabel!
    @IBOutlet weak var contenStatusImageView: DesignableImageView!
    @IBOutlet weak var resoucesStatusLbl: DesignableLabel!
    @IBOutlet weak var muteImageView: DesignableImageView!
    @IBOutlet weak var clockImageView: DesignableImageView!
    @IBOutlet weak var callImageView: DesignableImageView!
    @IBOutlet weak var rightImageView: DesignableImageView!
    @IBOutlet weak var subnetMaskLbl: UILabel!
    @IBOutlet weak var ipAddressLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var contentItemImageView: DesignableImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setup(content:Content) {
        self.serialNumberLbl.text = content.serialNum
        self.subnetMaskLbl.text = content.ipSubnetMask
        self.ipAddressLbl.text = content.ipAddress
        self.nameLbl.text = content.name
        self.resoucesStatusLbl.text = content.type?.name
        self.contenStatusImageView.image = content.status?.statusIcon?.Icon()
    }
}
