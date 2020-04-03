//
//  MessageCell.swift
//  ZippSlipShadow
//
//  Created by Amar Kumar on 03/04/20.
//  Copyright © 2020 Amar Kumar. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var senderImage: UIImageView!
    @IBOutlet weak var messageText: UILabel!
    @IBOutlet weak var MessageBubble: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
