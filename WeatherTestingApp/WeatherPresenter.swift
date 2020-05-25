//
//  WeatherPresenter.swift
//  WeatherTestingApp
//
//  Created by Bogdan Abrosimov on 20/05/2020.
//  Copyright © 2020 Bogdan Abrosimov. All rights reserved.
//

import Foundation
import UIKit


class WeatherPresenter {
    
    let controller : WeatherViewController
    let interactor : WeatherInteractor
    
    
    init (controller: WeatherViewController, interactor: WeatherInteractor = WeatherInteractor()){
        self.controller = controller
        self.interactor = interactor
    }
    
    func getWeather() {
        self.interactor.fetchWeather(callback: {[weak self] weatherData in
            self?.controller.weatherCityLabel.text = weatherData.name
            self?.controller.weatherDescriptionLabel.text = weatherData.weather[0].description.capitalizingFirstLetter()
            self?.controller.tempLabel.text = "\(Int(weatherData.main.temp-273))º"
            
            switch weatherData.weather[0].main {
                case "Clear":
                    self?.controller.weatherImageView.image = UIImage(named: "sunny")
                    //backgroung changing night day
                case "Clouds":
                    self?.controller.weatherImageView.image = UIImage(named: "cloudy")
                case "Snow":
                    self?.controller.weatherImageView.image = UIImage(named: "snow")
                case "Rain":
                    self?.controller.weatherImageView.image = UIImage(named: "rainy")
                case "Drizzle":
                    self?.controller.weatherImageView.image = UIImage(named: "drizzle")
                case "Thunderstorm":
                    self?.controller.weatherImageView.image = UIImage(named: "thunderstorm")
                default:
                    self?.controller.weatherImageView.image = UIImage(named: "cloudy")
            }
        })
        }
}
    

