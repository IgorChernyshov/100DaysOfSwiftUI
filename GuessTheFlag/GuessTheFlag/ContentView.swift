//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Igor Chernyshov on 24.12.2021.
//

import SwiftUI

struct ContentView: View {

	@State private var showingScore = false
	@State private var showingGameOver = false
	@State private var scoreTitle = ""
	@State private var score = 0
	@State private var attempt = 0

	@State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
	@State private var correctAnswer = Int.random(in: 0...2)

	@State private var isFlagTapped: [Bool] = Array(repeating: false, count: 3)

	var body: some View {
		ZStack {
			RadialGradient(stops: [
				.init(color: .indigo, location: 0.3),
				.init(color: .mint, location: 0.3),
			], center: .top, startRadius: 200, endRadius: 400)
				.ignoresSafeArea()
			VStack {
				Spacer()

				Text("Guess the Flag")
					.font(.largeTitle.bold())
					.foregroundColor(.white)

				VStack(spacing: 15) {
					VStack {
						Text("Tap the flag of")
							.font(.subheadline.weight(.heavy))
							.foregroundStyle(.secondary)
						Text(countries[correctAnswer])
							.font(.largeTitle.weight(.semibold))
							.foregroundColor(.white)
					}

					ForEach(0..<3) { number in
						Button {
							withAnimation {
								isFlagTapped[number] = true
							}
							flagTapped(number)
						} label: {
							FlagView(countries[number])
						}
						.rotation3DEffect(Angle(degrees: isFlagTapped[number] ? 360 : 0), axis: (x: 0, y: 1, z: 0))
						.opacity(showingScore || showingGameOver ? isFlagTapped[number] ? 1 : 0.25 : 1)
						.scaleEffect(showingScore || showingGameOver ? isFlagTapped[number] ? 1 : 0.85 : 1)
					}
				}
				.frame(maxWidth: .infinity)
				.padding(.vertical, 20)
				.background(.ultraThinMaterial)
				.clipShape(RoundedRectangle(cornerRadius: 20))

				Spacer()
				Spacer()

				Text("Score: \(score)")
					.foregroundColor(.white)
					.font(.title.bold())

				Spacer()
			}
			.padding()
		}
		.alert(scoreTitle, isPresented: $showingScore) {
			Button("Continue", action: askQuestion)
		} message: {
			Text("Your score is \(score)")
		}
		.alert("Game Over", isPresented: $showingGameOver) {
			Button("One more try", role: .cancel) {}
			Button("Restart", role: .destructive, action: restartGame)
		} message: {
			Text("You scored \(score) during this run")
		}
	}

	private func flagTapped(_ number: Int) {
		if number == correctAnswer {
			scoreTitle = "Correct"
			score += 3
		} else {
			scoreTitle = "Wrong, that's the flag of \(countries[number])"
			score -= 1
		}
		completeAttempt()
	}

	private func completeAttempt() {
		attempt += 1
		if attempt > 1 {
			showingGameOver = true
		} else {
			showingScore = true
		}
	}

	private func askQuestion() {
		countries.shuffle()
		correctAnswer = Int.random(in: 0...2)
		isFlagTapped = Array(repeating: false, count: 3)
	}

	private func restartGame() {
		score = 0
		attempt = 0
		askQuestion()
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
