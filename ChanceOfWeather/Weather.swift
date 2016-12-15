//
//  Weather.swift
//  ChanceOfWeather
//
//  Created by Jonathan Archille on 12/14/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation

struct Weather
{
    //let cityLatLong: (Double, Double)
    let textSummary: String
    let precipIntensity: Double
    let precipProbability: Double
    let precipType: String
    let temperature: Double
    let apparentTemperature: Double
    let humidity: Double
    let windSpeed: Double
    let windBearing: Int
    let visibility: Double
    let cloudCover: Double
    let pressure: Double
    
    
    init(/*cityLatLong: (latitude: Double, longitude: Double),*/ textSummary: String, precipIntensity: Double, precipProbability: Double, precipType: String, temperature: Double, apparentTemperature: Double, humidity: Double, windSpeed: Double, windBearing: Int, visibility: Double, cloudCover: Double, pressure: Double)
    {
        //self.cityLatLong = cityLatLong
        self.textSummary = textSummary
        self.precipIntensity = precipIntensity
        self.precipProbability = precipProbability
        self.precipType = precipType
        self.temperature = temperature
        self.apparentTemperature = apparentTemperature
        self.humidity = humidity
        self.windSpeed = windSpeed
        self.windBearing = windBearing
        self.visibility = visibility
        self.cloudCover = cloudCover
        self.pressure = pressure
    }

    static func forecastsWithJSON(_ results: [Any]) -> [Weather]
    {
        var forecasts = [Weather]()
        
        if results.count > 0
        {
            for result in results
            {
                if let dictionary = result as? [String: Any]
                {
                    
                    //guard let latitude = dictionary["latitude"] as? Double
                    //    else { print("latitude invalid") }
                    //guard let longitude = dictionary["longitude"] as? Double
                    //    else { print("longitude invalid") }
                    
                    let textSummary = dictionary["summary"] as? String ?? ""
                    let precipIntensity = dictionary["precipIntensity"] as? Double ?? -1.0
                    let precipProbability = dictionary["precipProbability"] as? Double ?? -1.0
                    let precipType = dictionary["precipType"] as? String ?? ""
                    let temperature = dictionary["temperature"] as? Double ?? -1.0
                    let apparentTemperature = dictionary["apparentTemperature"] as? Double ?? -1.0
                    let humidity = dictionary["humidity"] as? Double ?? -1.0
                    let windSpeed = dictionary["windSpeed"] as? Double ?? -1.0
                    let windBearing = dictionary["windBearing"] as? Int ?? -1
                    let visibility = dictionary["visibility"] as? Double ?? -1.0
                    let cloudCover = dictionary["cloudCover"] as? Double ?? -1.0
                    let pressure = dictionary["pressure"] as? Double ?? -1.0
                    
                    
                    
                    forecasts.append(Weather(textSummary: textSummary, precipIntensity: precipIntensity, precipProbability: precipProbability, precipType: precipType, temperature: temperature, apparentTemperature: apparentTemperature, humidity: humidity, windSpeed: windSpeed, windBearing: windBearing, visibility: visibility, cloudCover: cloudCover, pressure: pressure))
                }
            }
        }
        
        return forecasts
    }
}


