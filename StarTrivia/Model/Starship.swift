//
//  Starship.swift
//  StarTrivia
//
//  Created by Sherif on 2/10/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation

struct Starship: Codable {
    let name: String
    let model: String
    let starshipClass: String
    let manufacturer: String
    let hyperdrive: String
    let cost: String
    let length: String
    let speed: String
    let crew: String
    let passengers: String
    
    enum CodingKeys: String, CodingKey {
        case name, model, manufacturer, length, crew, passengers
        case cost = "cost_in_credits"
        case speed = "max_atmosphering_speed"
        case hyperdrive = "hyperdrive_rating"
        case starshipClass = "starship_class"
    }
}
