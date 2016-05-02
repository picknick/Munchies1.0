//
//  DishViewController.swift
//  Munchies1.0
//
//  Created by Nicky on 5/1/16.
//  Copyright © 2016 Nicky. All rights reserved.
//

import UIKit

class DishViewController: UIViewController, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource{
    var dishData : Data.Dish!;
    
    @IBOutlet weak var dishTable: UITableView!
    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var titleImageScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        titleImageScrollView.userInteractionEnabled = false;
        dishImage.image = UIImage(named: dishData.dishImage);
        dishTable.separatorStyle = .SingleLine;
        dishTable.bounces = false;
        dishTable.delegate = self;
        dishTable.dataSource = self;
        dishTable.backgroundColor = UIColor.clearColor();
        self.title = dishData.name;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.row == 0)
        {
            return 300;
        }
        else
        {
            return 75;
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DishCell", forIndexPath: indexPath) as! DishTableViewCell
        if(indexPath.row == 0)
        {
            cell.userInteractionEnabled = false;
            cell.backgroundColor = UIColor.clearColor();
            cell.dishHeadText.hidden = true;
            cell.dishBodyText.hidden = true;
        }
        else if(indexPath.row == 1)
        {
            cell.userInteractionEnabled = false;
            cell.dishHeadText.text = "Description";
            cell.dishBodyText.text = dishData.desc;
        }
        else if(indexPath.row == 2)
        {
            cell.dishHeadText.userInteractionEnabled = false;
            cell.dishHeadText.text = "Notes";
            cell.dishBodyText.userInteractionEnabled = true;
            cell.dishBodyText.textAlignment = .Left;
        }
        else
        {
            cell.userInteractionEnabled = false;
            cell.dishHeadText.text = "Cooking Time(Approx)";
            cell.dishBodyText.text = String(dishData.cookTime) + " minutes";
        }
        return cell
    }

}
