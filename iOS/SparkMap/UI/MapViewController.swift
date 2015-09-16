//
//  ViewController.swift
//  SparkMap
//
//  Created by Christopher Cook on 12/09/2015.
//  Copyright © 2015 Christopher Cook. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set initial location in Honolulu
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        
        centerMapOnLocation(initialLocation)
        plotMapMarkers();
    }
    
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func plotMapMarkers()
    {
        var lastPOI = OCMChargePoint();
        
        let list = SharedAppModel.Context.poiList;
        
        if (list.count>0) {
            //populate map markers
            for p in list {
                
                let poi = POIMarker(
                    title: p.AddressInfo.Title!,
                    coordinate: CLLocationCoordinate2D(latitude: p.AddressInfo.Latitude, longitude:p.AddressInfo.Longitude)
                );
                
                mapView.addAnnotation(poi);
                
                lastPOI = p;
            }
            centerMapOnLocation(CLLocation(latitude: lastPOI.AddressInfo.Latitude, longitude:lastPOI.AddressInfo.Longitude))
        } else {
            //remove all markers
            let annotationsToRemove = mapView.annotations.filter { $0 !== mapView.userLocation };
            mapView.removeAnnotations( annotationsToRemove );
        }
    }
    
}

