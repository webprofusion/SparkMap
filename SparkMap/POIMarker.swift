//
//  POIMarker.swift
//  SparkMap
//
//  Created by Christopher Cook on 13/09/2015.
//  Copyright © 2015 Christopher Cook. All rights reserved.
//

import Foundation
import MapKit

class POIMarker: NSObject, MKAnnotation {
   
    let coordinate: CLLocationCoordinate2D
    
    init(title: String,  coordinate: CLLocationCoordinate2D) {
       
        self.coordinate = coordinate
        
        super.init()
    }
    
  
}