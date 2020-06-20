//
//  MenuController.swift
//  ZippSlipShadow
//
//  Created by Amar Kumar on 09/04/20.
//  Copyright © 2020 Amar Kumar. All rights reserved.
//

import UIKit



class MenuController: UITableViewController {
    
    var didTapMenuType: ((Constants.MenuType) -> Void)?

       override func viewDidLoad() {
           super.viewDidLoad()

           // Do any additional setup after loading the view.
       }
       

       override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = Constants.MenuType(rawValue: indexPath.row) else { return }
           dismiss(animated: true) { [weak self] in
               print("Dismissing: \(menuType)")
               self?.didTapMenuType?(menuType)
           }
       }
    
}

