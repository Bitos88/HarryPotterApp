//
//  LoginViewController.swift
//  Project1
//
//  Created by Alberto Alegre Bravo on 12/2/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet var userNameLabel: UITextField!
    @IBOutlet var passwordLabel: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    //MARK: IBActions
    @IBAction func loginActionButton(_ sender: Any) {
        
        validateLogin()
    }
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}

//MARK: Extension with login validate function
extension LoginViewController {
    
    private func validateLogin() {
        if(userNameLabel.text == "" && passwordLabel.text == "" )
        {
            
            //MARK: LISTVIEW
            let listStoryBoard: UIStoryboard = UIStoryboard(name: "ListViewController", bundle: nil)
            let listViewController = listStoryBoard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
            listViewController.tabBarItem = UITabBarItem(title: "Lista", image: UIImage(systemName: "list.bullet.indent"), tag: 0)
            let listNavigationController = UINavigationController(rootViewController: listViewController)
            
            //MARK: COLLECTIONVIEW
            let collectionStoryBoard: UIStoryboard = UIStoryboard(name: "CollectionViewController", bundle: nil)
            let collectionViewController = collectionStoryBoard.instantiateViewController(withIdentifier: "CollectionViewController") as! CollectionViewController
            collectionViewController.tabBarItem = UITabBarItem(title: "Collection", image: UIImage(systemName: "list.bullet.rectangle.fill"), tag: 1)
            let collectionNavigationController = UINavigationController(rootViewController: collectionViewController)
            
            
            //MARK: AboutView
            let aboutStoryBoard: UIStoryboard = UIStoryboard(name: "AboutViewController", bundle: nil)
            let aboutViewController = aboutStoryBoard.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
            aboutViewController.tabBarItem = UITabBarItem(title: "Abour", image: UIImage(systemName: "list.bullet.indent"), tag: 2)
            
            
            //MARK: TABBAR
            let tabBarController = UITabBarController()
            tabBarController.setViewControllers([listNavigationController, collectionNavigationController, aboutViewController], animated: false)
            tabBarController.modalPresentationStyle = .fullScreen
            
            
            //MARK: navigate to newViewController(screen)
            self.present(tabBarController, animated: true, completion: nil)
            
        }else
        {
            let alert = UIAlertController(title: "BAD LOGIN", message: "Por favor inténtelo de nuevo", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                @unknown default:
                    fatalError()
                }
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
