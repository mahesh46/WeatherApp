//
//  WeatherDetailsView.swift
//  WeatherApp
//
//  Created by mahesh lad on 29/11/2024.
//

import SwiftUI

struct WeatherDetailsView: View {
    let weather: WeatherData
    
    var body: some View {
        VStack(spacing: 20) { // Increase spacing for better readability
            Text("Current Weather")
                .font(.title2)
                .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: 8) { // Group details with consistent alignment
                weatherDetailRow(label: "Temperature", value: "\(weather.temperature)°C")
                weatherDetailRow(label: "Feels Like", value: "\(weather.apparentTemperature)°C")
                weatherDetailRow(label: "Wind", value: "\(String(format: "%.2f", weather.windSpeed)) mph, \(weather.windDirection)°")
                weatherDetailRow(label: "Gusts", value: "\(String(format: "%.2f",weather.windGusts)) mph")
                weatherDetailRow(label: "Rain", value: "\(weather.rain) mm")
                weatherDetailRow(label: "Cloud Cover", value: "\(weather.cloudCover)%")
            }
            .frame(maxWidth: .infinity, alignment: .leading) // Align to leading
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2) // Subtle shadow
        .padding(.horizontal) // Add padding around the entire view
    }
    
    private func weatherDetailRow(label: String, value: String) -> some View {
        HStack {
            Text("\(label):")
                .font(.body)
                .foregroundColor(.secondary) // Subdued color for labels
            Spacer()
            Text(value)
                .font(.body)
                .fontWeight(.medium)
        }
    }
}

#Preview {
    WeatherDetailsView(weather: WeatherData(
        temperature: 15.0,
        apparentTemperature: 15.0,
        windSpeed: 20.0,
        windDirection: 180,
        windGusts: 30.0,
        rain: 0,
        cloudCover: 50
    ))
}
