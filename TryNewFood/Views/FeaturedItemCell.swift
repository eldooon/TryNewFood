//
//  FeaturedItemCell.swift
//  TryNewFood
//
//  Created by Eldon Chan on 1/18/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class FeaturedItemCell: UICollectionViewCell {
    
    var itemImageView : UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .blue
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let itemNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Item Name"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(itemImageView)
        itemImageView.anchor(centerX: nil, centerY: nil, top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 220)
        
        addSubview(itemNameLabel)
        itemNameLabel.anchor(centerX: nil, centerY: nil, top: itemImageView.bottomAnchor, left: itemImageView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
