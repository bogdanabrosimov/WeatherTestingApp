//
//  ViewController.swift
//  WeatherTestingApp
//
//  Created by Bogdan Abrosimov on 19/05/2020.
//  Copyright © 2020 Bogdan Abrosimov. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var presenter : WeatherPresenter?
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var weatherCityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = WeatherPresenter(controller : self)
        
        self.presenter?.getWeather()
    }
    // vse eto v interactor
 

    //IT NEEDS TO BE HERE
    func weatherSet(name: String, main: String, description: String, temp: Int) {
        // here weather conditions icons help https://openeathermap.org/weather-conditions
        weatherDescriptionLabel.text = description.capitalizingFirstLetter()
            weatherCityLabel.text = name
            tempLabel.text = "\(temp-273)º"
        switch main {
            case "Clear":
                weatherImageView.image = UIImage(named: "sunny")
                //backgroung changing night day
            case "Clouds":
                weatherImageView.image = UIImage(named: "cloudy")
            case "Snow":
                weatherImageView.image = UIImage(named: "cloudy")
            case "Rain":
                weatherImageView.image = UIImage(named: "cloudy")
            case "Drizzle":
                weatherImageView.image = UIImage(named: "cloudy")
            case "Thunderstorm":
                weatherImageView.image = UIImage(named: "cloudy")
            default:
                weatherImageView.image = UIImage(named: "cloudy")
        }
    }
}


