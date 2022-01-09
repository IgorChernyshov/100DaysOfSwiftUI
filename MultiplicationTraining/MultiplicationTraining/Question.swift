//
//  Question.swift
//  MultiplicationTraining
//
//  Created by Igor Chernyshov on 09.01.2022.
//

import Foundation

struct Question: Hashable {
	let firstMultiplier: Int
	let secondMultiplier: Int

	var text: String { "How much is \(firstMultiplier) times \(secondMultiplier)?" }
	var answer: String { "\(firstMultiplier * secondMultiplier)" }
}
