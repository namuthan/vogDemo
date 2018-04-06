//
//  RoundedButton.swift
//  VogDemo
//
//  Created by Nabil Muthanna on 2018-04-06.
//  Copyright © 2018 nabilmuthanna. All rights reserved.
//

import UIKit

class RoundedButton: UIButton, Shakeable {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.height / 2.0
        layer.masksToBounds = true
    }
    
}
