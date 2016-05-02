//
//  LikesTableViewController.swift
//  Munchies1.0
//
//  Created by Nicky on 5/1/16.
//  Copyright © 2016 Nicky. All rights reserved.
//

import UIKit

class LikesTableViewController: UITableViewController { //exactly the same as restaurantstableview but it deals with all the likes of the user instead of all the restaurants
    let data = Data()
    var svc: RestaurantPropertiesViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Likes";
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
        
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.likes.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        svc.restaurantData = data.likes[indexPath.row];
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 300;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "segueRtoD")
        {
            svc = segue.destinationViewController as! RestaurantPropertiesViewController;
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RestaurantsCell", forIndexPath: indexPath) as! RestaurantsTableViewCell
        let entry = data.likes[indexPath.row]
        let image = UIImage(named: entry.restImage)
        cell.restaurantImageView.image = image
        cell.restaurantName.text = entry.name
        cell.restaurantName.backgroundColor = UIColor.whiteColor();
        cell.restaurantName.alpha = 0.45;
        return cell
    }
}
