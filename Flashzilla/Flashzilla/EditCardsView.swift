//
//  EditCardsView.swift
//  Flashzilla
//
//  Created by Igor Chernyshov on 19.03.2022.
//

import SwiftUI

struct EditCardsView: View {

	@Environment(\.dismiss) var dismiss

	@EnvironmentObject var cards: Cards

	@State private var newPrompt = ""
	@State private var newAnswer = ""

	var body: some View {
		NavigationView {
			List {
				Section("Add new card") {
					TextField("Prompt", text: $newPrompt)
					TextField("Answer", text: $newAnswer)
					Button("Add card", action: addCard)
				}

				Section {
					ForEach(cards.cards) { card in
						VStack(alignment: .leading) {
							Text(card.prompt)
								.font(.headline)
							Text(card.answer)
								.foregroundColor(.secondary)
						}
					}
					.onDelete(perform: removeCards)
				}
			}
			.navigationTitle("Edit Cards")
			.toolbar {
				Button("Done", action: done)
			}
			.listStyle(.grouped)
			.onAppear(perform: loadCards)
		}
	}

	func done() {
		dismiss()
	}

	func loadCards() {
		cards.load()
	}

	func addCard() {
		let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
		let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
		guard !trimmedPrompt.isEmpty && !trimmedAnswer.isEmpty else { return }

		let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
		cards.add(card: card)

		newPrompt = ""
		newAnswer = ""
	}

	func removeCards(at offsets: IndexSet) {
		cards.remove(at: offsets)
	}
}

struct EditCardsView_Previews: PreviewProvider {
	static var previews: some View {
		EditCardsView()
			.previewInterfaceOrientation(.landscapeLeft)
	}
}
