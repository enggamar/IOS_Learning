//
//  HomeController.swift
//  ZippSlipShadow
//
//  Created by Amar Kumar on 01/04/20.
//  Copyright © 2020 Amar Kumar. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    @IBAction func logoutClicked(_ sender: Any) {
       dismiss(animated: true, completion:nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.showPopUp(title: "Success", msg: "Login Successfully")

    }
    @objc func showPopUp(title:String,msg:String){
        
           let alert=UIAlertController(title:title, message: msg, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
               
           }))
           self.present(alert,animated: true,completion: nil)
       }

}
