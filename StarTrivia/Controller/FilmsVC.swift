//
//  FilmsVC.swift
//  StarTrivia
//
//  Created by Sherif on 1/30/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit

class FilmsVC: UIViewController, PersonProtocol {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var episodeLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var producerLbl: UILabel!
    @IBOutlet weak var releasedLbl: UILabel!
    @IBOutlet weak var crwalTextView: UITextView!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var person : Person!
    var films = [String]()
    var filmApi = FilmAPI()
    var currentFilm = 0
    override func viewDidLoad() {
        
        super.viewDidLoad()
        films = person.filmUrls
        previousBtn.isEnabled = false
        nextBtn.isEnabled = films.count > 1
        guard let firstFilm = films.first else {return}
        getFilm(url: firstFilm)
    }
    
    func getFilm(url : String){
        filmApi.getFilm(url: url) { (film) in
            if let film = film {
                self.setUpView(film: film)
            }
        }
    }
    
    func setUpView(film : Film){
        titleLbl.text = film.title
        episodeLbl.text = String(film.episode)
        directorLbl.text = film.director
        producerLbl.text = film.producer
        releasedLbl.text = film.releaseDate
        let strippedCrwal = film.crwal.replacingOccurrences(of: "\n", with: " ")
        crwalTextView.text = strippedCrwal.replacingOccurrences(of: "\r", with: " ")
        
    }
    
    @IBAction func previousDidPress(_ sender: Any) {
        currentFilm -= 1
        setButtonState()
    }
    
    @IBAction func nextDidPress(_ sender: Any) {
        currentFilm += 1
        setButtonState()
    }
    
    func setButtonState(){
        previousBtn.isEnabled = currentFilm == 0 ? false : true
        nextBtn.isEnabled = currentFilm == films.count - 1 ? false : true
        getFilm(url: films[currentFilm])
    }
    
}
