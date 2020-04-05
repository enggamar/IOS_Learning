//
//  ViewController.swift
//  ZippSlipShadow
//
//  Created by Amar Kumar on 25/03/20.
//  Copyright © 2020 Amar Kumar. All rights reserved.
//

import UIKit

class SplashController: UIViewController {

    var isLogin : Bool = false
    override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let userDefault = UserDefaults.standard
            self.isLogin = userDefault.bool(forKey: Constants.UserDefaultKey.IS_LOGIN)
            //This function is used to navigate to Login screen using segue
            if self.isLogin{
                self.performSegue(withIdentifier: Constants.HOME_SEGUE, sender: self)
            } else {
                self.performSegue(withIdentifier: Constants.LOGIN_SEGUE, sender: self)
            }
        }

     }


}

