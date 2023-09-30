//
//  TotalTableViewCell.swift
//  CL1_T6YN_DAMII
//
//  Created by Sadohu on 29/09/23.
//

import UIKit

class TotalTableViewCell: UITableViewCell {
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var precTotal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
