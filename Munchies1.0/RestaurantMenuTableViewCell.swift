//
//  RestaurantMenuTableViewCell.swift
//  Munchies1.0
//
//  Created by Nicky on 4/19/16.
//  Copyright © 2016 Nicky. All rights reserved.
//

import UIKit

class RestaurantMenuTableViewCell: UITableViewCell {
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var restaurantLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
}
