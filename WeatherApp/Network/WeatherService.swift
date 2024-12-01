//
//  WeatherService.swift
//  WeatherApp
//
//  Created by mahesh lad on 29/11/2024.
//

import Foundation

class WeatherService {
    private let geoCodingBaseURL = "https://geocode.maps.co/search"
    private let weatherBaseURL = "https://api.open-meteo.com/v1/forecast"
    
    func getCoordinates(for location: String) async throws -> Coordinates {
        guard let url = URL(string: "\(geoCodingBaseURL)?q=\(location.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&api_key=674b76894c01a105993848mko0c6996") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedResponse = try JSONDecoder().decode([GeoCodingResponse].self, from: data)
        
        guard let firstResult = decodedResponse.first else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Location not found"])
        }
        //print(firstResult)
        return Coordinates(latitude: Double(firstResult.lat) ?? 0.0, longitude: Double(firstResult.lon) ?? 0.0)
    }
    func getWeather(latitude: Double, longitude: Double) async throws -> WeatherData {
        
        let urlString = "\(weatherBaseURL)?latitude=\(latitude)&longitude=\(longitude)&current=temperature_2m,apparent_temperature,rain,cloud_cover,wind_speed_10m,wind_direction_10m,wind_gusts_10m&timezone=auto"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        /*  uncomment to view data in console
         let prettyJSON = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
         print(prettyJSON)
         */
        let decodedResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
        
        guard let currentWeather = decodedResponse?.current else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Weather data not available"])
        }
        
        return WeatherData(
            temperature: currentWeather.temperature2M,
            apparentTemperature: currentWeather.apparentTemperature, // Placeholder
            windSpeed: currentWeather.windSpeed10M * 0.621371, // Convert km/h to mph
            windDirection: currentWeather.windDirection10M,
            windGusts: currentWeather.windGusts10M, // Placeholder, as not available in response
            rain: currentWeather.rain ,
            cloudCover: currentWeather.cloudCover
        )
    }
}



