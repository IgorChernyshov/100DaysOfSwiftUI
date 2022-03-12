//
//  Prospects.swift
//  HotProspects
//
//  Created by Igor Chernyshov on 11.03.2022.
//

import SwiftUI

@MainActor class Prospects: ObservableObject {

	@Published private(set) var people: [Prospect]

	private let saveKey = "SavedData"

	init() {
		if let data = UserDefaults.standard.data(forKey: saveKey) {
			if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
				people = decoded
				return
			}
		}

		people = []
	}

	func toggle(_ prospect: Prospect) {
		objectWillChange.send()
		prospect.isContacted.toggle()
		save()
	}

	func add(_ prospect: Prospect) {
		people.append(prospect)
		save()
	}

	private func save() {
		if let encoded = try? JSONEncoder().encode(people) {
			UserDefaults.standard.set(encoded, forKey: saveKey)
		}
	}
}

final class Prospect: Identifiable, Codable {
	var id = UUID()
	var name = "Anonymous"
	var emailAddress = ""
	fileprivate(set) var isContacted = false
}
