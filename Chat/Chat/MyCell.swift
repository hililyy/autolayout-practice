//
//  MyCell.swift
//  Chat
//
//  Created by 강조은 on 2023/04/23.
//

import UIKit

class MyCell: UITableViewCell {
    
    @IBOutlet weak var myTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
