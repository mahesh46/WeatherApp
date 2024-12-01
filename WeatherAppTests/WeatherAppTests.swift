//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by mahesh lad on 29/11/2024.
//

import XCTest
@testable import WeatherApp

final class WeatherServiceTests: XCTestCase {
    var weatherService: WeatherService!
    
    override func setUp() {
        super.setUp()
        
        weatherService = WeatherService()
    }
    
    func testGetCoordinates_Success() async throws {
        
        
        let coordinates = try await weatherService.getCoordinates(for: "London")
        XCTAssertEqual(coordinates.latitude, 51.5074456)
        XCTAssertEqual(coordinates.longitude, -0.1277653)
    }
    
    func testGetCoordinates_Failure() async {
        
        do {
            _ = try await weatherService.getCoordinates(for: "Unknown123")
            XCTFail("Expected failure, but succeeded.")
        } catch {
            XCTAssertEqual(error.localizedDescription, "Location not found")
        }
    }
    
    func testGetWeatherDataAvailable() async throws {
        // Simulate a successful response
        /*
         for live test, we cannot check changing wheather data in a automated test as the data varies,
       
         eg:
         "latitude": 52.52,
         "longitude": 13.419998,
         
         "current": {
         "time": "2024-11-29T23:30",
         "interval": 900,
         "temperature_2m": 4.5,
         "rain": 0.00,
         "apparent_temperature": 2.3,
         "cloud_cover": 100,
         "wind_speed_10m": 3.3,
         "wind_direction_10m": 174,
         "wind_gusts_10m": 7.2
         
         We can however check that we get a sucessfull weatherdata response
         }
         
         */
        
        let weatherData = try await weatherService.getWeather(latitude: 51.5074, longitude: -0.1278)
        XCTAssertNotNil(weatherData)
        //  XCTAssertEqual(weather.temperature, 4.5)  this can vary
        //  XCTAssertEqual(weather.cloudCover, 100)  this can vary
    }
    
    func testWeatherDataUnavailableError() async {
        
        do {
            _ = try await weatherService.getWeather(latitude: 999999951.5074, longitude: -0.1278)
            XCTFail("Expected an error to be thrown, but no error was thrown.")
        } catch let error as NSError {
            XCTAssertEqual(error.domain, "")
            XCTAssertEqual(error.code, -1)
            XCTAssertEqual(error.localizedDescription, "Weather data not available")
            
        }
    }
    
}
