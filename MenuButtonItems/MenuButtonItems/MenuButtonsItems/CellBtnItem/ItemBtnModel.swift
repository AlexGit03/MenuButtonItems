//
//  ItemBtnModel.swift
//  MenuButtonItems
//
//  Created by Antonio Alessandro Chillura on 07/05/18.
//  Copyright © 2018 Antonio Alessandro Chillura. All rights reserved.
//

import UIKit

struct ItemBtnModel {
    
    var colorViewContainer:UIColor?
    var nameImageView:String?
    var cornerRadiusView:CGFloat?
    var isCircle:Bool = false
    var text:String?
    var obj:Any?
    
    init(nameImageView:String, text:String?) {
        self.nameImageView = nameImageView
        self.text = text
    }
    
    init(nameImageView:String, text:String?, colorViewContainer:UIColor) {
        self.nameImageView = nameImageView
        self.text = text
        self.colorViewContainer = colorViewContainer
    }
    
}
