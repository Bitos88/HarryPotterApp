//
//  ApiResponse.swift
//  Project1
//
//  Created by Alberto Alegre Bravo on 23/2/22.
//

import Foundation

class ApiResponse {
    
    func getApiCharacters(completion: @escaping ([CharactersModel]) -> Void) {

        
        if let url = URL(string: "http://hp-api.herokuapp.com/api/characters") {
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                  self.parseJson(completion: completion, data: data)
               }
           }.resume()
        }
    }
}

extension ApiResponse {
    
    private func parseJson(completion: @escaping ([CharactersModel]) -> Void, data: Data){
        do {
            let listHarryPotterCharacter = try JSONDecoder().decode([CharactersModel].self, from: data)
            DispatchQueue.main.async {
                completion(listHarryPotterCharacter)
            }
        } catch let decodingError {
           print(decodingError)
        }
    }
}
