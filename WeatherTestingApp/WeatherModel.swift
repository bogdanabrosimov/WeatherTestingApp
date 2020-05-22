//
//  WeatherModel.swift
//  WeatherTestingApp
//
//  Created by bogdans.abrosimovs on 22/05/2020.
//  Copyright © 2020 Bogdan Abrosimov. All rights reserved.
//

import Foundation

struct WeatherData : Decodable{
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
