//
//  StarshipsVCViewController.swift
//  StarTrivia
//
//  Created by Sherif on 1/30/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit

class StarshipsVC: UIViewController , PersonProtocol{

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var classLbl: UILabel!
    @IBOutlet weak var makerLbl: UILabel!
    @IBOutlet weak var hyperdriveLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    @IBOutlet weak var previousBtn: FadeEnabledBtn!
    @IBOutlet weak var nextBtn: FadeEnabledBtn!
    
    
    var person : Person!
    var starshipApi = StarshipAPI()
    var starships = [String]()
    var currentStarship = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        starships = person.starshipUrls
        previousBtn.isEnabled = false
        nextBtn.isEnabled = starships.count > 1
        guard let firstStarship = starships.first else { return }
        getStarship(url: firstStarship)
    }
    
    func getStarship(url : String){
        starshipApi.getStarship(url: url) { (starship) in
            if let starship = starship {
                self.setUpView(starship: starship)
            }
        }
    }
    
    func setUpView(starship : Starship){
        nameLbl.text = starship.name
        modelLbl.text = starship.model
        classLbl.text = starship.starshipClass
        makerLbl.text = starship.manufacturer
        hyperdriveLbl.text = starship.hyperdrive
        costLbl.text = starship.cost
        lengthLbl.text = starship.length
        speedLbl.text = starship.speed
        crewLbl.text = starship.crew
        passengersLbl.text = starship.passengers
    }
    
    
    @IBAction func didPressPrevious(_ sender: Any) {
        currentStarship -= 1
        setButtonState()
    }
    
    @IBAction func didPressNext(_ sender: Any) {
        currentStarship += 1
        setButtonState()
    }
    
    func setButtonState(){
        previousBtn.isEnabled = currentStarship == 0 ? false : true
        nextBtn.isEnabled = currentStarship == starships.count - 1 ? false : true
        getStarship(url: starships[currentStarship])
    }
    
}
