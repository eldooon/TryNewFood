//
//  FirebaseData.swift
//  TryNewFood
//
//  Created by Eldon Chan on 1/4/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import FirebaseDatabase

class FirebaseData {
    
    var firebaseData = [Item]()
    let ref = Database.database().reference(withPath: "Food")
    
    func retrieveData(completion: @escaping () -> ()) {
        
        ref.observe(.value, with: { (snapshot) in
            
            guard let dictionaries = snapshot.value as? [String: Any] else { return }
            
            dictionaries.forEach({ (key, value) in
                guard let dictionary = value as? [String: Any] else { return }
                let item = Item(dictionary: dictionary)
                self.firebaseData.append(item)
                print(item)
            })
            completion()
        })
    }
    
}
