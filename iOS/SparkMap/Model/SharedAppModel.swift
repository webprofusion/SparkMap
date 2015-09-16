//
//  SharedAppModel.swift
//  SparkMap
//
//  Created by Christopher Cook on 16/09/2015.
//  Copyright © 2015 Christopher Cook. All rights reserved.
//

import Foundation

class SharedAppModel {
    var poiList : Array<OCMChargePoint>
    static let Context = SharedAppModel()
    init(){
        poiList=Array<OCMChargePoint>()
    }
}