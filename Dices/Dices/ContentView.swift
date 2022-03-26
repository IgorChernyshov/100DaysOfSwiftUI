//
//  ContentView.swift
//  Dices
//
//  Created by Igor Chernyshov on 26.03.2022.
//

import SwiftUI

struct ContentView: View {

	@State private var rolledNumber: Int = 1
	@State private var numberOfRolls: Int = 1

	@State private var rollResults = [Int]()

	var body: some View {
		VStack(spacing: 20) {
			DiceView(rolledNumber: rolledNumber)
				.rotationEffect(.degrees(Double(numberOfRolls * 90)))
				.onTapGesture {
					withAnimation {
						rolledNumber = Int.random(in: 1...6)
						numberOfRolls += 1
						rollResults.append(rolledNumber)
					}
				}

			HStack(spacing: 10) {
				Text("Rolls:")

				ScrollView(.horizontal, showsIndicators: false) {
					Text(rollResults
							.reversed()
							.map { $0.description }
							.joined(separator: ", "))
						.animation(nil, value: rollResults)
				}
			}
			.padding()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
