//
//  IntermediateNavController.swift
//  Propoma
//
//  Created by Alysson Moreira on 29/01/19.
//  Copyright © 2019 Mateus Sales. All rights reserved.
//

import UIKit

class IntermediateNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tabBarController?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        let baseVC = self.viewControllers.first as! BaseViewController
//
//        let selectedTab = self.tabBarController!.selectedIndex
//        let mode = ControllerMode(rawValue: selectedTab)
////        self.title = mode?.title
//
//        print(mode?.title)
//        baseVC.mode = mode
        
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

extension IntermediateNavController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let index: Int! = tabBarController.viewControllers!.firstIndex(of: viewController)!
        
        
        let baseVC = self.viewControllers.first as! BaseViewController
        
        let mode = ControllerMode(rawValue: index!)
        //        self.title = mode?.title
        baseVC.mode = mode
        
    }
}
