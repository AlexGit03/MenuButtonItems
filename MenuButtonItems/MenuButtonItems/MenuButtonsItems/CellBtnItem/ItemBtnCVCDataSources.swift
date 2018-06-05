//
//  ItemBtnCVCDataSources.swift
//  UfficioStampa
//
//  Created by Antonio Alessandro Chillura on 06/03/18.
//  Copyright © 2018 Progetto PA. All rights reserved.
//

import UIKit

class ItemBtnCVCDataSources: NSObject {
    
    var dataSource:[ItemBtnModel]!
    
    init(dataSource:[ItemBtnModel]) {
        self.dataSource = dataSource
        super.init()
    }
    
}

extension ItemBtnCVCDataSources:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemBtnCVC.identifieldCell, for: indexPath) as! ItemBtnCVC
        
        cell.model = dataSource[indexPath.row]
        
        return cell
    }
    
    
}
