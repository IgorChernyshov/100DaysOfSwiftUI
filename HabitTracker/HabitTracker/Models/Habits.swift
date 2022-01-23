//
//  Habits.swift
//  HabitTracker
//
//  Created by Igor Chernyshov on 23.01.2022.
//

import SwiftUI

final class Habits: ObservableObject {

	@Published var items = [Habit]() {
		didSet {
			if let encoded = try? JSONEncoder().encode(items) {
				UserDefaults.standard.set(encoded, forKey: "Habits")
			}
		}
	}

	init() {
		guard let savedItems = UserDefaults.standard.data(forKey: "Habits"),
			  let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedItems) else {
				  items = []
				  return
			  }
		items = decodedItems
	}
}
