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
}


