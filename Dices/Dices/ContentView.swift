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

	private let hapticEngine = UINotificationFeedbackGenerator()

	var body: some View {
		VStack(spacing: 20) {
			DiceView(rolledNumber: rolledNumber)
				.rotationEffect(.degrees(Double(numberOfRolls * 180)))
				.onTapGesture {
					rollDice()
				}

			HStack(spacing: 10) {
				Text("Rolls:")

				ScrollView(.horizontal, showsIndicators: false) {
					Text(rollResults
							.reversed()
							.map { $0.description }
							.joined(separator: ", "))
				}
			}
			.padding()
		}
		.onShake {
			rollDice()
		}
	}

	private func rollDice() {
		withAnimation {
			rolledNumber = Int.random(in: 1...6)
			numberOfRolls += 1
		}
		rollResults.append(rolledNumber)
		hapticEngine.notificationOccurred(.error)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
