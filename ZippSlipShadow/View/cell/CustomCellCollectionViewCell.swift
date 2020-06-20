//
//  CustomCellCollectionViewCell.swift
//  ZippSlipShadow
//
//  Created by Amar Kumar on 10/04/20.
//  Copyright © 2020 Amar Kumar. All rights reserved.
//

import UIKit

class CustomCellCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var cellLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }

    func setData(data : String){
        cellLabel.text = data
    }
    
}
