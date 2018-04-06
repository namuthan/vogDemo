//
//  StyleSheet.swift
//  VogDemo
//
//  Created by Nabil Muthanna on 2018-04-06.
//  Copyright © 2018 nabilmuthanna. All rights reserved.
//

import UIKit

struct StyleSheet {
    
    static var defaultTheme = Theme.vog
    
    enum Theme {
        case vog
        
        var mainColor: UIColor  {
            switch self {
            case .vog:
                return UIColor.init(colorWithHexValue: 0xF3C76A)
            }
        }
        
        var secondaryColor: UIColor {
            switch self {
            case .vog:
                return UIColor.init(colorWithHexValue: 0x789340)
            }
        }
        
        var backgroundColor: UIColor {
            switch self {
            case .vog:
                return UIColor.white
            }
        }
        
        var contentBackgroundColor: UIColor {
            switch self {
            case .vog:
                return UIColor.init(colorWithHexValue: 0xD4D3D3).withAlphaComponent(0.4)
            }
        }
    }
}
