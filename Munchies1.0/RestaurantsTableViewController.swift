//
//  RestaurantTableViewController.swift
//  Munchies1.0
//
//  Created by Nicky on 4/18/16.
//  Copyright © 2016 Nicky. All rights reserved.
//

import UIKit

class RestaurantsTableViewController: UITableViewController { //taken from an array of restaurants in the area
    let data = Data() //instantiate the data to be passed through the controllers and segues
    var svc: RestaurantPropertiesViewController! //creates an instance of type of the next controller
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Munchies"; //sets the initial title of the app
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None //sets the separator style of the table views
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.restaurants.count //sets the number of restaurants in the table
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        svc.restaurantData = data.restaurants[indexPath.row]; //detects the selection of the rows and instantiates the restaurantData to send into the next controller
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 300;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "segueRtoD") //detects which segue is being used
        {
            svc = segue.destinationViewController as! RestaurantPropertiesViewController; //instantiates the object in the next controller
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RestaurantsCell", forIndexPath: indexPath) as! RestaurantsTableViewCell
        let entry = data.restaurants[indexPath.row]
        let image = UIImage(named: entry.restImage)
        cell.restaurantImageView.image = image //sets the image of the restaurantImage
        cell.restaurantName.text = entry.name //this and the text under it instnatiates the restaurantName label
        cell.restaurantName.backgroundColor = UIColor.whiteColor();
        cell.restaurantName.alpha = 0.45;
        return cell
    }
}
