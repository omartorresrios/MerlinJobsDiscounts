//
//  ImageCustomView.swift
//  MerlinJobsDiscounts
//
//  Created by Omar Torres on 1/21/19.
//  Copyright © 2019 OmarTorres. All rights reserved.
//

import UIKit

class ImageCustomView: UIView {
    
    let name: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .green
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let image: CustomImageView = {
        let iv = CustomImageView()
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(name)
        name.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 12, paddingLeft: 12, paddingBottom: 0, paddingRight: 12, width: 0, height: 0)
        name.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        self.addSubview(image)
        image.anchor(top: name.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 12, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 120, height: 80)
        image.centerXAnchor.constraint(equalTo: name.centerXAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
