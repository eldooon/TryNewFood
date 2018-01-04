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
    
    init(Image: UIImage, Name: String, Info: String, Description: String){
        
        image = Image
        name = Name
        info = Info
        description = Description
        
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        let imageURL = URL(fileURLWithPath: snapshotValue["Image"] as! String)
        guard let imagedata = try? Data(contentsOf: imageURL) else { return }
        guard let fireImage = UIImage(data: imagedata) else { return }
        image = fireImage
        name = snapshotValue["Name"] as! String
        info = snapshotValue["Info"] as! String
        description = snapshotValue["Description"] as! String
    }
    
}

