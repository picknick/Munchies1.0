//
//  RestaurantTableViewCell.swift
//  Munchies1.0
//
//  Created by Nicky on 4/18/16.
//  Copyright © 2016 Nicky. All rights reserved.
//

import UIKit

class RestaurantsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
}
