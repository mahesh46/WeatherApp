//
//  WeatherView.swift
//  WeatherApp
//
//  Created by mahesh lad on 29/11/2024.
//

import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Enter location (e.g., London)", text: $viewModel.location)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.words)
                
                Button(action: {
                    Task {
                        await viewModel.fetchWeather()
                    }
                }) {
                    Text("Get Weather")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(viewModel.isLoading)
                
                if let weather = viewModel.weather {
                    WeatherDetailsView(weather: weather)
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    Text("Enter a location to get started.")
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Weather App")
        }
    }
}

#Preview {
    WeatherView()
}
