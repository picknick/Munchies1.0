//
//  RestaurantPropertiesViewController.swift
//  Munchies1.0
//
//  Created by Nicky on 4/20/16.
//  Copyright © 2016 Nicky. All rights reserved.
//

import UIKit

class RestaurantPropertiesViewController: UIViewController, UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate{
    var restaurantData : Data.Restaurant!;
    var svc : DishViewController!;
    var lastContentOffset : CGPoint!; //used for detecting whether the content offset has changed so you can change the color of the image background scrollview
    @IBOutlet weak var restaurantImageView: UIImageView! //this is the image on imageview
    @IBOutlet weak var restaurantTableView: UITableView! //this is the table view in charge of displaying the restaurant details
    @IBOutlet weak var titleImageScrollView: UIScrollView! //this is the scrollview in charge of the background image
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.navigationItem.title = restaurantData.name; //sets the title of the controller
        restaurantImageView.image = UIImage(named: restaurantData.restImage);
        titleImageScrollView.userInteractionEnabled = false;
        restaurantTableView.bounces = false; //disables the bounces of the up and down
        restaurantTableView.backgroundColor = UIColor.clearColor();
        restaurantTableView.delegate = self; //lets the controller handle the table view functions and set the data source of the table view as the view controller
        restaurantTableView.dataSource = self;
        lastContentOffset = restaurantTableView.contentOffset; //sets the initial content offset
        }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (2+restaurantData.dishes.count); //the first three rows handle the the name and address, and index 0 is a clear cell so you can scroll up and block the image
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        svc.dishData = restaurantData.dishes[indexPath.row - 2];
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //if the content offset has changed, then change the alpha of the background image so it becomes more see-through
        if(lastContentOffset.y > restaurantTableView.contentOffset.y)
        {
            restaurantImageView.alpha += 0.01;
        }
        else if(lastContentOffset.y < restaurantTableView.contentOffset.y)
        {
            restaurantImageView.alpha -= 0.01;
        }
        lastContentOffset = restaurantTableView.contentOffset;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "segueMtoD") //prepares the segue
        {
            svc = segue.destinationViewController as! DishViewController;
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.row == 0)
        {
            return 225; //the height of the background image, cell 0 is a clear cell so that the table view and the image can still be seen initially
        }
        else if (indexPath.row < 2)
        {
            return 75; //cell height for the rows that handle the name and the address
        }
        else
        {
            return 175; //cell ehight for the rows that handle the dish images
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RestaurantCell", forIndexPath: indexPath) as! RestaurantMenuTableViewCell
        cell.backgroundColor = UIColor.whiteColor();
        cell.restaurantImageView.contentMode = .ScaleToFill
        if(indexPath.row == 0)
        {
            cell.userInteractionEnabled = false; //disables the selection of the first cell
            cell.restaurantImageView.hidden = true; //hides the image and the title
            cell.restaurantLabel.hidden = true;
            cell.backgroundColor = UIColor.clearColor();
        }
        else if(indexPath.row == 1)
        {
            cell.userInteractionEnabled = false;
            cell.restaurantLabel.numberOfLines = 2; //makes the label two lines
            cell.restaurantLabel.text = "Address: \n" + restaurantData.address; //sets the text in the label
        }
        else
        {
            let entry = restaurantData.dishes[indexPath.row-2]; //goes through the dishes of a certain restaurant
            cell.restaurantImageView.image = UIImage(named: entry.dishImage);
            cell.restaurantLabel.text = entry.name;
            cell.restaurantLabel.backgroundColor = UIColor.whiteColor();
            cell.restaurantLabel.alpha = 0.5;
        }
        
        return cell
    }

}
