//
//  ContentView.swift
//  WeSplit
//
//  Created by Igor Chernyshov on 12.12.2021.
//

import SwiftUI

struct ContentView: View {

	@FocusState private var amountIsFocused: Bool

	@State private var checkAmount = 0.0
	@State private var numberOfPeople = 2
	@State private var tipPercentage = 20

	private let userCurrency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currencyCode ?? "USD")

	private var grandTotal: Double {
		let tipValue = checkAmount / 100 * Double(tipPercentage)
		return checkAmount + tipValue
	}

	private var totalPerPerson: Double {
		grandTotal / Double(numberOfPeople + 2)
	}

	var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Amount", value: $checkAmount, format: userCurrency)
						.keyboardType(.decimalPad)
						.focused($amountIsFocused)
					Picker("Number of people", selection: $numberOfPeople) {
						ForEach(2..<100) {
							Text("\($0) people")
						}
					}
				}
				Section {
					Picker("Tip percentage", selection: $tipPercentage) {
						ForEach(0..<101) {
							Text($0, format: .percent)
						}
					}
				} header: {
					Text("How much tip do you want to leave?")
				}
				Section {
					Text(grandTotal, format: userCurrency)
						.foregroundColor(tipPercentage == 0 ? .red : .primary)
				} header: {
					Text("Total check amount with tips")
				}
				Section {
					Text(totalPerPerson, format: userCurrency)
				} header: {
					Text("Amount per person")
				}
			}
			.navigationTitle("WeSplit")
			.toolbar {
				ToolbarItemGroup(placement: .keyboard) {
					Spacer()
					Button("Done") {
						amountIsFocused = false
					}
				}
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
