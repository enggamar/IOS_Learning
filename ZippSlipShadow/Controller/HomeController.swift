//
//  HomeController.swift
//  ZippSlipShadow
//
//  Created by Amar Kumar on 01/04/20.
//  Copyright © 2020 Amar Kumar. All rights reserved.
//

import UIKit
import Firebase

class HomeController: UIViewController {
    

    @IBOutlet weak var chatTableView: UITableView!
    
    var message : [ ChatMessage ] = [
        ChatMessage(sender : "Amar",body : "Hello!!!!"),
        ChatMessage(sender : "Testing",body : "Hi!!!!"),
        ChatMessage(sender : "Quovantis",body : "Whatsapp!!!!"),
        ChatMessage(sender : "Appinventiv",body : "Hello!!!!")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatTableView.dataSource=self
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.hidesBackButton=true
        chatTableView.register(UINib(nibName: Constants.MESSAGE_CELL, bundle: nil), forCellReuseIdentifier: Constants.RESUABLE_CHAT_CELL)
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


    @IBAction func logoutAction(_ sender: UIBarButtonItem) {
        do{
            try Auth.auth().signOut()
            navigationController?.setNavigationBarHidden(true, animated: true)
            navigationController?.popToRootViewController(animated: true)
            
        }catch let signOutError as NSError {
            print("Error Signing Off: No ",signOutError)
        }
        
    }
}
extension HomeController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        message.count
    }
    
    // Call for each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.RESUABLE_CHAT_CELL, for: indexPath) as! MessageCell
        cell.messageText.text = message[indexPath.row].body
        return cell
    }
    
}

extension HomeController : UITableViewDelegate{
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}
