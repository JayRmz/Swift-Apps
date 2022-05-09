//
//  WeatherManager.swift
//  Clima
//
//  Created by Juan Ramírez Blancas on 08/05/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=faa0bdc1e6007779272d2492b5f90ccd&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
    
    
}
