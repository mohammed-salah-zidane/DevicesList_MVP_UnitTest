//
//  Colors.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/8/20.
//  Copyright © 2020 Zidane. All rights reserved.
//

import UIKit

enum Colors {
    case background
    case darkBlue
    case red
    case cyan
    case whiteRed

    func withAlpha(_ alpha: Double) -> UIColor {
        return self.color.withAlphaComponent(CGFloat(alpha))
    }
    
    var color: UIColor {
        switch self {
        case .background:return #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        case .darkBlue : return #colorLiteral(red: 0.1568627451, green: 0.2078431373, blue: 0.2705882353, alpha: 1)
        case .whiteRed:  return #colorLiteral(red: 0.9333333333, green: 0.5058823529, blue: 0.5098039216, alpha: 1)
        case .cyan:      return #colorLiteral(red: 0.2666666667, green: 0.6745098039, blue: 0.9568627451, alpha: 1)
        case .red:  return #colorLiteral(red: 0.9254901961, green: 0.3921568627, blue: 0.4156862745, alpha: 1)
        }
    }
}
