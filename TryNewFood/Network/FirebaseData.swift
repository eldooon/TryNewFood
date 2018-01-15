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
    let ref = Database.database().reference(withPath: "Food")
    
    func retrieveData(completion: @escaping () -> ()) {
        
        let newItemCategory = ItemCategory()
        ref.observe(.value, with: { (snapshot) in
            
            guard let dictionaries = snapshot.value as? [String: Any] else { return }
            newItemCategory.name = self.ref.key
            dictionaries.forEach({ (key, value) in
                guard let dictionary = value as? [String: Any] else { return }
                let item = Item(dictionary: dictionary)
                newItemCategory.items.append(item)
            })
            self.database.append(newItemCategory)
            completion()
        })
    }

}
