//
//  FirebaseData.swift
//  TryNewFood
//
//  Created by Eldon Chan on 1/4/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import FirebaseDatabase


class FireBaseData {
        
    static let sharedInstance = FireBaseData()
    var itemDatabase = [ItemCategory]()
    var featuredDatabase = [ItemCategory]()
    let ref = Database.database().reference()

    
    func retrieveData(completion: @escaping () -> ()) {
        
        ref.observe(.value, with: { (snapshot) in
            
            guard let dictionaries = snapshot.value as? [String: Any] else { return }
            dictionaries.forEach({ (key, value) in
                let newItemCategory = ItemCategory()
                newItemCategory.name = key
                
                guard let testvalue = value as? [String: Any] else { return }
                for eachValue in testvalue {
                    guard let value = eachValue.value as? [String: Any] else {return}
                    let item = Item(dictionary: value)
                    newItemCategory.items.append(item)
                    print("eachvalue", eachValue.value)
                }
                if key == "Featured"{
                    self.featuredDatabase.append(newItemCategory)
                }
                self.itemDatabase.append(newItemCategory)
            })
            completion()
        })
        
    }

}
