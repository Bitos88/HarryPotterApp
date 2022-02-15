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
            let storyBoard: UIStoryboard = UIStoryboard(name: "ListViewController", bundle: nil)
            
            //MARK: instantiate viewController of the storyBoard
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
            
            //MARK: navigate to newViewController(screen)
            navigationController?.setViewControllers([newViewController], animated: true)
            
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
