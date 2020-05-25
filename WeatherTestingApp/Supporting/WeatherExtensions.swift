//
//  WeatherExtensions.swift
//  WeatherTestingApp
//
//  Created by Bogdan Abrosimov on 22/05/2020.
//  Copyright © 2020 Bogdan Abrosimov. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
