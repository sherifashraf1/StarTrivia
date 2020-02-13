//
//  FilmAPI.swift
//  StarTrivia
//
//  Created by Sherif on 2/13/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation
import Alamofire

class FilmAPI {
    
    func getFilm(url : String , completion : @escaping FilmCompletionHandler){
        guard let url = URL(string: url) else { return }
        AF.request(url).responseJSON { (reponse) in
            if let error = reponse.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = reponse.data else {return completion(nil)}
            let jsonDecoder = JSONDecoder()
            
            do {
                let film = try jsonDecoder.decode(Film.self, from: data)
                completion(film)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
        
    }
}
