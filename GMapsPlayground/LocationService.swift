//
//  LocationService.swift
//  GMapsPlayground
//
//  Created by Christopher Prater on 4/17/17.
//  Copyright © 2017 Christopher Prater. All rights reserved.
//

import Foundation
import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate {
    static let sharedInstance: LocationService = {
        return LocationService()
    }()
    
    //MARK: Properties
    var locationManager: CLLocationManager?
    var currentLocation: CLLocation?
    
    override init() {
        super.init()
        
        self.locationManager = CLLocationManager()
        guard let locationManager = self.locationManager else {
            return
        }
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 100
        locationManager.delegate = self
        
        locationManager.startUpdatingLocation()
    }
    
    // CLLocationMangagerDelegate
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("locations: \(locations)")
        
        guard let location = locations.last else {
            return
        }
        
        print("location: \(location)")
        
        currentLocation = location
    }
    
}
