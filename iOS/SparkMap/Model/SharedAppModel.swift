//
//  SharedAppModel.swift
//  SparkMap
//
//  Created by Christopher Cook on 16/09/2015.
//  Copyright © 2015 Christopher Cook. All rights reserved.
//

import Foundation
import RxSwift

class SharedAppModel {
    var poiList : Observable<[OCMChargePoint]>
    static let Current = SharedAppModel() //singleton instance SharedAppModel.Current
  
    let URLSession = NSURLSession.sharedSession()
    let backgroundWorkScheduler: ImmediateSchedulerType
    let mainScheduler: SerialDispatchQueueScheduler
    let poiManager = POIManager()
    
    private init() {
      
        
        let operationQueue = NSOperationQueue()
        operationQueue.maxConcurrentOperationCount = 2
        //if #available(iOS 8.0, *) {
            operationQueue.qualityOfService = NSQualityOfService.UserInitiated
        //}=else {
            // Fallback on earlier versions
        //
    
        backgroundWorkScheduler = OperationQueueScheduler(operationQueue: operationQueue)
        
        mainScheduler = MainScheduler.sharedInstance
        
        //
        poiList = Observable<[OCMChargePoint]>()
        
        

    }

    func refreshPOIList(){
        
        self.poiList = SharedAppModel.Current.poiManager.getPOIList()
    }
  
}
