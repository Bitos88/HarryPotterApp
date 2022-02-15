//
//  ListCellTableViewCell.swift
//  Project1
//
//  Created by Alberto Alegre Bravo on 11/2/22.
//

import UIKit

class ListCellTableViewCell: UITableViewCell {
    
    
    //MARK: IBOutlets
    @IBOutlet var cellLabel: UILabel!
    @IBOutlet var listImage: UIImageView!
    @IBOutlet var spicesLabel: UILabel!
    
    
    //MARK: LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
