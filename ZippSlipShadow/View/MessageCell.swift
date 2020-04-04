//
//  MessageCell.swift
//  ZippSlipShadow
//
//  Created by Amar Kumar on 03/04/20.
//  Copyright © 2020 Amar Kumar. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var messageText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        messageBubble.layer.cornerRadius=20
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
