//
//  RestaurantCell.swift
//  Yelp
//
//  Created by Elaine Mao on 4/25/15.
//  Copyright (c) 2015 Elaine Mao. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {

    @IBOutlet weak var restaurantLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cuisineLabel: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var ratingImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        restaurantLabel.preferredMaxLayoutWidth = restaurantLabel.frame.size.width
        restaurantImage.layer.cornerRadius = 3
        restaurantImage.clipsToBounds = true
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        restaurantLabel.preferredMaxLayoutWidth = restaurantLabel.frame.size.width
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
