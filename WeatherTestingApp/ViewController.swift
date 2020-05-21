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
        //let main :String?
        var name : String?
        var main : WeatherMain?
        var weather : weatherDesc?
    }
    
    struct WeatherDesc 
    
    struct WeatherMain : Decodable{
        var temp: Double
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //in URL i need to make \(city) to searching
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=riga&appid=3d967c3fffadce6f693fee6dbdccb80a"
            ) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, error == nil {
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any] else { return }
                guard let weatherDetails = json["weather"] as? [[String : Any]], let weatherMain = json["main"] as? [String : Any],
                    let weatherDetailsName = json as? [String : Any] else {return}
                let temp = Int(weatherMain["temp"] as? Double ?? 0)
                let description = (weatherDetails.first?["description"] as? String)?.capitalizingFirstLetter()
                
                
                let weatherUrl = try JSONDecoder().decode(WeatherUrl.self, from : data)
                print(weatherUrl)
                
                let name = (weatherDetailsName["name"] as? String)
                DispatchQueue.main.async {
                    self.setWeather(weather: weatherDetails.first?["main"] as? String, description: description, temp: temp, name: name)

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
    func setWeather(weather: String?, description: String?, temp: Int, name: String?) {
        // here weather conditions icons help https://openeathermap.org/weather-conditions
        weatherDescriptionLabel.text = description ?? "..."
        tempLabel.text = "\(temp-273)º"
        weatherCityLabel.text = name ?? "..."
        switch weather {
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


