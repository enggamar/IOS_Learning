//
//  TabBarController.swift
//  ZippSlipShadow
//
//  Created by Amar Kumar on 08/04/20.
//  Copyright © 2020 Amar Kumar. All rights reserved.
//

import UIKit

class TabBarController : UITabBarController{
    
    let transition = SideInTransition()
    
    override func viewDidLoad() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.hidesBackButton = true
    }
    
  
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.selectedIndex = 1

    }
    @IBAction func menuIconClicked(_ sender: UIBarButtonItem) {
        
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: Constants.MENU_CONTROLLER) as? MenuController else { return }
        //               menuViewController.didTapMenuType = { menuType in
        //                   self.transitionToNew(menuType)
        //               }
               menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
            present(menuViewController,animated: true)
    }
}

extension TabBarController : UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresent = true
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresent = false
        return transition
    }
}
