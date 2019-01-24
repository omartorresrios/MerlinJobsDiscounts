//
//  Constants.swift
//  MerlinJobsDiscounts
//
//  Created by Omar Torres on 1/19/19.
//  Copyright © 2019 OmarTorres. All rights reserved.
//

import UIKit

let client_id = ProcessInfo.processInfo.environment["CLIENT_ID"]
let client_secret = ProcessInfo.processInfo.environment["CLIENT_SECRET"]

// Notifications
let updateCurrentLocationNotificationName = Notification.Name("updateCurretnLocationNotificationName")

let locationManagerShared = LocationManager.shared

// Urls
let searchRecommendationsnUrl = "https://api.foursquare.com/v2/search/recommendations?ll=\(locationManagerShared.currentLocation.latitude),\(locationManagerShared.currentLocation.longitude)&client_id=\(client_id!)&client_secret=\(client_secret!)&limit=10&v=\(date)"

// Others
let placePhotoDimensions = "500x500"
let placeCategoryIconSize = "64"
let pintIdentifier = "pin"
let date: String = "20190116"
