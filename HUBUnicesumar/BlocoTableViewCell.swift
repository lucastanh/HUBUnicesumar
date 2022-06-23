//
//  BlocoTableViewCell.swift
//  HUBUnicesumar
//
//  Created by Student on 12/05/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class BlocoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var blocoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
