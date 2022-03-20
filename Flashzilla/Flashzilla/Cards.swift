//
//  Cards.swift
//  Flashzilla
//
//  Created by Igor Chernyshov on 19.03.2022.
//

import SwiftUI

@MainActor final class Cards: ObservableObject {

	@Published private(set) var cards = [Card]()

	// MARK: - Life Cycle
	init() {
		load()
	}

	// MARK: - Save / Load Cards
	private let savePath = FileManager.documentsDirectory().appendingPathComponent("SavedCards")

	func load() {
		do {
			let savedCardsData = try Data(contentsOf: savePath)
			cards = try JSONDecoder().decode([Card].self, from: savedCardsData)
		} catch {
			cards = []
		}
	}

	private func save() {
		do {
			let cardsData = try JSONEncoder().encode(cards)
			try cardsData.write(to: savePath, options: [.atomic, .completeFileProtection])
		} catch {
			print("Failed to save cards")
		}
	}

	// MARK: - Edit Cards
	func pop(at index: Int) {
		cards.remove(at: index)
	}

	func remove(at offsets: IndexSet) {
		cards.remove(atOffsets: offsets)
		save()
	}

	func add(card: Card) {
		cards.insert(card, at: 0)
		save()
	}
}

struct Card: Codable, Identifiable {

	var id = UUID()
	let prompt: String
	let answer: String

	static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
