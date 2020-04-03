//
//  Utils.swift
//  ZippSlipShadow
//
//  Created by Amar Kumar on 28/03/20.
//  Copyright © 2020 Amar Kumar. All rights reserved.
//
import UIKit
class Utils:UIViewController{
    
    func hideKeyboardWhenTappedAround() {
           let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
           tap.cancelsTouchesInView = false
           view.addGestureRecognizer(tap)
       }

       @objc func dismissKeyboard() {
           view.endEditing(true)
       }
    
}
