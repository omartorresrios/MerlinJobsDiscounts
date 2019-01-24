//
//  Helpers.swift
//  MerlinJobsDiscounts
//
//  Created by Omar Torres on 1/21/19.
//  Copyright © 2019 OmarTorres. All rights reserved.
//

import UIKit

class Helpers {
    
    static let shared = Helpers()
    
    func calculatePlacePinName(pin: PlacePin, view: UIView) -> CGFloat {
        
        let aproximateWidthOfLabel = view.frame.width - 72
        let size = CGSize(width: aproximateWidthOfLabel, height: 1000)
        
        let pintTitleAttributes = [NSAttributedString.Key.font: UIFont(name: "SFUIDisplay-Semibold", size: 14)]
        let pintTitleEstimatedFrame = NSString(string: pin.title ?? "").boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: pintTitleAttributes as [NSAttributedString.Key : Any], context: nil)
        
        return pintTitleEstimatedFrame.height
    }
    
    func calculateCellSize(place: Place, view: UIView) -> CGSize {
//        let width = (view.frame.width - 24) / 2
        
        let aproximateWidthOfLabel = view.frame.width - 16
        let size = CGSize(width: aproximateWidthOfLabel, height: 1000)
        
        let placeNameAttributes = [NSAttributedString.Key.font: UIFont(name: "SFUIDisplay-Semibold", size: 14)]
        let placeNameEstimatedFrame = NSString(string: place.venue.name).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: placeNameAttributes as [NSAttributedString.Key : Any], context: nil)
        
        let formattedAddressArray = place.venue.location.formattedAddress
        let string = formattedAddressArray?.joined(separator: " ")
        let placeAddressAttributes = [NSAttributedString.Key.font: UIFont(name: "SFUIDisplay-Regular", size: 14)]
        let placeAddressEstimatedFrame = NSString(string: string ?? "").boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: placeAddressAttributes as [NSAttributedString.Key : Any], context: nil)
        
        
        let placeDistanceAttributes = [NSAttributedString.Key.font: UIFont(name: "SFUIDisplay-Regular", size: 14)]
        let placeDistanceEstimatedFrame = NSString(string: "\(String(describing: place.venue.location.distance))m").boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: placeDistanceAttributes as [NSAttributedString.Key : Any], context: nil)
        
        return CGSize(width: view.frame.width - 16, height: placeNameEstimatedFrame.height + placeAddressEstimatedFrame.height + placeDistanceEstimatedFrame.height + 227)
    }
}


