//
//  ItemDetailController.swift
//  TryNewFood
//
//  Created by Eldon Chan on 1/3/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class ItemDetailController: UIViewController {
    
    var item: Item? {
        didSet {
            
            if let name = item?.name {
                itemNameLabel.text = name
            }
            
            if let info = item?.info {
                itemInfoLabel.text = info
            }
        
            if let info = item?.info {
                itemInfoLabel.text = info
            }
            
            if let image = item?.image {
                itemImageView.image = image
            }
            
            if let description = item?.description {
                descriptionTextView.text = description
            }
        }
    }
    
    var scrollView : UIScrollView = {
        let sv = UIScrollView()
        sv.sizeToFit()
        return sv
    }()
    
    let contentView : UIView = {
        let view = UIView()
        return view
    }()
    
    let itemNameLabel : UILabel = {
        let label = UILabel()
        label.text = "Name Label"
        return label
    }()
    
    let itemInfoLabel : UILabel = {
        let label = UILabel()
        label.text = "Item Description"
        return label
    }()
    
    let itemImageView : UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .blue
        return iv
    }()
    
    let priceLabel : UILabel = {
        let label = UILabel()
        label.text = "$9.99"
        return label
    }()
    
    let ratingImageView : UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .blue
        return iv
    }()
    
    let findButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Find", for: .normal)
        return button
    }()
    
    let descriptionTextView : UITextView = {
        let tv = UITextView()
        tv.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar mi in elementum auctor. Donec commodo ex in lacus pellentesque, vitae commodo leo ullamcorper. Donec dignissim nibh est, in interdum dolor ultrices vel. Proin mattis euismod felis ut gravida. Mauris efficitur, velit non pharetra sodales, sem erat tempus odio, in gravida sapien velit vitae tellus. Fusce fermentum sit amet sapien eu scelerisque. Vestibulum lorem nulla, iaculis molestie tempus nec, cursus facilisis ipsum. Integer quis placerat elit, nec mollis libero. Suspendisse congue ac tellus quis cursus. Nulla convallis sapien tempus tortor placerat volutpat. Cras auctor non sem sit amet eleifend. Nam mollis efficitur nibh, sed mattis urna. Nullam fermentum risus quis consectetur pharetra. Phasellus varius lectus id lorem cursus, ac suscipit magna hendrerit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse luctus dui in ligula convallis, ut bibendum dolor imperdiet."
        tv.translatesAutoresizingMaskIntoConstraints = true
        tv.sizeToFit()
        tv.isScrollEnabled = false
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        createLayout()
    }
    
    override func viewWillLayoutSubviews() {
        
        let lastView : UIView! = contentView.subviews.last
        let height = lastView.frame.size.height
        let pos = lastView.frame.origin.y
        let sizeOfContent = height + pos + 50
        print(sizeOfContent)
        scrollView.contentSize.height = sizeOfContent
        super.viewWillLayoutSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createLayout() {
        
        view.addSubview(scrollView)
        scrollView.anchor(centerX: nil, centerY: nil, top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        scrollView.addSubview(contentView)
        contentView.anchor(centerX: nil, centerY: nil, top: scrollView.topAnchor, left: nil, bottom: scrollView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.view.bounds.width, height: scrollView.frame.height)
        
        contentView.addSubview(itemNameLabel)
        itemNameLabel.anchor(centerX: contentView.centerXAnchor, centerY: nil, top: contentView.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
       
        contentView.addSubview(itemInfoLabel)
        itemInfoLabel.anchor(centerX: contentView.centerXAnchor, centerY: nil, top: itemNameLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        contentView.addSubview(itemImageView)
        itemImageView.anchor(centerX: contentView.centerXAnchor, centerY: nil, top: itemInfoLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 300)
        
        contentView.addSubview(priceLabel)
        priceLabel.anchor(centerX: nil, centerY: nil, top: itemImageView.bottomAnchor, left: itemImageView.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 7, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        contentView.addSubview(ratingImageView)
        ratingImageView.anchor(centerX: nil, centerY: nil, top: priceLabel.bottomAnchor, left: priceLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 30)
        
        contentView.addSubview(findButton)
        findButton.anchor(centerX: nil, centerY: nil, top: priceLabel.topAnchor, left: nil, bottom: ratingImageView.bottomAnchor, right: itemImageView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 7, width: 200, height: 0)
        
        contentView.addSubview(descriptionTextView)
        descriptionTextView.anchor(centerX: nil, centerY: nil, top: findButton.bottomAnchor, left: ratingImageView.leftAnchor, bottom: nil, right: findButton.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
