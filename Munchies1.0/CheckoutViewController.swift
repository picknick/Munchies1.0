//
//  CheckoutViewController.swift
//  Munchies1.0
//
//  Created by Nicky on 5/1/16.
//  Copyright © 2016 Nicky. All rights reserved.
//

import UIKit
import MapKit

class CheckoutViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var restaurantMapView: MKMapView!
    @IBOutlet weak var checkoutTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        checkoutTableView.delegate = self;
        checkoutTableView.dataSource = self;
        var centerLocation = CLLocationCoordinate2DMake(33.682766, -117.78580999999997);
        var mapSpan = MKCoordinateSpanMake(0.01, 0.01);
        var mapRegion = MKCoordinateRegionMake(centerLocation, mapSpan);
        self.restaurantMapView.setRegion(mapRegion, animated: true);
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CheckoutCell", forIndexPath: indexPath) as! CheckoutTableViewCell
        return cell
    }

}
