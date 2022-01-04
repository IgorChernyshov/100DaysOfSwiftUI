//
//  ContentView.swift
//  BetterRest
//
//  Created by Igor Chernyshov on 01.01.2022.
//

import CoreML
import SwiftUI

struct ContentView: View {

	@State private var wakeUp = defaultWakeTime
	@State private var sleepAmount = 8.0
	@State private var coffeeAmount = 1
	@State private var showingAlert = false

	private var idealWakeUp: String? {
		do {
			let config = MLModelConfiguration()
			let model = try SleepCalculator(configuration: config)

			let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
			let hour = (components.hour ?? 0) * 60 * 60
			let minute = (components.minute ?? 0) * 60
			let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
			let sleepTime = wakeUp - prediction.actualSleep
			return sleepTime.formatted(date: .omitted, time: .shortened)
		} catch {
			showingAlert = true
			return nil
		}

	}

	private static let defaultWakeTime: Date = {
		var components = DateComponents()
		components.hour = 7
		components.minute = 0
		return Calendar.current.date(from: components) ?? Date.now
	}()

    var body: some View {
		NavigationView {
			Form {
				Section("When do you want to wake up?") {
					DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
						.labelsHidden()
				}

				Section("Desired amount of sleep") {
					Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
				}

				Section("Daily coffee intake") {
					Picker(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", selection: $coffeeAmount) {
						ForEach(0..<21) {
							Text("\($0)")
						}
					}
				}

				if let idealWakeUp = idealWakeUp {
					Section("Your ideal bedtime is…") {
						Text(idealWakeUp)
					}
				}
			}
			.navigationTitle("BetterRest")
			.alert("Error", isPresented: $showingAlert) {
				Button("OK") { }
			} message: {
				Text("Sorry, there was a problem calculating your bedtime.")
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
