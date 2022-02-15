//
//  CharactersModel.swift
//  Project1
//
//  Created by Alberto Alegre Bravo on 11/2/22.
//

import Foundation
import UIKit


struct CharactersModel: Codable {
    
    let name: String
    let species: String
    let image: String
    

}


class ApiResponse {
    
    
    func getApiChars(completion: @escaping ([CharactersModel]) -> Void){
        if let url = URL(string: "http://hp-api.herokuapp.com/api/characters") {
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                  do {
                      let listHarryPotterCharacter = try JSONDecoder().decode([CharactersModel].self, from: data)
                      DispatchQueue.main.async {
                          completion(listHarryPotterCharacter)
                          //print("RES \(listHarryPotterCharacter)")
                      }
                  } catch let decodingError {
                     print(decodingError)
                  }
               }
           }.resume()
        }

    }

}




