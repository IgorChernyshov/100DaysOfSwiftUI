//
//  ContentView.swift
//  MultiplicationTraining
//
//  Created by Igor Chernyshov on 09.01.2022.
//

import SwiftUI

struct ContentView: View {

	@State private var gameState: GameState = .settings

	@State private var maximumMultiplier = 2
	@State private var numberOfQuestions = 5

	@State private var questions = Set<Question>()
	@State private var answer = ""

	@State private var score = 0

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
					Section(questions.first?.text ?? "Unknown question") {
						TextField("Your answer", text: $answer)
						Button("Next question") {
							nextQuestion()
						}
					}
				case .ended:
					Text("Game Over Stuff")
				}
			}
			.navigationTitle(gameState == .settings ? "Settings" : gameState == .playing ? "Training" : "Session Ended")
		}
	}

	// MARK: - Game States
	private func startGame() {
		makeQuestions()
		gameState = .playing
	}

	private func nextQuestion() {
		checkAnswer()
		questions.removeFirst()
		guard !questions.isEmpty else {
			return gameState = .ended
		}
	}

	// MARK: - Helpers
	private func makeQuestions() {
		while questions.count < numberOfQuestions {
			let firstMultiplier = Int.random(in: 1...maximumMultiplier)
			let secondMultiplier = Int.random(in: 1...12)
			questions.insert(Question(firstMultiplier: firstMultiplier, secondMultiplier: secondMultiplier))
		}
	}

	private func checkAnswer() {
		if answer == questions.first?.answer {
			score += 1
		}
		answer = ""
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
