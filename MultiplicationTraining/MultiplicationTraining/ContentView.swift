//
//  ContentView.swift
//  MultiplicationTraining
//
//  Created by Igor Chernyshov on 09.01.2022.
//

import SwiftUI

struct ContentView: View {

	@State private var gameState: GameState = .settings

	@State private var maximumMultiplier: Int = 2
	@State private var numberOfQuestions: Int = 5

	@State private var questions = [(Int, Int)]()

	var body: some View {
		NavigationView {
			List {
				switch gameState {
				case .settings:
					Picker("Select maximum multiplier", selection: $maximumMultiplier) {
						ForEach(2..<13) {
							Text("\($0)").tag($0)
						}
					}

					Picker("Select number of questions", selection: $numberOfQuestions) {
						ForEach(1..<5) {
							Text("\($0 * 5)").tag($0 * 5)
						}
					}

					Button("Start") {
						startGame()
					}
				case .playing:
					Text("Questions")
				case .ended:
					Text("Game Over Stuff")
				}
			}
			.navigationTitle(gameState == .settings ? "Settings" : gameState == .playing ? "Training" : "Session Ended")
		}
	}

	private func startGame() {
		makeQuestions()
		gameState = .playing
	}

	private func makeQuestions() {
		var questions = questions
		while questions.count < numberOfQuestions {
			let firstMultiplier = Int.random(in: 1...maximumMultiplier)
			let secondMultiplier = Int.random(in: 1...maximumMultiplier)
			questions.append((firstMultiplier, secondMultiplier))
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
