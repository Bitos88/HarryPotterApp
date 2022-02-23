//
//  Extensions.swift
//  Project1
//
//  Created by Alberto Alegre Bravo on 15/2/22.
//

import Foundation
import UIKit


extension UIImageView {
    func load(urlString : String) {
        guard let url = URL(string: urlString) else {
            return
        }
        print("Begin")
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    print("Hilo \(urlString)")
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
        print("End")
    }
}

//EXTENSION con una funcion setPlaceHolder(String: con imagen local)


extension UIImageView {
    func setPlaceHolder(placeHolderImg: String){
        self.image = UIImage(named: placeHolderImg)
    }
}
