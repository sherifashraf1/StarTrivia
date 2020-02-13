//
//  HomeworldVC.swift
//  StarTrivia
//
//  Created by Sherif on 1/30/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit

class HomeworldVC: UIViewController , PersonProtocol{
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var cliamateLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    var person : Person!
    let homeworldApi = HomeworldAPI()
    override func viewDidLoad() {
        super.viewDidLoad()
        homeworldApi.getHomeworld(url: person.homeworldUrl) { (homeworld) in
            if let homeworld = homeworld {
                self.setUpUi(homeworld: homeworld)
            }
        }
    }
  
    func setUpUi(homeworld : Homeworld){
        nameLbl.text = homeworld.name
        cliamateLbl.text = homeworld.climate
        terrainLbl.text = homeworld.terrain
        populationLbl.text = homeworld.population
    }
    
}
