//
//  ImageCustomView.swift
//  MerlinJobsDiscounts
//
//  Created by Omar Torres on 1/21/19.
//  Copyright © 2019 OmarTorres. All rights reserved.
//

import UIKit

class PinCustomView: UIView {
    
    var placePin: PlacePin! {
        didSet {
            pinNameLabel.text = placePin.title
            if let imageUrl = placePin.image {
                pinImageView.loadImage(urlString: imageUrl)
            }
        }
    }
    
    let pinNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "SFUIDisplay-Semibold", size: 14)
        return label
    }()
    
    let pinImageView: CustomImageView = {
        let iv = CustomImageView()
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        self.addSubview(pinNameLabel)
        pinNameLabel.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 12, paddingLeft: 12, paddingBottom: 0, paddingRight: 12, width: 0, height: 0)
        
        self.addSubview(pinImageView)
        pinImageView.anchor(top: pinNameLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 12, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 130, height: 80)
        pinImageView.centerXAnchor.constraint(equalTo: pinNameLabel.centerXAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
