//
//  ViewController.swift
//  SparkMap
//
//  Created by Christopher Cook on 12/09/2015.
//  Copyright © 2015 Christopher Cook. All rights reserved.
//

import UIKit
import MapKit
import RxSwift


class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000
    
    var poiList = Variable([OCMChargePoint]())
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self;
        // Do any additional setup after loading the view, typically from a nib.
        
        // set initial location in Honolulu
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        
        centerMapOnLocation(initialLocation)
        
        
        //perform async fetch of POIs for map makers, TOODO: fetch from common observable
        
        //SharedAppModel.Current.poiManager.getPOIList()
            SharedAppModel.Current.poiList
            .subscribeNext { [unowned self] array in
                self.poiList.value = array
                self.plotMapMarkers()
            }
            .addDisposableTo(disposeBag)

    }
    
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func plotMapMarkers()
    {
        var lastPOI = OCMChargePoint();
        
        let list = poiList.value;
        
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

extension MapViewController: MKMapViewDelegate {
    
    // 1
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        if let annotation = annotation as? POIMarker {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
                as? MKPinAnnotationView { // 2
                    dequeuedView.annotation = annotation
                    view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type:.DetailDisclosure) as UIView
            }
            return view
        }
        return nil
    }
}

