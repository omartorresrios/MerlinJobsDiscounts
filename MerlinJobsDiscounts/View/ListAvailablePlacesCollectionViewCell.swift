//
//  ListAvailablePlacesCollectionViewCell.swift
//  MerlinJobsDiscounts
//
//  Created by Omar Torres on 1/19/19.
//  Copyright © 2019 OmarTorres. All rights reserved.
//

import UIKit

class ListAvailablePlacesCollectionViewCell: UICollectionViewCell {

    var place: Place! {
        didSet {
            if let placeCategory = place.venue.categories {
                let placeCategoryImageUrl = placeCategory[0].icon.prefix + placeCategoryIconSize + placeCategory[0].icon.suffix
                placeCategoryImageView.loadImage(urlString: placeCategoryImageUrl)
                placeCategoryNameLabel.text = placeCategory[0].name
            }
            
            if let placePhoto = place.photo {
                let placeImageUrl = placePhoto.prefix + placePhotoDimensions + placePhoto.suffix
                
                placeImageView.loadImage(urlString: placeImageUrl)
            }
            
            placeNameLabel.text = place.venue.name
            
            if let formattedAddressArray = place.venue.location.formattedAddress {
                placeAddressLabel.text = formattedAddressArray.joined(separator: " ")
            }
            
            if let distance = place.venue.location.distance {
                placeDistanceLabel.text = "\(distance)m"
            }
        }
    }
    
    let placeCategoryImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = UIColor.mainBlue()
        iv.layer.cornerRadius = 25 / 2
        iv.clipsToBounds = true
        return iv
    }()
    
    let placeCategoryNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = UIColor.mainBlue()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SFUIDisplay-Bold", size: 13)
        label.textAlignment = .left
        return label
    }()
    
    let placeImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = UIColor.rgb(red: 89, green: 119, blue: 80)
        iv.layer.cornerRadius = 5
        iv.clipsToBounds = true
        return iv
    }()
    
    let placeNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = UIColor.mainTextGray()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SFUIDisplay-Semibold", size: 14)
        label.textAlignment = .left
        return label
    }()
    
    let placeAddressLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = UIColor.mainTextGray()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SFUIDisplay-Regular", size: 14)
        label.textAlignment = .left
        return label
    }()
    
    let placeDistanceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = UIColor.mainTextGray()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SFUIDisplay-Regular", size: 14)
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        cellShadowEffect()
        setupViews()
    }
    
    func cellShadowEffect() {
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.8
    }
    
    func setupViews() {
        addSubview(placeCategoryImageView)
        placeCategoryImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 25, height: 25)
        
        addSubview(placeCategoryNameLabel)
        placeCategoryNameLabel.anchor(top: nil, left: placeCategoryImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0 , paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        placeCategoryNameLabel.centerYAnchor.constraint(equalTo: placeCategoryImageView.centerYAnchor).isActive = true
        
        addSubview(placeImageView)
        placeImageView.anchor(top: placeCategoryImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 150)
        
        addSubview(placeNameLabel)
        placeNameLabel.anchor(top: placeImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 12, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        addSubview(placeAddressLabel)
        placeAddressLabel.anchor(top: placeNameLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        addSubview(placeDistanceLabel)
        placeDistanceLabel.anchor(top: placeAddressLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
