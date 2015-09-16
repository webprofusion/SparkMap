//
//  POIManager.swift
//  SparkMap
//
//  Created by Christopher Cook on 12/09/2015.
//  Copyright © 2015 Christopher Cook. All rights reserved.
//

import Foundation
import JSONJoy

class POIManager{
    func getData(completionHandler: ((POIList!, NSError!) -> Void)!) -> Void {
        let url: NSURL? = NSURL(string: "http://api.openchargemap.io/v2/poi/?client=sparkmap_ios&verbose=false&output=json&latitude=-31.950564399999998&longitude=115.81274359999999&distance=100&distanceunit=Miles&includecomments=true&maxresults=100")
        
        /*
        http://api.openchargemap.io/v2/poi/?client=ocm.app.web.5.2.6_20150813&verbose=false&output=json&latitude=-31.950564399999998&longitude=115.81274359999999&distance=100&distanceunit=Miles&includecomments=true&maxresults=100&callback=ocm_app.handleSearchCompleted&false=jQuery21106734465572517365_1442230196410&_=1442230196412
        */
        let ses = NSURLSession.sharedSession()
        let task = ses.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            if (error != nil) {
                return completionHandler(nil, error)
            }
            
            
            var result:NSArray?
            var poiList = POIList()
            do{
                //result = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSArray
                
                var decoder = JSONDecoder(data!)
                //poiList = POIList(JSONDecoder(data!))
                
                var collect = Array<OCMChargePoint>()
                
                if let poiArray = decoder.array {
                    
                    for poiDecoder in poiArray {
                        collect.append(OCMChargePoint(poiDecoder))
                    }
                }
                
                poiList.list = collect
                
                
            } catch {
                //failed
            }
            if (error != nil) {
                return completionHandler(nil, error)
            } else {
                
                //let result=json["results"]
                return completionHandler(poiList, nil)
            }
        })
        task.resume()
        
    }
    
}