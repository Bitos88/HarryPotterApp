//
//  ListViewController.swift
//  Project1
//
//  Created by Alberto Alegre Bravo on 11/2/22.
//

import UIKit

class ListViewController: UIViewController {
    
    
    var chars = [CharactersModel]()
    var response = ApiResponse()
    let cellLabel = ListCellTableViewCell()
    
    //MARK: IBOutlets
    @IBOutlet var tableView: UITableView!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "LISTA"
        showAPICharacters()

    }
}


extension ListViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ListCellTableViewCell
        
        cell.cellLabel.text = chars[indexPath.row].name
        cell.spicesLabel.text = chars[indexPath.row].species
        cell.listImage.load(urlString: chars[indexPath.row].image)
        
           
           return cell
        
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    
   
}

extension ListViewController: UITableViewDelegate {
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyboard = UIStoryboard(name: "DetailViewController", bundle: nil)
        
        guard let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {return}
        
        detailVC.title = "\(chars[indexPath.row].name)"
        
        detailVC.char = chars[indexPath.row]
        
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)

    }
    

}

//MARK: Extesion with Apiresponse & LogOut Navigation

extension ListViewController {
    
    
    //MARK: NAVIGATION LOG OUT
    private func navigationConfigure(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector (tappedButton))
    }
    
    @objc func tappedButton() {
        let loginScreen = UIStoryboard(name: "LoginViewController", bundle: nil)

        guard let loginViewController = loginScreen.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {return}

        navigationController?.setViewControllers([loginViewController], animated: true)
        }
    
    //MARK: APIRESPONSE FUNC
    private func showAPICharacters() {
        response.getApiChars { listCharacter in
            for character in listCharacter {
                self.chars.append(character)
            }
            self.tableView.reloadData()
            self.navigationConfigure()
        }
    }
}
