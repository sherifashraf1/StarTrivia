//
//  Vehicle.swift
//  StarTrivia
//
//  Created by Sherif on 2/9/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation

struct Vehicle : Codable {
    let name: String
    let model: String
    let manufacturer: String
    let cost: String
    let length: String
    let speed: String
    let crew: String
    let passengers: String
  
    
    enum CodingKeys: String, CodingKey {
        case name, model, manufacturer, length, crew, passengers
        case cost = "cost_in_credits"
        case speed = "max_atmosphering_speed"
    }
}
