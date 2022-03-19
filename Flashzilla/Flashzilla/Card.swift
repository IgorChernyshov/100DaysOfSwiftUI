//
//  Card.swift
//  Flashzilla
//
//  Created by Igor Chernyshov on 19.03.2022.
//

struct Card: Codable {

	let prompt: String
	let answer: String

	static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
