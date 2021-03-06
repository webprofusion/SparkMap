//
//  POITableViewController.swift
//  SparkMap
//
//  Created by Christopher Cook on 14/09/2015.
//  Copyright © 2015 Christopher Cook. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class POITableViewController: UITableViewController {
    
    
    var poiList = Variable([OCMChargePoint]())
    var disposeBag = DisposeBag()
    
    
    func displayPOIResults(){
        
        // poiList=SharedAppModel.Current.poiList;
        
        self.tableView.reloadData();
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        
        /*dataSource.titleForHeaderInSection = { [unowned dataSource] sectionIndex in
        return dataSource.sectionAtIndex(sectionIndex).model
        }*/
        
        
        tableView.delegate = self;
        
        
        // reactive data source
        
        //SharedAppModel.Current.poiManager.getPOIList()
        SharedAppModel.Current.poiList
            .subscribeNext { [unowned self] array in
                self.poiList.value = array
                self.tableView.reloadData()
            }
            .addDisposableTo(disposeBag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return poiList.value.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        // Configure the cell...
        let cellIdentifier = "POIListCell";
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! POIListItemTableViewCell;
        
        let poi = poiList.value[indexPath.row];
        
        cell.poiTitle!.text = poi.AddressInfo.Title;
        cell.poiDistance!.text = String(poi.AddressInfo.Distance?.description) + poi.AddressInfo.DistanceUnit.debugDescription; //TODO: cope with nil
        cell.poiAddress!.text = poi.AddressInfo.AddressLine1;
        cell.poiStatus!.text = poi.DataProvider.Title;
        
        return cell;
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if(segue.identifier == "POIDetailsView") {
            
            var vc = segue.destinationViewController as! POIDetailViewController
            
        }
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("POIDetailsView", sender: self)
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    
    */
    
}
