//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by mahesh lad on 29/11/2024.
//


// MARK: - WeatherResponse
struct WeatherResponse: Codable {
    let latitude, longitude, generationtimeMS: Double
    let utcOffsetSeconds: Int
    let timezone, timezoneAbbreviation: String
    let elevation: Int
    let currentUnits: CurrentUnits
    let current: Current

    enum CodingKeys: String, CodingKey {
        case latitude, longitude
        case generationtimeMS = "generationtime_ms"
        case utcOffsetSeconds = "utc_offset_seconds"
        case timezone
        case timezoneAbbreviation = "timezone_abbreviation"
        case elevation
        case currentUnits = "current_units"
        case current
    }
}

// MARK: - Current
struct Current: Codable {
    let time: String
    let interval: Int
    let temperature2M, apparentTemperature: Double
    let rain, cloudCover: Int
    let windSpeed10M: Double
    let windDirection10M: Int
    let windGusts10M: Double

    enum CodingKeys: String, CodingKey {
        case time, interval
        case temperature2M = "temperature_2m"
        case apparentTemperature = "apparent_temperature"
        case rain
        case cloudCover = "cloud_cover"
        case windSpeed10M = "wind_speed_10m"
        case windDirection10M = "wind_direction_10m"
        case windGusts10M = "wind_gusts_10m"
    }
}

// MARK: - CurrentUnits
struct CurrentUnits: Codable {
    let time, interval, temperature2M, apparentTemperature: String
    let rain, cloudCover, windSpeed10M, windDirection10M: String
    let windGusts10M: String

    enum CodingKeys: String, CodingKey {
        case time, interval
        case temperature2M = "temperature_2m"
        case apparentTemperature = "apparent_temperature"
        case rain
        case cloudCover = "cloud_cover"
        case windSpeed10M = "wind_speed_10m"
        case windDirection10M = "wind_direction_10m"
        case windGusts10M = "wind_gusts_10m"
    }
}
