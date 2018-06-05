//
//  NSObject+Extension.swift
//  VBC
//
//  Created by Alessandro Manilii on 24/07/17.
//  Copyright © 2017 Vitale Barberis Canonico. All rights reserved.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
