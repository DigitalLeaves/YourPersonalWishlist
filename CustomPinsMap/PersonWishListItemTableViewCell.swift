//
//  PersonWishListItemTableViewCell.swift
//  CustomPinsMap
//
//  Created by Ignacio Nieto Carvajal on 6/12/16.
//  Copyright © 2016 Ignacio Nieto Carvajal. All rights reserved.
//

import UIKit

class PersonWishListItemTableViewCell: UITableViewCell {
    // outlets
    @IBOutlet weak var itemNameLabel: UILabel!
    
    // data
    var itemName: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureWithItem(item: String) {
        self.itemName = item
        self.itemNameLabel?.text = item
    }
}
