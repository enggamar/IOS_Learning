//
//  HomeController.swift
//  ZippSlipShadow
//
//  Created by Amar Kumar on 01/04/20.
//  Copyright © 2020 Amar Kumar. All rights reserved.
//

import UIKit
import Firebase
import IQKeyboardManager

class HomeController: UIViewController {
    
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var chatTableView: UITableView!
    
    let db = Firestore.firestore()
    var message : [ ChatMessage ] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initilization()
        loadMessage()
    }
    
    func initilization(){
        chatTableView.dataSource=self
        navigationItem.title = Constants.CHAT_SCREEN
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.hidesBackButton=true
        IQKeyboardManager.shared().shouldResignOnTouchOutside = true
        chatTableView.register(UINib(nibName: Constants.MESSAGE_CELL, bundle: nil), forCellReuseIdentifier: Constants.RESUABLE_CHAT_CELL)
    }
    
    func loadMessage() {
        db.collection(Constants.FStore.COLLECTION_NAME)
            .order(by: Constants.FStore.dateField)
            .addSnapshotListener { (querySnapshot, error) in
                self.message = []
            if let e = error {
                print("There was an issue retrieving data from Firestore. \(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                    if let sender = data[Constants.FStore.SENDER_FIELD] as? String, let messagebody = data[Constants.FStore.BODY_FIELD] as? String {
                    let messageItem = ChatMessage(sender: sender, body: messagebody)
                    self.message.append(messageItem)
                    DispatchQueue.main.async {
                        self.chatTableView.reloadData()
                        let indexPath = IndexPath(row: self.message.count-1
                            , section: 0)
                        self.chatTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
                    }
                        }
                    }
                }
            }
        }
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


    @IBAction func sendMessageButtonPressed(_ sender: UIButton) {
        
        if let messageBody = messageTextField.text, let messageSender=Auth.auth().currentUser?.email{
            db.collection(Constants.FStore.COLLECTION_NAME).addDocument(data: [Constants.FStore.SENDER_FIELD:messageSender,Constants.FStore.BODY_FIELD:messageBody,Constants.FStore.dateField: Date().timeIntervalSince1970]) { (error) in
                if let e = error {
                    print("There was a issue in saving data in file store,\(e)")
                }else{
                    print("Saved Successfully")
                    DispatchQueue.main.async {
                        self.messageTextField.text=""
                    }
                    
                }
                
                
            }
        }
        
        
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
        let messageItem = message[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.RESUABLE_CHAT_CELL, for: indexPath) as! MessageCell
        cell.messageText.text = message[indexPath.row].body

        if messageItem.sender == Auth.auth().currentUser?.email{
            cell.leftImage.isHidden=true
            cell.rightImage.isHidden=false
            cell.messageBubble.backgroundColor = UIColor(hex: 0x20BEAD, alpha: 1)
        }else {
            cell.leftImage.isHidden=false
            cell.rightImage.isHidden=true
            cell.messageBubble.backgroundColor = UIColor(hex: 0x20BEAD, alpha: 0.2)
            
        }
        return cell
    }
    
}

extension HomeController : UITableViewDelegate{
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}
