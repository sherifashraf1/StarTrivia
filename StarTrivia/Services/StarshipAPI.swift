//
//  StarshipAPI.swift
//  StarTrivia
//
//  Created by Sherif on 2/10/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation
import Alamofire

class StarshipAPI {
    func getStarship(url : String , completion : @escaping StarshipCompletionHandler){
        guard let url = URL(string: url) else {return}
        AF.request(url).responseJSON { (response) in
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return completion(nil)}
            let jsonDecoder = JSONDecoder()
            do{
                let starship = try jsonDecoder.decode(Starship.self, from: data)
                completion(starship)
                
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
            
        }
    }
}
