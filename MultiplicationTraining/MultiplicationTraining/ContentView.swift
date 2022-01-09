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
						ForEach(1..<10) {
							Text("\($0 + 1)").tag($0 + 1)
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
					Text("You scored \(score)")
					Button(action: restart) {
						HStack(spacing: 5) {
							Image(systemName: "arrow.counterclockwise")
							Text("Restart")
						}
					}
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

	private func restart() {
		resetState()
		gameState = .settings
	}

	// MARK: - Helpers
	private func makeQuestions() {
		while questions.count < numberOfQuestions {
			let firstMultiplier = Int.random(in: 2...maximumMultiplier)
			let secondMultiplier = Int.random(in: 2...12)
			questions.insert(Question(firstMultiplier: firstMultiplier, secondMultiplier: secondMultiplier))
		}
	}

	private func checkAnswer() {
		if answer == questions.first?.answer {
			score += 1
		}
		answer = ""
	}

	private func resetState() {
		maximumMultiplier = 2
		numberOfQuestions = 5
		questions.removeAll()
		answer = ""
		score = 0
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
