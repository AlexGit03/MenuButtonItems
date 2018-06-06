//
//  ItemBtnCVCDelegate.swift
//  UfficioStampa
//
//  Created by Antonio Alessandro Chillura on 06/03/18.
//  Copyright © 2018 Progetto PA. All rights reserved.
//

import UIKit

public class ItemBtnCVCDelegate: NSObject, UICollectionViewDelegate {
    
    var funcDidSelectRowAt:((IndexPath)->Void)?
    var sectionTableView:Int?
    
    override public init() {
        super.init()
    }
    
    // didSelectItemAt
    public func didSelectItemAt(completionhandler: @escaping (IndexPath) -> Void, sectionTableViewA:Int) {
        self.funcDidSelectRowAt = completionhandler
        self.sectionTableView = sectionTableViewA
    }
    
    // MARK: - UICollectionViewDelegate
    
    // Select cell
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var indexPathCell = indexPath
        if let sectionTableView = self.sectionTableView { indexPathCell.section = sectionTableView }
        self.funcDidSelectRowAt?(indexPathCell)
    }
    
    //Use for size
    public func collectionView(collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize.init(width: collectionView.frame.size.height, height: collectionView.frame.size.height)
    }
    
    //Use for interspacing
    public func collectionView(collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1.0
    }
    
    public func collectionView(collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1.0
    }
}
