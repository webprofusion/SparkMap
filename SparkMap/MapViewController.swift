//
//  ViewController.swift
//  SparkMap
//
//  Created by Christopher Cook on 12/09/2015.
//  Copyright © 2015 Christopher Cook. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set initial location in Honolulu
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        
        centerMapOnLocation(initialLocation)
        
        
        let poiManager =  POIManager()
        //poiManager.fetchPOIList()
        poiManager.getData(processPOIResults)
    }
    
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func processPOIResults(results: POIList?, error:NSError?)
    {
        var lastPOI = OCMChargePoint()
        
        for p in results!.list! {
         print(p.AddressInfo.AddressLine1)
            let poi = POIMarker(
                title: p.AddressInfo.Title!,
                coordinate: CLLocationCoordinate2D(latitude: p.AddressInfo.Latitude, longitude:p.AddressInfo.Longitude))
            
            mapView.addAnnotation(poi)
            
            lastPOI=p
        }
        centerMapOnLocation(CLLocation(latitude: lastPOI.AddressInfo.Latitude, longitude:lastPOI.AddressInfo.Longitude))
    }
    /*
    func getJSON(urlToRequest: String) -> NSData?{
    return NSData?(contentsOfURL: NSURL(string: urlToRequest))
    }
    
    func parseJSON(inputData: NSData) -> NSDictionary{
    var error: NSError?
    // var boardsDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(inputData, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary
    
    //return boardsDictionary
    }*/
    
    
}

