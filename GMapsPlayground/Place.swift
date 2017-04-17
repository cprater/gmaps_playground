//
//  Place.swift
//  GMapsPlayground
//
//  Created by Christopher Prater on 4/11/17.
//  Copyright © 2017 Christopher Prater. All rights reserved.
//

import Foundation
import CoreLocation

class Place {
    //MARK:  Properties
    var name: String = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var distance: Double {
        let currentLocation = LocationService.sharedInstance.currentLocation!
        
        let placeLocation = CLLocation(latitude: latitude, longitude: longitude)
        let calcDistance = currentLocation.distance(from: placeLocation)
        
        print("setup distance \(calcDistance / 1609)")
        
        return calcDistance / 1609
    }
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
    
    
//        let currentLocation = LocationService.sharedInstance.currentLocation!
//        
//        for place in places {
//            let placeLocation = CLLocation(latitude: place.latitude, longitude: place.longitude)
//            let distance = currentLocation.distance(from: placeLocation)
//            
//            print("setup distance \(distance / 1609)")
//            
//            place.distance = distance / 1609
//        }
}
