//
//  ViewController.swift
//  TryNewFood
//
//  Created by Eldon Chan on 1/2/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class DiscoverController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let headerId = "headerId"
    let database = FireBaseData.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "Discover"
        
        database.retrieveData {
            let name = Notification.Name(rawValue: reloadNotificationKey)
            NotificationCenter.default.post(name: name, object: nil)
            self.collectionView?.reloadData()
        }
        
        collectionView?.backgroundColor = .white
        collectionView?.register(CategoriesCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(FeaturedCell.self, forCellWithReuseIdentifier: headerId)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didSelectItemCell(item: Item) {
        
        let itemDetailController = ItemDetailController()
        itemDetailController.item = item
        
        navigationController?.pushViewController(itemDetailController, animated: true)
        
    }

    func didSelectFeaturedItemCell() {
        
        let featuredDetailControler = FeaturedDetailController(collectionViewLayout: UICollectionViewLayout())
        
        navigationController?.pushViewController(featuredDetailControler, animated: true)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return database.itemDatabase.count
    }
 
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CategoriesCell
        
        if indexPath.item == 0 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerId, for: indexPath) as! FeaturedCell
            cell.itemCategory = database.featuredDatabase[indexPath.item]
        }
        
        else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoriesCell
            cell.itemCategory = database.itemDatabase[indexPath.item]
        }
        cell.discoverController = self
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 0  {
            return CGSize(width: view.frame.width, height: 300)
        }
        return CGSize(width: view.frame.width, height: 180)
    }

}

