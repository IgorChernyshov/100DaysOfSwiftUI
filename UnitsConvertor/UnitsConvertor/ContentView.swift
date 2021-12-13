//
//  ContentView.swift
//  UnitsConvertor
//
//  Created by Igor Chernyshov on 13.12.2021.
//

import SwiftUI

struct ContentView: View {

	// MARK: - Temperature
	@State private var fromTemperature: String = "36.6"
	@State private var fromTemperatureUnits: UnitTemperature = .celsius
	@State private var toTemperatureUnits: UnitTemperature = .fahrenheit

	private var toTemperature: String {
		guard let fromTemperatureAsDouble = Double(fromTemperature) else { return "🤷🏻‍♂️" }
		let measurement = Measurement(value: fromTemperatureAsDouble, unit: fromTemperatureUnits)
		let convertedMeasurement = measurement.converted(to: toTemperatureUnits)
		let displayedMeasurement = convertedMeasurement.value.rounded(.toNearestOrEven).description
		return displayedMeasurement + " " + convertedMeasurement.unit.symbol
	}

	private let displayedTemperatureUnits: [UnitTemperature] = [.fahrenheit, .celsius, .kelvin]

	var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Convert from", text: $fromTemperature, prompt: nil)
						.keyboardType(.decimalPad)
					Picker("From units", selection: $fromTemperatureUnits) {
						ForEach(displayedTemperatureUnits, id: \.self) {
							Text($0.symbol)
						}
					}
					Picker("To units", selection: $toTemperatureUnits) {
						ForEach(displayedTemperatureUnits, id: \.self) {
							Text($0.symbol)
						}
					}
					Text(toTemperature)
				} header: {
					Text("Temperature")
				}
			}
			.navigationTitle("Units Converter")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
