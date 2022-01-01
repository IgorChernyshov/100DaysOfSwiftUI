//
//  Item.swift
//  RockPaperScissors
//
//  Created by Igor Chernyshov on 01.01.2022.
//

enum Item: String, CaseIterable {
	case rock = "🪨"
	case paper = "📜"
	case scissors = "✂️"
}

extension Item: Comparable {
	static func < (lhs: Item, rhs: Item) -> Bool {
		if (lhs == .rock && rhs == .paper) ||
			(lhs == .paper && rhs == .scissors) ||
			(lhs == .scissors && rhs == .rock) {
			return true
		}
		return false
	}
}
