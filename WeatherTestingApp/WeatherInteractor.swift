//
//  WeatherInteractor.swift
//  WeatherTestingApp
//
//  Created by Bogdan Abrosimov on 20/05/2020.
//  Copyright © 2020 Bogdan Abrosimov. All rights reserved.
//

import Foundation

class WeatherInteractor {
    
    func fetchWeather(callback: @escaping (WeatherData) -> Void) {
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=riga&appid=3d967c3fffadce6f693fee6dbdccb80a"
            ) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, error == nil {
                do {
                    let weatherData = try JSONDecoder().decode(WeatherData.self, from : data)
                    DispatchQueue.main.async {
                        callback(weatherData)
                    }
                    
                }
                catch{
                    print("we had an error retrieving the weather...")
                }
            }
        }
        task.resume()
    }
    
}
