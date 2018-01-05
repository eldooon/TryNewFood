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
        return iv
    }()
    
    let itemNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Item Name"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(itemImageView)
        itemImageView.anchor(centerX: self.centerXAnchor, centerY: self.centerYAnchor, top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(itemNameLabel)
        itemNameLabel.anchor(centerX: nil, centerY: nil, top: nil, left: itemImageView.leftAnchor, bottom: itemImageView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
