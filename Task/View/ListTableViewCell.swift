//
//  ListTableViewCell.swift
//  Task
//
//  Created by MAHENDRAN on 20/05/23.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var descripLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
