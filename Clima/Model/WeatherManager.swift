//
//  WeatherManager.swift
//  Clima
//
//  Created by Parth Nikam on 17/03/23.


import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=9ff5a48a2797cd1e06cfbc663cd4eab3&units=metric"
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
}
