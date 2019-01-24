//
//  PlacePin.swift
//  MerlinJobsDiscounts
//
//  Created by Omar Torres on 1/21/19.
//  Copyright © 2019 OmarTorres. All rights reserved.
//

import Foundation
import MapKit

class PlacePin: NSObject, MKAnnotation {
    var title: String?
    let coordinate: CLLocationCoordinate2D
    var image: String?
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
