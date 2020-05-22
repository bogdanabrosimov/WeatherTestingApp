//
//  WeatherPresenter.swift
//  WeatherTestingApp
//
//  Created by Bogdan Abrosimov on 20/05/2020.
//  Copyright © 2020 Bogdan Abrosimov. All rights reserved.
//

import Foundation

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
