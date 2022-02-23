//
//  CollectionViewController.swift
//  Project1
//
//  Created by Alberto Alegre Bravo on 19/2/22.
//

import UIKit

class CollectionViewController: UIViewController {
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    var chars = [CharactersModel]()
    var response = ApiResponse()
    
    
    private var layout: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 30, right: 10)
        let width = (collectionView.frame.width / 2) - (layout.minimumInteritemSpacing / 2) - layout.sectionInset.left

                
        layout.itemSize = CGSize(width: width, height: 280)
        
        return layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(.init(nibName: "CollectionViewControllerCell", bundle: .main), forCellWithReuseIdentifier: "CollectionViewControllerCell")
        
        showAPICharacters()
        

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.setCollectionViewLayout(layout, animated: true)
    }

}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        chars.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewControllerCell", for: indexPath) as? CollectionViewControllerCell else {fatalError()}
        
        cell.collLabel.text = chars[indexPath.row].name
        cell.collImage.load(urlString: chars[indexPath.row].image)
        
        return cell
    }
    
    
}

extension CollectionViewController: UICollectionViewDelegate {
    
}


extension CollectionViewController {
    private func showAPICharacters() {
        response.getApiCharacters { listCharacter in
            for character in listCharacter {
                self.chars.append(character)
            }
            self.collectionView.reloadData()
        }
    }
}
