//
//  LocationManager.swift
//  MerlinJobsDiscounts
//
//  Created by Omar Torres on 1/22/19.
//  Copyright © 2019 OmarTorres. All rights reserved.
//

import UIKit
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    static let shared = LocationManager()
    
    var currentLocation: CLLocationCoordinate2D!
    var locationManager = CLLocationManager()
    
    func setupLocationManager(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
        
    }
    
    func getCurrentLocation() {
        if CLLocationManager.locationServicesEnabled() {
            switch(CLLocationManager.authorizationStatus()) {
            case .authorizedWhenInUse:
                locationManager.startUpdatingLocation()
            default:
                showLocationAlert()
            }
        } else {
            showLocationAlert()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if Double((locations.last?.timestamp.timeIntervalSinceNow)!) < -30.0 || Double((locations.last?.horizontalAccuracy)!) > 80 {
            return
        }
        
        currentLocation = locations.last?.coordinate
        locationManager.stopUpdatingLocation()
        
        NotificationCenter.default.post(name: updateCurrentLocationNotificationName, object: nil)
        
    }
    
    func showLocationAlert() {
        let alert = UIAlertController(title: "Location Disabled", message: "Please enable location for MerlinJobsDiscounts", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
