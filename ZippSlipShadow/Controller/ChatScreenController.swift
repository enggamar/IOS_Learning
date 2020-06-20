//
//  ChatScreenController.swift
//  ZippSlipShadow
//
//  Created by Amar Kumar on 08/04/20.
//  Copyright © 2020 Amar Kumar. All rights reserved.
//

import UIKit

class  ChatScreenController :UIViewController {


    override func viewDidLoad() {
         super.viewDidLoad()

     }

    @IBAction func chatButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.HOME_SEGUE, sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.hidesBackButton = false

    }
    

}

