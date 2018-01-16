//
//  ItemCell.swift
//  TryNewFood
//
//  Created by Eldon Chan on 1/2/18.
//  Copyright © 2018 ByEldon. All rights res.erved.
//

import UIKit

class ItemCell: UICollectionViewCell {
    
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
    
    let ratingImageView : UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .blue
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(itemImageView)
        itemImageView.anchor(centerX: nil, centerY: nil, top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 50, paddingRight: 0, width: 0, height: 0)
        
        addSubview(itemNameLabel)
        itemNameLabel.anchor(centerX: nil, centerY: nil, top: itemImageView.bottomAnchor, left: itemImageView.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(ratingImageView)
        ratingImageView.anchor(centerX: nil, centerY: nil, top: itemNameLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 2, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 20)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
