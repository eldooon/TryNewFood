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

protocol DiscoverControllerDelegate {
    func didFetchData()
}

class DiscoverController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let headerId = "headerId"
    let database = FirebaseData.sharedInstance
    var delegate: DiscoverControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "Discover"
        collectionView?.backgroundColor = .white
        collectionView?.register(CategoriesCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(reloadData))
        
        database.retrieveData {
            print("fetching data")
            self.delegate?.didFetchData()
        }
        
    }
    
    @objc func reloadData () {
        print("attemping to reload")
       self.delegate?.didFetchData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didSelectItemCell(Index: Int) {
        
        let itemDetailController = ItemDetailController()
        let data = database.database[Index]
        itemDetailController.itemNameLabel.text = data.name
        itemDetailController.itemInfoLabel.text = data.info
        itemDetailController.itemImageView.image = data.image
        itemDetailController.descriptionTextView.text = data.description

        navigationController?.pushViewController(itemDetailController, animated: true)
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
 
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoriesCell
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
        return CGSize(width: view.frame.width, height: 150)
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! HeaderCell
        
//        if indexPath.section == 0 {
//
//            header.titleLabel.text = "Featured"
//        }
//
//        if indexPath.section != 0 {
//
//            header.titleLabel.text = "Section" //Temporary
//        }
        
        return header
    }
}

