//
//  ViewController.swift
//  WeatherTestingApp
//
//  Created by Bogdan Abrosimov on 19/05/2020.
//  Copyright © 2020 Bogdan Abrosimov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var weatherCityLabel: UILabel!
    
    
    struct WeatherUrl : Decodable{
        var name : String
        var main : WeatherMain
        var weather : [WeatherDesc] = []
    }
    struct WeatherDesc : Decodable {
        var description : String
        var main : String
    }
    struct WeatherMain : Decodable{
        var temp: Double
    }
    
    // vse eto v interactor
    override func viewDidLoad() {
        super.viewDidLoad()
        //in URL i need to make \(city) to searching
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=riga&appid=3d967c3fffadce6f693fee6dbdccb80a"
            ) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, error == nil {
            do {
                let weatherUrl = try JSONDecoder().decode(WeatherUrl.self, from : data)
                DispatchQueue.main.async{
                    self.weatherSet(name: weatherUrl.name, main: weatherUrl.weather[0].main,description: weatherUrl.weather[0].description, temp: Int(weatherUrl.main.temp))
                }
            }
            catch{
                    print("we had an error retrieving the weather...")
                }
            }
        }
        task.resume()
    }
    

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
//MOVE TO ANOTHER FILE
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}

