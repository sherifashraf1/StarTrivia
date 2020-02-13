//
//  ViewController.swift
//  StarTrivia
//
//  Created by Sherif on 1/16/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit
class SelectPersonVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var hairLbl: UILabel!
    @IBOutlet weak var birthYearLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var homeworldBtn: UIButton!
    @IBOutlet weak var vehiclesBtn: UIButton!
    @IBOutlet weak var starshipsBtn: UIButton!
    @IBOutlet weak var filmsBtn: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var personApi = PersonAPI()
    var person : Person!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    func setUpView(person : Person) {
        nameLbl.text = person.name
        heightLbl.text = person.height
        massLbl.text = person.mass
        hairLbl.text = person.hair
        birthYearLbl.text = person.birthYear
        genderLbl.text = person.gender
        homeworldBtn.isEnabled = !person.homeworldUrl.isEmpty
        vehiclesBtn.isEnabled = !person.vechileUrls.isEmpty
        starshipsBtn.isEnabled = !person.starshipUrls.isEmpty
        filmsBtn.isEnabled = !person.filmUrls.isEmpty
    }
    
    
    @IBAction func randomClicked(_ sender: Any) {
        activityIndicator.startAnimating()
        let random = Int.random(in: 1 ... 87)
        personApi.getRandomPersonAlamoWithCdoable(id: random) { (person) in
            self.activityIndicator.stopAnimating()
            if let person = person {
                self.setUpView(person: person)
                self.person = person
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if var destination = segue.destination as? PersonProtocol {
            destination.person = person
        }
        
//        switch segue.identifier {
//        case Segue.homeworld.rawValue:
//            if let destination = segue.destination as? HomeworldVC{
//                destination.person = person
//            }
//        case Segue.vehicles.rawValue:
//            if let destination = segue.destination as? VehiclesVC{
//                destination.person = person
//            }
//        case Segue.starships.rawValue :
//            if let destination = segue.destination as? StarshipsVC{
//                destination.person = person
//            }
//        case Segue.films.rawValue :
//            if let destiantoin = segue.destination as? FilmsVC{
//                destiantoin.person = person
//            }
//        default :
//            break
//        }
       
    }
    
//    enum Segue : String {
//        case homeworld = "toHomeworld"
//        case vehicles = "toVehicles"
//        case starships = "toStarships"
//        case films = "toFilms"
//    }

}

protocol PersonProtocol {
    var person : Person! {get set}
}
