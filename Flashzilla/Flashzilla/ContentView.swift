//
//  ContentView.swift
//  Flashzilla
//
//  Created by Igor Chernyshov on 17.03.2022.
//

import SwiftUI

struct ContentView: View {

	@Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
	@Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled

	@EnvironmentObject var cards: Cards

	@State private var timeRemaining = 100
	let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

	@Environment(\.scenePhase) var scenePhase
	@State private var isActive = true

	@State private var showingEditScreen = false

	var body: some View {
		ZStack {
			Image(decorative: "background")
				.resizable()
				.ignoresSafeArea()

			VStack {
				Text("Time: \(timeRemaining)")
					.font(.largeTitle)
					.foregroundColor(.white)
					.padding(.horizontal, 20)
					.padding(.vertical, 5)
					.background(.black.opacity(0.75))
					.clipShape(Capsule())

				ZStack {
					ForEach(0..<cards.cards.count, id: \.self) { index in
						CardView(card: cards.cards[index]) {
						   withAnimation {
							   popCard(at: index)
						   }
						}
						.stacked(at: index, in: cards.cards.count)
						.allowsHitTesting(index == cards.cards.count - 1)
						.accessibilityHidden(index < cards.cards.count - 1)
					}
				}
				.allowsHitTesting(timeRemaining > 0)

				if cards.cards.isEmpty {
					Button("Start Again", action: resetCards)
						.padding()
						.background(.white)
						.foregroundColor(.black)
						.clipShape(Capsule())
				}
			}

			VStack {
				HStack {
					Spacer()

					Button {
						showingEditScreen = true
					} label: {
						Image(systemName: "plus.circle")
							.padding()
							.background(.black.opacity(0.7))
							.clipShape(Circle())
					}
				}

				Spacer()
			}
			.foregroundColor(.white)
			.font(.largeTitle)
			.padding()

			if differentiateWithoutColor || voiceOverEnabled {
				VStack {
					Spacer()

					HStack {
						Button {
							withAnimation {
								popCard(at: cards.cards.count - 1)
							}
						} label: {
							Image(systemName: "xmark.circle")
								.padding()
								.background(.black.opacity(0.7))
								.clipShape(Circle())
						}
						.accessibilityLabel("Wrong")
						.accessibilityHint("Mark your answer as being incorrect.")

						Spacer()

						Button {
							withAnimation {
								popCard(at: cards.cards.count - 1)
							}
						} label: {
							Image(systemName: "checkmark.circle")
								.padding()
								.background(.black.opacity(0.7))
								.clipShape(Circle())
						}
						.accessibilityLabel("Correct")
						.accessibilityHint("Mark your answer as being correct.")
					}
					.foregroundColor(.white)
					.font(.largeTitle)
					.padding()
				}
			}
		}
		.onReceive(timer) { time in
			guard isActive else { return }

			if timeRemaining > 0 {
				timeRemaining -= 1
			}
		}
		.onChange(of: scenePhase) { newPhase in
			if newPhase == .active {
				if cards.cards.isEmpty == false {
					isActive = true
				}
			} else {
				isActive = false
			}
		}
		.sheet(isPresented: $showingEditScreen, onDismiss: resetCards) {
			EditCardsView()
		}
		.onAppear(perform: resetCards)
	}

	private func popCard(at index: Int) {
		guard index >= 0 else { return }

		cards.pop(at: index)

		if cards.cards.isEmpty {
			isActive = false
		}
	}

	private func resetCards() {
		timeRemaining = 100
		isActive = true
		cards.load()
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			.previewInterfaceOrientation(.landscapeLeft)
    }
}
