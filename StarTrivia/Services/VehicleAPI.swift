//
//  VehicleAPI.swift
//  StarTrivia
//
//  Created by Sherif on 2/9/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation
import Alamofire

class VehicleAPI {
    func getVehicle(url : String  , completion : @escaping VehicleCompletionHandler){
        guard let url = URL(string: url) else { return }
        AF.request(url).responseJSON { (response) in
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return completion(nil) }
            let jsonDecoder = JSONDecoder()
            do {
                let vehcile = try jsonDecoder.decode(Vehicle.self, from: data)
                completion(vehcile)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
}
