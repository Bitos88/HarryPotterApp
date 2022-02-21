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
    
    @IBOutlet var spicesLabel: UILabel!
    
    @IBOutlet var birthLabel: UILabel!
    @IBOutlet var actorLabel: UILabel!
    
    //MARK: LifyCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        detailLabel.text = "House: \(char?.house ?? "No House")"
        detailImage.load(urlString: char?.image ?? "")
        spicesLabel.text = "Specie: \(char?.species ?? "Unknowerd")"
        birthLabel.text = "Date Of Birth: \(char?.dateOfBirth ?? "Unknowed")"
        actorLabel.text = "Actor: \(char?.actor ?? "Unknowed actor name")"
    }
    


}
