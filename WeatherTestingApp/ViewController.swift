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
    //TODO: i need make to work city label
    @IBOutlet weak var weatherCityLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=riga&appid=3d967c3fffadce6f693fee6dbdccb80a"
            ) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, error == nil {
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any] else { return }
                guard let weatherDetails = json["weather"] as? [[String : Any]], let weatherMain = json["main"] as? [String : Any] else {return}
                let temp = Int(weatherMain["temp"] as? Double ?? 0)
                let description = (weatherDetails.first?["description"] as? String)?.capitalizingFirstLetter()
                DispatchQueue.main.async {
                    self.setWeather(weather: weatherDetails.first?["main"] as? String, description: description, temp: temp)
                }
            }
            catch{
                    print("we had an error retrieving the weather...")
                }
            }
        }
        task.resume()
        // Do any additional setup after loading the view.
    }
    
    func setWeather(weather: String?, description: String?, temp: Int) {
        // here weather conditions icons https://openeathermaporg/weather-conditions
        weatherDescriptionLabel.text = description ?? "..."
        tempLabel.text = "\(temp-273)º"
        switch weather {
        case "Sunny":
            weatherImageView.image = UIImage(named: "sunny")
            //backgroung
        
        default:
        weatherImageView.image = UIImage(named: "cloudy")
        }
    

    }

}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}


