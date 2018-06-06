//
//  ViewController.swift
//  Demo
//
//  Created by Antonio Alessandro Chillura on 06/06/18.
//  Copyright © 2018 Antonio Alessandro Chillura. All rights reserved.
//

import UIKit
import MenuButtonItems

class ViewController: UIViewController {
    
    @IBOutlet weak var menuXib: MenuButtonItemsXib!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuXib.setSateMenuItem { (isStateSelected) in
            if !isStateSelected {
                self.stateNotSelectedState()
            } else {
                self.stateSelectedState()
            }
        }
        
    }
    
    /*****MENU****/
    //Load Menu
    func stateNotSelectedState() {
        
        // menu
        let customiz = MenuButtonItemsXib.CastomizedView.init(colorBackgroundView: UIColor.blue, isCircleView: true, cornerRadiusView: nil)
        let menuBtn = MenuButtonItemsXib.ModelItem.init(imageName: "4BO1431-sleutel-30", textBtn: nil, castomizedView: customiz)
        
        // lens
        let customizlens = MenuButtonItemsXib.CastomizedView.init(colorBackgroundView: UIColor.blue, isCircleView: true, cornerRadiusView: nil)
        let lensBtn = MenuButtonItemsXib.ModelItem.init(imageName: "4BO1431-sleutel-30", textBtn: nil, castomizedView: customizlens)
        
        menuXib.setMenuModel(menuBtn: menuBtn, items: [lensBtn]) { (index) in
            print(index)
        }
        
    }
    
    func stateSelectedState() {
        
        // menu
        let customiz = MenuButtonItemsXib.CastomizedView.init(colorBackgroundView: UIColor.blue, isCircleView: true, cornerRadiusView: nil)
        let menuBtn = MenuButtonItemsXib.ModelItem.init(imageName: "4BO1431-sleutel-30", textBtn: nil, castomizedView: customiz)
        
        menuXib.setMenuModel(menuBtn: menuBtn, items: []) { (index) in
            print(index)
        }
        
    }

}

