//
//  ItemBtnCVC.swift
//  MenuButtonItems
//
//  Created by Antonio Alessandro Chillura on 07/05/18.
//  Copyright © 2018 Antonio Alessandro Chillura. All rights reserved.
//

import UIKit

class ItemBtnCVC: UICollectionViewCell {
    
    static let identifieldCell = "ItemBtnCVC"
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var imageBtn: UIImageView!
    @IBOutlet weak var textlbl: UILabel!
    
    var model:ItemBtnModel? {
        didSet {
            configureCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell() {
        self.imageBtn.image = UIImage.init(named: model?.nameImageView ?? "")
        self.textlbl.text = model?.text
        self.viewContainer.backgroundColor = model?.colorViewContainer
        
        guard let model = model else {
            return
        }
        
        if model.isCircle {
            self.viewContainer.layer.cornerRadius = self.viewContainer.frame.height / 2
        }
        
        if let cornerRadius = model.cornerRadiusView {
            self.viewContainer.layer.cornerRadius = cornerRadius
        }
    }

}
