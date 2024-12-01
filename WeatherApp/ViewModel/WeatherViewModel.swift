//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by mahesh lad on 29/11/2024.
//

import Foundation

@MainActor
class WeatherViewModel: ObservableObject {
    @Published var location: String = ""   //location bound in view
    @Published var weather: WeatherData?
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    var weatherService: WeatherService
    
    init(service: WeatherService = WeatherService() ) {
        weatherService = service
    }
    
    func fetchWeather() async {
        guard !location.isEmpty else { return }
        isLoading = true
        errorMessage = nil
        weather = nil
        do {
            let coordinates = try await weatherService.getCoordinates(for: location)
            let weatherData = try await weatherService.getWeather(latitude: coordinates.latitude, longitude: coordinates.longitude)
            self.weather = weatherData
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
