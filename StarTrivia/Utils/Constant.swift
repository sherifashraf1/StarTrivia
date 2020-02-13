//
//  Constant.swift
//  StarTrivia
//
//  Created by Sherif on 1/16/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit

let BLACK_BG = UIColor.black.withAlphaComponent(0.6).cgColor
let URL_BASE = "https://swapi.co/api/"
let PERSON_URL = URL_BASE + "people/"
typealias personCompletionHandler = ((Person?) -> ())
typealias HomeowrldCompletionHandler = ((Homeworld?) -> ())
typealias VehicleCompletionHandler = ((Vehicle?) -> ())
typealias StarshipCompletionHandler = ((Starship?) -> ())
typealias FilmCompletionHandler = ((Film?) -> ())


