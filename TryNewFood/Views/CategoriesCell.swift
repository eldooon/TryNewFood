//
//  CategoriesCell.swift
//  TryNewFood
//
//  Created by Eldon Chan on 1/8/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

let reloadNotificationKey = "ByEldon.Reload"

class CategoriesCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    let reload = Notification.Name(rawValue: reloadNotificationKey)
    
    let cellId = "appCellId"
    
    var discoverController = DiscoverController()
    
    let itemCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        return label
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()
    
    let database = FireBaseData.sharedInstance
    
    var itemCategory: ItemCategory? {
        didSet {
            
            if let name = itemCategory?.name {
                nameLabel.text = name
            }
            
            itemCollectionView.reloadData()
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        itemCollectionView.dataSource = self
        itemCollectionView.delegate = self
        itemCollectionView.register(ItemCell.self, forCellWithReuseIdentifier: cellId)
        itemCollectionView.reloadData()
        createLayout()
        createObserver()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func createObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(reloadDataAfterFetch), name: reload, object: nil)
    }
    
    @objc func reloadDataAfterFetch() {
        itemCollectionView.reloadData()
    }
    
    func createLayout() {
        
        addSubview(nameLabel)
        nameLabel.anchor(centerX: nil, centerY: nil, top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(itemCollectionView)
        itemCollectionView.anchor(centerX: nil, centerY: nil, top: nameLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(dividerLineView)
        dividerLineView.anchor(centerX: nil, centerY: nil, top: itemCollectionView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = itemCategory?.items.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ItemCell
        
        cell.itemImageView.image = itemCategory?.items[indexPath.item].image
        cell.itemNameLabel.text = itemCategory?.items[indexPath.item].name


        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height - 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 14, 0, 14)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let item = itemCategory?.items[indexPath.item] {
            discoverController.didSelectItemCell(item: item)
        }
    }
    
}


