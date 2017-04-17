//
//  PlaceTableViewController.swift
//  GMapsPlayground
//
//  Created by Christopher Prater on 4/11/17.
//  Copyright © 2017 Christopher Prater. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class PlaceTableViewController: UITableViewController, CLLocationManagerDelegate {
    //MARK: Properties
    var places = [Place]()
    var currentLat: Double?
    var currentLon: Double?
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Register Table Cell nib
        tableView.register(UINib(nibName: "PlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "PlaceTableViewCell")
        
        // Load sample places
        loadSamplePlaces()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceTableViewCell", for: indexPath) as? PlaceTableViewCell else {
            fatalError("Dequed cell is not an instance of PlaceTableViewCell")
        }
        
        print("setup cell")
        
        cell.place = places[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = places[indexPath.row]
        
        self.performSegue(withIdentifier: "showPlaceDetail", sender: cell)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            case "showPlaceDetail":
                guard let placeDetailViewController = segue.destination as? PlaceViewController else {
                    fatalError("Unexpected destination: \(segue.destination)")
                }
                
                guard let selectedPlace = sender as? Place else {
                    fatalError("Unexpected sender: \(sender)")
                }
            
                placeDetailViewController.place = selectedPlace
            default:
                fatalError("Unexpected Segue identifier; \(segue.identifier)")
            }
    }

    //MARK: Private methods
    private func loadSamplePlaces() {
        let place1 = Place(name: "Sydney", latitude: -33.86, longitude: 151.20)
        let place2 = Place(name: "Boulder", latitude: 40.04, longitude: -105.27)
        let place3 = Place(name: "Fort Worth", latitude: 32.75, longitude: -97.33)
        
        places += [place1, place2, place3]
        
        updatePlacesDistance()
    }
    
    private func updatePlacesDistance() {
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
}
