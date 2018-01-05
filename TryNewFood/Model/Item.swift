//
//  Item.swift
//  TryNewFood
//
//  Created by Eldon Chan on 1/4/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit
import FirebaseDatabase

public class Item {
    
    var image = UIImage()
    var name = String()
    var info = String()
    var description = String()
    
    init(dictionary: [String: Any]) {
        
        let imageURL = URL(string: dictionary["Image"] as? String ?? "")
        guard let imageData = try? Data(contentsOf: imageURL!) else { return }
        self.image = UIImage(data: imageData)!
        self.name = dictionary["Name"] as? String ?? ""
        self.info = dictionary["Info"] as? String ?? ""
        self.description = dictionary["Description"] as? String ?? ""
    }
    
}

