//
//  Expenses.swift
//  iExpense
//
//  Created by Igor Chernyshov on 12.01.2022.
//

import SwiftUI

class Expenses: ObservableObject {
	@Published var items = [ExpenseItem]() {
		didSet {
			if let encoded = try? JSONEncoder().encode(items) {
				UserDefaults.standard.set(encoded, forKey: "Items")
			}
		}
	}

	init() {
		if let savedItems = UserDefaults.standard.data(forKey: "Items"),
		   let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
			items = decodedItems
			return
		}
		items = []
	}
}
