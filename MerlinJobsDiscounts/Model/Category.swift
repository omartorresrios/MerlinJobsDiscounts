//
//  Category.swift
//  MerlinJobsDiscounts
//
//  Created by Omar Torres on 1/21/19.
//  Copyright © 2019 OmarTorres. All rights reserved.
//

import Foundation

struct Category: Decodable {
    let name: String
    let icon: CategoryIcon
}

struct CategoryIcon: Decodable {
    let suffix: String
    let prefix: String
}
