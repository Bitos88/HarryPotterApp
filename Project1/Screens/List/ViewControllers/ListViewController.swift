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
        cell.listImage.setPlaceHolder(placeHolderImg: "bghp")
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
    
    private func markAsFavourite() {
        
    }
    
    private func deleteSelection(indexPath: IndexPath) {
        chars.remove(at: indexPath.row)
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .normal, title: "Delete") { [weak self] (action, view, completionHandler) in
            self?.deleteSelection(indexPath: indexPath)
            completionHandler(true)
        }
        action.backgroundColor = .systemRed
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    
    
}

//MARK: Extesion with Apiresponse & LogOut Navigation

extension ListViewController {
    
    
    //MARK: NAVIGATION LOG OUT
    private func navigationConfigure(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector (tappedButton))
    }
    
    @objc func tappedButton() {
        
        navigationController?.dismiss(animated: true, completion: nil)
        
    }
    
    //MARK: APIRESPONSE FUNC
    private func showAPICharacters() {
        response.getApiCharacters { listCharacter in
            for character in listCharacter {
                self.chars.append(character)
            }
            self.tableView.reloadData()
            self.navigationConfigure()
        }
    }
}
