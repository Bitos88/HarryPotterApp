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
            //MARK: Navigate if condition is true
            
            //MARK: instantiate ListStoryBoard
            let listStoryBoard: UIStoryboard = UIStoryboard(name: "ListViewController", bundle: nil)
            let collectionStoryBoard: UIStoryboard = UIStoryboard(name: "CollectionViewController", bundle: nil)
            
            //MARK: instantiate viewController of the storyBoard
            let listViewController = listStoryBoard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
            listViewController.tabBarItem = UITabBarItem(title: "Lista", image: UIImage(systemName: "list.bullet.indent"), tag: 0)
            
            //MARK: collectionView
            let collectionViewController = collectionStoryBoard.instantiateViewController(withIdentifier: "CollectionViewController") as! CollectionViewController
            collectionViewController.tabBarItem = UITabBarItem(title: "Collection", image: UIImage(systemName: "list.bullet.rectangle.fill"), tag: 1)
        
            
            
            //MARK: TABBAR
            let tabBarController = UITabBarController()
            tabBarController.setViewControllers([listViewController, collectionViewController], animated: false)
            
            
            //MARK: navigate to newViewController(screen)
            navigationController?.setViewControllers([tabBarController], animated: true)
            
        }
        else
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
