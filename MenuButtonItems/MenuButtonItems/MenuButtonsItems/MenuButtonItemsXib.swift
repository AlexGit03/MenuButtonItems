//
//  MenuButtonItemsXib.swift
//  MenuButtonItems
//
//  Created by Antonio Alessandro Chillura on 07/05/18.
//  Copyright © 2018 Antonio Alessandro Chillura. All rights reserved.
//

import UIKit

public class MenuButtonItemsXib: UIView {
    
    public struct ModelItem {
        public var imageName:String
        public var textBtn:String?
        public var castomizedView:CastomizedView?
        
        public init(imageName:String, textBtn:String?, castomizedView:CastomizedView) {
            self.imageName = imageName
            self.textBtn = textBtn
            self.castomizedView = castomizedView
        }
    }
    
    public struct CastomizedView {
        public var colorBackgroundView:UIColor?
        public var isCircleView:Bool = false
        public var cornerRadiusView:CGFloat?
        
        public init() {}
        
        public init(colorBackgroundView: UIColor?, isCircleView: Bool, cornerRadiusView: CGFloat?) {
            self.colorBackgroundView = colorBackgroundView
            self.isCircleView = isCircleView
            self.cornerRadiusView = cornerRadiusView
        }
    }
    
    //MARK: - Properties
    var view: UIView!
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var menuImg: UIImageView!
    @IBOutlet weak var textMenuLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var funcDidSateButton:((_ isSelected:Bool)->Void)?
    
    //MARK: - View Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        collectionViewSetup()
    }
    
    //MARK: - Init delegate e dataSource CollectionView
    
    var dettaglio:DettaglioCollectionViewModel? {
        didSet {
            guard let dettaglio = dettaglio else {
                return
            }
            
            if let dataSource = dettaglio.dataSource {
                collectionView.dataSource = dataSource
            }
            
            if let delegate = dettaglio.delegate {
                collectionView.delegate = delegate
            }
            
            self.reloadData()
        }
    }
    
    func reloadData() {
        self.collectionView.reloadData()
        self.collectionView.setNeedsLayout()
        self.collectionView.layoutIfNeeded()
    }
    
    public func setSateMenuItem(state: @escaping (Bool) -> Void) {
        self.funcDidSateButton = state
        self.funcDidSateButton?(false)
    }
    
    func setupMenuItem(imageBtn:UIImage, text:String?, backgroundViewMenu:UIColor, cornerRadiusView:CGFloat?, itemsModel:DettaglioCollectionViewModel?, countItems:CGFloat) {
        self.menuImg.image = imageBtn
        self.textMenuLbl.text = text
        self.menuView.backgroundColor = backgroundViewMenu
        self.dettaglio = itemsModel
        
        let layout = self.collectionView.collectionViewLayout
        layout.collectionView?.contentInset = UIEdgeInsets(top: 0, left: (layout.collectionView?.frame.width ?? 222) - (51 * countItems) - (8 * countItems), bottom: 0, right: 0)
        self.collectionView.collectionViewLayout = layout
        
        self.menuView.layer.cornerRadius = cornerRadiusView != nil ? cornerRadiusView! : 0
    }
    
    // MARK: set menu btn
    ///
    /// - Parameters:
    ///   - menuBtn: set ModelItem with imageName, text and CastomizedView
    ///   - items: set array [ModelItem] items btn
    ///   - itemSelected: return item selected index
    public func setMenuModel(menuBtn: ModelItem, items:[ModelItem], itemSelected: @escaping (Int) -> Void) {
        
        let image = UIImage.init(named: menuBtn.imageName)

        var dettaglio = DettaglioCollectionViewModel.init()
        let delegateCV = ItemBtnCVCDelegate()
        dettaglio.delegate = delegateCV
        delegateCV.didSelectItemAt(completionhandler: { (indexPath) in
            itemSelected(indexPath.row)
        }, sectionTableView: 0)

        var itemsModel = [ItemBtnModel]()
        
        for itemBtn in items {
            var iModelObj = ItemBtnModel.init(nameImageView: itemBtn.imageName, text: itemBtn.textBtn, colorViewContainer: itemBtn.castomizedView?.colorBackgroundView ?? .blue)
            iModelObj.isCircle = itemBtn.castomizedView?.isCircleView ?? false
            itemsModel.append(iModelObj)
        }
        
        var cornerRadiusView = menuBtn.castomizedView?.cornerRadiusView
        
        if let isCircleView = menuBtn.castomizedView?.isCircleView, isCircleView {
            cornerRadiusView = self.menuView.frame.size.height/2
        }

        let dataSources = ItemBtnCVCDataSources.init(dataSource: itemsModel)
        dettaglio.dataSource = dataSources

        self.setupMenuItem(imageBtn: image!, text: menuBtn.textBtn, backgroundViewMenu: menuBtn.castomizedView?.colorBackgroundView ?? .blue, cornerRadiusView: cornerRadiusView, itemsModel: dettaglio, countItems: CGFloat(items.count))
    }
    
    
}

// MARK: - xibSetup

extension MenuButtonItemsXib {
    
    func xibSetup() {
        view = loadNib()
        view.frame = bounds
        addSubview(view)
    }
    
    func collectionViewSetup() {
        collectionView.register(UINib(nibName: ItemBtnCVC.identifieldCell, bundle: nil), forCellWithReuseIdentifier: ItemBtnCVC.identifieldCell)
    }
}

// MARK: - Btn menu action

extension MenuButtonItemsXib {
    @IBAction func menuBtnAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.funcDidSateButton?(sender.isSelected)
    }
}
