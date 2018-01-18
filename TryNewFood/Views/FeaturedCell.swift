//
//  HeaderCell.swift
//  TryNewFood
//
//  Created by Eldon Chan on 1/5/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class FeaturedCell: CategoriesCell {

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = itemCategory?.items.count {
            return count
        }
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ItemCell

        cell.itemImageView.image = itemCategory?.items[indexPath.item].image
        cell.itemNameLabel.text = itemCategory?.items[indexPath.item].name


        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }

}

//class FeaturedCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//
//    let cellId = "cellId"
//    let titleLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Featured"
//        return label
//
//    }()
//
//    let featuredCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.backgroundColor = .clear
//
//        return collectionView
//    }()
//
//    var itemCategory: ItemCategory? {
//        didSet {
//            print("Setting")
//            if let name = itemCategory?.name {
//                titleLabel.text = name
//            }
//
//            featuredCollectionView.reloadData()
//
//        }
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        featuredCollectionView.delegate = self
//        featuredCollectionView.dataSource = self
//
//        featuredCollectionView.register(ItemCell.self, forCellWithReuseIdentifier: cellId)
//
//        addSubview(titleLabel)
//        titleLabel.anchor(centerX: nil, centerY: nil, top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
//
//        addSubview(featuredCollectionView)
//        featuredCollectionView.anchor(centerX: nil, centerY: nil, top: titleLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
//
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        if let count = itemCategory?.items.count {
//            return count
//        }
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ItemCell
//
//        cell.itemImageView.image = itemCategory?.items[indexPath.item].image
//        cell.itemNameLabel.text = itemCategory?.items[indexPath.item].name
//
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: frame.width, height: frame.height)
//    }
//}

