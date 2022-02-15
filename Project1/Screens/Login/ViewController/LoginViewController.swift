//
//  LoginViewController.swift
//  Project1
//
//  Created by Alberto Alegre Bravo on 12/2/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet var userNameLabel: UITextField!
    @IBOutlet var passwordLabel: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    
    private func validateLogin() {
        if(userNameLabel.text == "" && passwordLabel.text == "" )
          {
            let storyBoard: UIStoryboard = UIStoryboard(name: "ListViewController", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
            
            navigationController?.setViewControllers([newViewController], animated: true)
            //self.present(newViewController, animated: true, completion: nil)
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
    
    
    @IBAction func loginActionButton(_ sender: Any) {
        
        validateLogin()
        }
        
                
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
}
