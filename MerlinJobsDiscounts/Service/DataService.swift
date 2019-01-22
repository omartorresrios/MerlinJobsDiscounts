//
//  DataService.swift
//  MerlinJobsDiscounts
//
//  Created by Omar Torres on 1/22/19.
//  Copyright © 2019 OmarTorres. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataService: NSObject {
    
    static let shared = DataService()
    var rawData = Data()
    var jsonResults = JSON()

    func fetchNearbyPlaces(completion: @escaping ([Place]) -> ()) {
        Alamofire.request(searchRecommendationsnUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseData(completionHandler: { (dataResponse) in
            guard let data = dataResponse.data else { return }
            
            do {
                let json = try JSON(data: data)
                self.jsonResults = json["response"]["group"]["results"]
            } catch (let error) {
                print("Can't convert dataResponse.data to JSON: ", error)
            }
            
            do {
                self.rawData = try self.jsonResults.rawData(options: .prettyPrinted)
            } catch (let error) {
                print("Can't convert results to raw data: ", error)
            }
            
            do {
                let places = try JSONDecoder().decode(Array<Place>.self, from: self.rawData)
                completion(places)
//                self.places = places
                
                
                
            } catch (let error) {
                print("Can't decode Place: ", error)
            }
        })
    }

}
