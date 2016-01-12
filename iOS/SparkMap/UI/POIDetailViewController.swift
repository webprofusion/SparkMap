//
//  POIDetailViewController.swift
//  SparkMap
//
//  Created by Christopher Cook on 18/09/2015.
//  Copyright © 2015 Christopher Cook. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAddressLine1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        let poi = SharedAppModel.Current.selectedPOI.value;
        lblTitle.text = poi?.AddressInfo.Title;
        lblAddressLine1.text = poi?.AddressInfo.AddressLine1
    }
    
}
