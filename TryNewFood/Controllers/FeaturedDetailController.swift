//
//  FeaturedDetailController.swift
//  TryNewFood
//
//  Created by Eldon Chan on 1/18/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit


class FeaturedDetailController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private let cellId = "cellId"
    private let headerId = "headerId"
    private let detailCellId = "detailCellId"
    
    var item: Item? {
        didSet {
            
            if let name = item?.name {
                itemName = name
            }
            
            if let image = item?.image {
                itemImage = image
            }
        }
    }
    
    var itemName: String?
    var itemImage: UIImage?
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.backgroundColor = .white 
        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        self.collectionView?.register(FeaturedDetailCell.self, forCellWithReuseIdentifier: detailCellId)
        self.collectionView?.register(FeaturedHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)


    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell
            
        if indexPath.item == 0 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
            cell.backgroundColor = .red
        }
        
        else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCellId, for: indexPath) as! FeaturedDetailCell
            cell.backgroundColor = .blue
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 180)
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath) as! FeaturedHeaderCell
        header.featuredNameLabel.text = itemName
        header.featuredImageView.image = itemImage
        
        return header

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 300)
    }

}
