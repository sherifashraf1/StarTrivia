//
//  Person.swift
//  StarTrivia
//
//  Created by Sherif on 1/19/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation
struct Person : Codable {
    let name : String
    let height : String
    let mass : String
    let hair : String
    let birthYear : String
    let gender : String
    let homeworldUrl : String
    let filmUrls : [String]
    let vechileUrls : [String]
    let starshipUrls : [String]
    
    enum CodingKeys: String, CodingKey {
        case name, height, mass, gender
        case hair = "hair_color"
        case birthYear = "birth_year"
        case homeworldUrl = "homeworld"
        case filmUrls = "films"
        case vechileUrls = "vehicles"
        case starshipUrls = "starships"
        
    }
    
}
