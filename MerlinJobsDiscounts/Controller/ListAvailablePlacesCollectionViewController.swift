//
//  ListAvailablePlacesCollectionViewController.swift
//  MerlinJobsDiscounts
//
//  Created by Omar Torres on 1/19/19.
//  Copyright © 2019 OmarTorres. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class ListAvailablePlacesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, CLLocationManagerDelegate {
    
    var places = [Place]()
    let listAvailablePlacesCellId = "listAvailablePlacesCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        self.navigationItem.title = "Nearby places around you"
        collectionView.backgroundColor = UIColor.mainBlue()
        collectionView?.register(ListAvailablePlacesCollectionViewCell.self, forCellWithReuseIdentifier: listAvailablePlacesCellId)
        NotificationCenter.default.addObserver(self, selector: #selector(handleUpdateUserProfileFeed), name: updateCurrentLocationNotificationName, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: updateCurrentLocationNotificationName, object: nil)
    }
    
    @objc func handleUpdateUserProfileFeed() {
        nearbyPlaces()
    }
   
    func nearbyPlaces() {
        DataService.shared.fetchNearbyPlaces { (places) in
            self.places = places
            
            if let navController = self.tabBarController?.viewControllers?[1] as? UINavigationController {
                if let mapAvailablePlacesViewController = navController.viewControllers.first as? MapAvailablePlacesViewController {
                    mapAvailablePlacesViewController.places = places
                }
            }
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return places.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: listAvailablePlacesCellId, for: indexPath) as! ListAvailablePlacesCollectionViewCell
        let place = places[indexPath.row]
        cell.place = place
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let place = places[indexPath.row]
        return Helpers.shared.calculateCellSize(place: place, view: view)
    }
    
}
