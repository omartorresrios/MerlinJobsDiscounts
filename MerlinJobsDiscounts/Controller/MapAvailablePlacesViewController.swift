//
//  MapAvailablePlaces.swift
//  MerlinJobsDiscounts
//
//  Created by Omar Torres on 1/16/19.
//  Copyright © 2019 OmarTorres. All rights reserved.
//

import UIKit
import MapKit

class MapAvailablePlacesViewController: UIViewController, MKMapViewDelegate {
    
    let mapView: MKMapView = {
        let map = MKMapView()
        return map
    }()
    
    let pinCustomView: PinCustomView = {
        let view = PinCustomView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    var places = [Place]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        setupPines()
    }
    
    private func setupMapView() {
        view.addSubview(mapView)
        mapView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        
        let coordinateRegion = MKCoordinateRegion(center: LocationManager.shared.currentLocation, latitudinalMeters: 2000, longitudinalMeters: 2000)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    private func setupPines() {
        places.forEach { (place) in
            let lat = place.venue.location.lat
            let lng = place.venue.location.lng
            let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lng)
            
            let pin = PlacePin(title: place.venue.name, coordinate: coordinate)
            
            if let placePhoto = place.photo {
                let placeImageUrl = placePhoto.prefix + placePhotoDimensions + placePhoto.suffix
                pin.image = placeImageUrl
            }
            mapView.addAnnotation(pin)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: pintIdentifier)
        
        if let anotation = annotationView {
            anotation.annotation = annotation
        } else {
            annotationView = AnnotationView(annotation: annotation, reuseIdentifier: pintIdentifier)
            annotationView?.canShowCallout = false
        }
        
        annotationView?.image = #imageLiteral(resourceName: "pin")
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if view.annotation is MKUserLocation {
            return
        }
        
        let placePin = view.annotation as! PlacePin
        
        view.addSubview(pinCustomView)
        let height = Helpers.shared.calculatePlacePinName(pin: placePin, view: view) + 116
        pinCustomView.anchor(top: nil, left: nil, bottom: view.topAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 4, paddingRight: 0, width: 146, height: height)
        pinCustomView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: view.calloutOffset.x).isActive = true
        
        pinCustomView.placePin = placePin
        
        mapView.setCenter((view.annotation?.coordinate)!, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        if view.isKind(of: AnnotationView.self) {
            for subview in view.subviews {
                subview.removeFromSuperview()
            }
        }
    }
}
