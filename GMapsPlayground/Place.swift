//
//  Place.swift
//  GMapsPlayground
//
//  Created by Christopher Prater on 4/11/17.
//  Copyright © 2017 Christopher Prater. All rights reserved.
//

import Foundation

class Place {
    //MARK:  Properties
    var name: String = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var distance: Double = 0.0
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}
