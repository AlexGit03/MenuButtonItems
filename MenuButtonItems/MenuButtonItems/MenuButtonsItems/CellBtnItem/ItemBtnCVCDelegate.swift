//
//  ItemBtnCVCDelegate.swift
//  UfficioStampa
//
//  Created by Antonio Alessandro Chillura on 06/03/18.
//  Copyright © 2018 Progetto PA. All rights reserved.
//

import UIKit

class ItemBtnCVCDelegate: NSObject {
    
    private var funcDidSelectRowAt:((IndexPath)->Void)?
    private var sectionTableView:Int?
    
    override init() {
        super.init()
    }
}

// MARK: - CLOUSUR
extension ItemBtnCVCDelegate {
    
    // didSelectItemAt
    func didSelectItemAt(completionhandler: @escaping (IndexPath) -> Void, sectionTableView:Int) {
        funcDidSelectRowAt = completionhandler
        self.sectionTableView = sectionTableView
    }
}

// MARK: - UICollectionViewDelegate
extension ItemBtnCVCDelegate: UICollectionViewDelegate {
    
    // Select cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var indexPathCell = indexPath
        if let sectionTableView = sectionTableView { indexPathCell.section = sectionTableView }
        funcDidSelectRowAt?(indexPathCell)
    }
    
    //Use for size
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize.init(width: collectionView.frame.size.height, height: collectionView.frame.size.height)
    }
    
    //Use for interspacing
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1.0
    }
}
