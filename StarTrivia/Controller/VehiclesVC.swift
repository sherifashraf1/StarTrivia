//
//  VehiclesVC.swift
//  StarTrivia
//
//  Created by Sherif on 1/30/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController , PersonProtocol {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var manufactureLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengerLbl: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    var person : Person!
    let vehicleApi = VehicleAPI()
    var vehicles = [String]()
    var currentVehicle = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vehicles =  person.vechileUrls
        previousBtn.isEnabled = false
        nextBtn.isEnabled = vehicles.count > 1
        
        guard let firstVehicle = vehicles.first else { return }
        getVehicle(url: firstVehicle)
    }
    
    func getVehicle(url : String){
        vehicleApi.getVehicle(url: url) { (vehicle) in
            if let vehicle = vehicle {
                self.setUpUi(vehicle: vehicle)
            }
        }
    }
    
    
    func setUpUi(vehicle : Vehicle){
        nameLbl.text =  vehicle.name
        modelLbl.text = vehicle.model
        manufactureLbl.text =  vehicle.manufacturer
        costLbl.text = vehicle.cost
        lengthLbl.text = vehicle.length
        speedLbl.text = vehicle.speed
        crewLbl.text = vehicle.crew
        passengerLbl.text = vehicle.passengers
    }
    
    @IBAction func didPressPrevious(_ sender: Any) {
        currentVehicle -= 1
            setButtonState()
    }
    
    
    @IBAction func didPressNext(_ sender: Any) {
        currentVehicle += 1
        setButtonState()
    }
    
    
    func setButtonState(){
        
//        if currentVehicle == 0 {
//            previousBtn.isEnabled = false
//        } else {
//            previousBtn.isEnabled = true
//        }
//
//        if currentVehicle == vehicles.count - 1 {
//            nextBtn.isEnabled = false
//        } else {
//            nextBtn.isEnabled = true
//        }
        
        previousBtn.isEnabled = currentVehicle == 0 ? false : true
        nextBtn.isEnabled = currentVehicle == vehicles.count - 1 ? false : true
        getVehicle(url: vehicles[currentVehicle])
    }
    
}
