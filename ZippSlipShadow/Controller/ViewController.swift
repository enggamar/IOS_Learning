//
//  ViewController.swift
//  ZippSlipShadow
//
//  Created by Amar Kumar on 25/03/20.
//  Copyright © 2020 Amar Kumar. All rights reserved.
//

import UIKit

class SplashController: UIViewController {

    override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            //This function is used to navigate to Login screen using segue
            self.performSegue(withIdentifier: Constants.LOGIN_SEGUE, sender: self)
        }

     }


}

