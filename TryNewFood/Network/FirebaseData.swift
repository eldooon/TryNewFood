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
    var database = [ItemCategory]()
    let ref = Database.database().reference()

    
    func retrieveData(completion: @escaping () -> ()) {
        
        ref.observe(.value, with: { (snapshot) in
            
            guard let dictionaries = snapshot.value as? [String: Any] else { return }
            dictionaries.forEach({ (key, value) in
                let newItemCategory = ItemCategory()
                newItemCategory.name = key
                print("Item category name:", newItemCategory.name)
                guard let dictionary = value as? [String: Any] else { return }
                
                guard let testvalue = value as? [String: Any] else { return }
                for eachValue in testvalue {
                    guard let value = eachValue.value as? [String: Any] else {return}
                    let item = Item(dictionary: value)
                    newItemCategory.items.append(item)
                    print("eachvalue", eachValue.value)
                }
                self.database.append(newItemCategory)
            })
            completion()
        })
        
    }

}
