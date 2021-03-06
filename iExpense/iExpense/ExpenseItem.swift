//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Igor Chernyshov on 12.01.2022.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
	var id = UUID()
	let name: String
	let type: String
	let amount: Double
}
