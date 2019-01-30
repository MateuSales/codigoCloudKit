//
//  CustomTabBarController.swift
//  Propoma
//
//  Created by Alysson Moreira on 29/01/19.
//  Copyright © 2019 Mateus Sales. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navVC = self.viewControllers?.first as! IntermediateNavController
        
        let vc = navVC.viewControllers.first as! BaseViewController
        vc.mode = ControllerMode(rawValue: 0)
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let navVC = self.viewControllers?.first as! IntermediateNavController
        
        let vc = navVC.viewControllers.first as! BaseViewController
        let selectedItem = self.tabBar.selectedItem!
        let index = self.tabBar.items?.firstIndex(of: selectedItem )
        
        vc.mode = ControllerMode(rawValue: index!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CustomTabBarController: UITabBarControllerDelegate {


    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let index = self.viewControllers!.firstIndex(of: viewController)!
        
        let navVC = viewController as! IntermediateNavController
        let vc = navVC.viewControllers.first as! BaseViewController
        vc.mode = ControllerMode(rawValue: index)
        
        
    }
    
}
