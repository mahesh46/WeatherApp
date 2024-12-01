//
//  WeatherViewModelTests.swift
//  WeatherApp
//
//  Created by mahesh lad on 29/11/2024.
//
@testable import WeatherApp
import XCTest

@MainActor
final class WeatherViewModelTests: XCTestCase {
    var viewModel: WeatherViewModel!
  

    override func setUp() {
        super.setUp()
        viewModel = WeatherViewModel()
    }

    func testFetchWeatherViewModel_Success() async {

        viewModel.location = "London"
        await viewModel.fetchWeather()

        XCTAssertNotNil(viewModel.weather)
     //   XCTAssertEqual(viewModel.weather?.temperature, 15.0) cannot check this as it can vary from a live server
        XCTAssertNil(viewModel.errorMessage)
    }

    func testFetchWeatherViewModel_Error() async {
        // Simulate failure
        viewModel.location = "Unnownnnn"
        await viewModel.fetchWeather()

        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertNil(viewModel.weather)
    }
}
