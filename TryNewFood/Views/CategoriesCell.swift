//
//  CategoriesCell.swift
//  TryNewFood
//
//  Created by Eldon Chan on 1/8/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class CategoriesCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    fileprivate let cellId = "appCellId"
    
    let itemCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.blue
        
        return collectionView
    }()
    
    let database = FirebaseData()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        database.retrieveData {
            self.itemCollectionView.reloadData()
            dump(self.database.firebaseData)
        }
        
        backgroundColor = .green
        itemCollectionView.dataSource = self
        itemCollectionView.delegate = self
        itemCollectionView.register(ItemCell.self, forCellWithReuseIdentifier: cellId)
        
        createLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createLayout() {
        
        addSubview(itemCollectionView)
        itemCollectionView.anchor(centerX: nil, centerY: nil, top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return database.firebaseData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ItemCell
        
        cell.itemImageView.image = database.firebaseData[indexPath.item].image
        cell.itemNameLabel.text = database.firebaseData[indexPath.item].name


        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height - 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 14, 0, 14)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        let itemDetailController = ItemDetailController()
//        let data = database.firebaseData[indexPath.item]
//        itemDetailController.itemNameLabel.text = data.name
//        itemDetailController.itemInfoLabel.text = data.info
//        itemDetailController.itemImageView.image = data.image
//        itemDetailController.descriptionTextView.text = data.description
//        
//        navigationController?.pushViewController(itemDetailController, animated: true)
        
    }
    
}


