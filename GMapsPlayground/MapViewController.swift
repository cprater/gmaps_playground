//
//  MapViewController.swift
//  GMapsPlayground
//
//  Created by Christopher Prater on 4/10/17.
//  Copyright © 2017 Christopher Prater. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    // MARK: Properties
    var place: Place! 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Private methods
    private func updateView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: place.latitude, longitude: place.longitude, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        
    }

}

