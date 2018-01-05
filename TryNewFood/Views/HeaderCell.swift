//
//  HeaderCell.swift
//  TryNewFood
//
//  Created by Eldon Chan on 1/5/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class HeaderCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .peterRiver
        
        addSubview(titleLabel)
        titleLabel.anchor(centerX: centerXAnchor, centerY: centerYAnchor, top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
