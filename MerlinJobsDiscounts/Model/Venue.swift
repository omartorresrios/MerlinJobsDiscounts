//
//  Venue.swift
//  MerlinJobsDiscounts
//
//  Created by Omar Torres on 1/21/19.
//  Copyright © 2019 OmarTorres. All rights reserved.
//

import Foundation

struct Venue: Decodable {
    let id: String
    let name: String
    let categories: Array<Category>?
    let location: Location
}
