//
//  ItemCategory.swift
//  TryNewFood
//
//  Created by Eldon Chan on 1/14/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ItemCategory {
    
    var name = String()
    var items = [Item]()
    
//    static func retrieveData(completion: @escaping (ItemCategory) -> ()) {
//        
//        let ref = Database.database().reference(withPath: "Food")
//        ref.observe(.value, with: { (snapshot) in
//            
//            let itemCategory = ItemCategory()
//            itemCategory.name = "Food"
//            guard let dictionaries = snapshot.value as? [String: Any] else { return }
//            
//            dictionaries.forEach({ (key, value) in
//                guard let dictionary = value as? [String: Any] else { return }
//                let item = Item(dictionary: dictionary)
//                itemCategory.items?.append(item)
//                //                dump(item)
//            })
//            completion(itemCategory)
//        })
//    }
//    
}

