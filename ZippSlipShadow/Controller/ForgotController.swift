//
//  ForgotController.swift
//  ZippSlipShadow
//
//  Created by Amar Kumar on 28/03/20
//  Copyright © 2020 Amar Kumar. All rights reserved.
//

import UIKit

class ForgotController: UIViewController{
    
    
    @IBOutlet weak var ic_back: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
           self.hideKeyboardWhenTappedAround()
        setOnClickImg()
       
    }
    
    func setOnClickImg(){
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(perFormImageClickAction))
        ic_back.isUserInteractionEnabled = true
    ic_back.addGestureRecognizer(singleTap)
    }

    @objc func perFormImageClickAction(){
        dismiss(animated: true, completion: nil)

    }

}
