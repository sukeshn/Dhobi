//
//  ClothesBundleTableViewCell.swift
//  Dhobi
//
//  Created by Sukesh Nemane on 29/04/17.
//  Copyright © 2017 Sukesh Nemane. All rights reserved.
//

import UIKit

class ClothesBundleTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
   
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var totalClothesLabel: UILabel!
    @IBOutlet weak var recievedOrGivenLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
