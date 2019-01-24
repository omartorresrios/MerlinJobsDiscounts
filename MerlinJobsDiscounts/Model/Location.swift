//
//  Location.swift
//  MerlinJobsDiscounts
//
//  Created by Omar Torres on 1/21/19.
//  Copyright © 2019 OmarTorres. All rights reserved.
//

import Foundation
import MapKit

struct Location: Decodable {
    let distance: Int?
    let lat: CLLocationDegrees
    let lng: CLLocationDegrees
    let formattedAddress: Array<String>?
}
