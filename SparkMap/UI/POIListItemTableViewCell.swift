//
//  POIListItemTableViewCell.swift
//  SparkMap
//
//  Created by Christopher Cook on 13/09/2015.
//  Copyright © 2015 Christopher Cook. All rights reserved.
//

import UIKit

class POIListItemTableViewCell: UITableViewCell {

    @IBOutlet weak var poiTitle: UILabel!
    @IBOutlet weak var poiDistance: UILabel!
    @IBOutlet weak var poiAddress: UILabel!
    @IBOutlet weak var poiStatus: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
