//
//  BlackBgView.swift
//  StarTrivia
//
//  Created by Sherif on 1/16/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit

class BlackBgView : UIView {
    
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }
}

class BlackBgButton : UIButton {
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }
}

