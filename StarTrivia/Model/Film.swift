//
//  Film.swift
//  StarTrivia
//
//  Created by Sherif on 2/13/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation
struct Film: Codable {
    let title: String
    let episode: Int
    let crwal, director, producer, releaseDate: String
   
    
    enum CodingKeys: String, CodingKey {
        case title
        case episode = "episode_id"
        case crwal = "opening_crawl"
        case director, producer
        case releaseDate = "release_date"
    }
}
