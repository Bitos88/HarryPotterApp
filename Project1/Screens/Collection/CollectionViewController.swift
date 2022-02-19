//
//  CollectionViewController.swift
//  Project1
//
//  Created by Alberto Alegre Bravo on 19/2/22.
//

import UIKit

class CollectionViewController: UIViewController {
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    
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
        

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.setCollectionViewLayout(layout, animated: true)
    }

}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewControllerCell", for: indexPath) as? CollectionViewControllerCell else {fatalError()}
        
        cell.collLabel.text = "BITO"
        
        return cell
    }
    
    
}

extension CollectionViewController: UICollectionViewDelegate {
    
}
