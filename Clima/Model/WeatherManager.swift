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
        performRequest(urlString: urlString)
    }
    func performRequest(urlString: String){
        
        //Creating a URL
        if let url = URL(string: urlString){
            
            //URL Session
            let session = URLSession(configuration: .default)
            
            //Give session a task.
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                
                if let safeData = data{
                    self.parseJSON(weatherData: safeData)
                }
            }
            //Start the Task
            task.resume()
        }
    }
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.weather[0].description)
        } catch {
            print(error)
        }
    }
}
