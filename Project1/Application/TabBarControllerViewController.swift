//
//  TabBarControllerViewController.swift
//  Project1
//
//  Created by Alberto Alegre Bravo on 15/2/22.
//

import Foundation
import UIKit

//class TabBarControllerViewController: UITabBarController, UITabBarControllerDelegate {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        delegate = self
//        
//        let listViewStoryboard = UIStoryboard(name: "ListViewController", bundle: nil)
//
//        let firstViewController = listViewStoryboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
//        
//               let navigationController = UINavigationController(rootViewController: firstViewController)
//               navigationController.title = "First"
//               navigationController.tabBarItem.image = UIImage.init(named: "map-icon-1")
//
//              viewControllers = [navigationController]
//
//    }
//
//    //Delegate methods
//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        print("Should select viewController: \(viewController.title ?? "") ?")
//        return true;
//    }
//}
