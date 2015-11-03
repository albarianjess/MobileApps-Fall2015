//
//  PlacesTableViewCell.swift
//  Project2
//
//  Created by Jessie Albarian on 10/22/15.
//  Copyright (c) 2015 Albarian. All rights reserved.
//

import UIKit

class PlacesTableViewCell: UITableViewCell {

    
    // Properties
    

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
