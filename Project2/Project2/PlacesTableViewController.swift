//
//  PlacesTableViewController.swift
//  Project2
//
//  Created by Jessie Albarian on 10/22/15.
//  Copyright (c) 2015 Albarian. All rights reserved.
//

import UIKit

class PlacesTableViewController: UITableViewController {

    
    let cellIdentifier = "PlacesTableViewCell"
    var place = [Places]()
    
    @IBAction func unwindSegue (segue:UIStoryboardSegue){
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPlacesInfo()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    
    func loadPlacesInfo(){
        
        let photo1 = UIImage(named: "building")
        let cellStuff1 = Places(title: "Buildings", photo: photo1!)
        
        let photo2 = UIImage(named: "library")
        let cellStuff2 = Places(title: "Libraries", photo: photo2!)
        
        let photo3 = UIImage(named: "cafes")
        let cellStuff3 = Places(title: "Coffee", photo: photo3!)
        
        let photo4 = UIImage(named: "food")
        let cellStuff4 = Places(title: "Food", photo: photo4!)
        
        let photo5 = UIImage(named: "cunightride")
        let cellStuff5 = Places(title: "CU Night Ride", photo: photo5!)
        
        
        place += [cellStuff1, cellStuff2, cellStuff3, cellStuff4, cellStuff5]
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return place.count
    }

    
    /*override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let placez = place[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        cell.mainLabel.text = place.title
        cell.mainImage.image = place.photo

        return cell
    }*/
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        
        let cellIdentifier = "PlacesTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! PlacesTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let stuff = place[indexPath.row]
        
        cell.mainLabel.text = stuff.title
        cell.mainImage.image = stuff.photo
        
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
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
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
