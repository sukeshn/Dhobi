//
//  PaymentHistoryTableViewCell.swift
//  Dhobi
//
//  Created by Sukesh Nemane on 21/08/17.
//  Copyright © 2017 Sukesh Nemane. All rights reserved.
//

import UIKit

class PaymentRecordTableViewCell: UITableViewCell {

    @IBOutlet weak var monthYearLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var datePaidLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
