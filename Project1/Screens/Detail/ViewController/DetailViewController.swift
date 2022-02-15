//
//  DetailViewController.swift
//  Project1
//
//  Created by Alberto Alegre Bravo on 14/2/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var char: CharactersModel?
    
    //MARK: IBOutlets
    @IBOutlet var detailImage: UIImageView!
    @IBOutlet var detailLabel: UILabel!
    
    //MARK: LifyCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        detailLabel.text = char?.name
        detailImage.load(urlString: char?.image ?? "")
    }
    


}
