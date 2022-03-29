//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Igor Chernyshov on 27.03.2022.
//

import SwiftUI

class Favorites: ObservableObject {

	private var resorts: Set<String>

	private let saveKey = "Favorites"

	init() {
		do {
			let data = try Data(contentsOf: FileManager.savedFavorites)
			resorts = try JSONDecoder().decode(Set<String>.self, from: data)
		} catch {
			print("No saved favorite resorts")
			resorts = []
		}
	}

	func contains(_ resort: Resort) -> Bool {
		resorts.contains(resort.id)
	}

	func add(_ resort: Resort) {
		objectWillChange.send()
		resorts.insert(resort.id)
		save()
	}

	func remove(_ resort: Resort) {
		objectWillChange.send()
		resorts.remove(resort.id)
		save()
	}

	func save() {
		do {
			let encodedResorts = try JSONEncoder().encode(resorts)
			try encodedResorts.write(to: FileManager.savedFavorites, options: [.atomic, .completeFileProtection])
		} catch {
			fatalError("Favorite resorts were not saved")
		}
	}
}
