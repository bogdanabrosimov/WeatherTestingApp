//
//  WeatherPresenter.swift
//  WeatherTestingApp
//
//  Created by Bogdan Abrosimov on 20/05/2020.
//  Copyright © 2020 Bogdan Abrosimov. All rights reserved.
//

import Foundation

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
            self?.controller.weatherDescriptionLabel.text = weatherData.weather[0].description
            
            
        })
        }
}
    

