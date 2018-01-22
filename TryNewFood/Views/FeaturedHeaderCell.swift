//
//  FeaturedHeaderCell.swift
//  TryNewFood
//
//  Created by Eldon Chan on 1/18/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class FeaturedHeaderCell: UICollectionViewCell {
    
    var featuredImageView : UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .peterRiver
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let featuredNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Item Name"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(featuredNameLabel)
        featuredNameLabel.anchor(centerX: centerXAnchor, centerY: nil, top: topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(featuredImageView)
        featuredImageView.anchor(centerX: nil, centerY: nil, top: featuredNameLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 260)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
