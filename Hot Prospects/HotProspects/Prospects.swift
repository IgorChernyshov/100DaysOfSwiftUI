//
//  Prospects.swift
//  HotProspects
//
//  Created by Igor Chernyshov on 11.03.2022.
//

import SwiftUI

@MainActor class Prospects: ObservableObject {

	@Published private(set) var people: [Prospect]

	private let savePath = FileManager.documentsDirectory().appendingPathComponent("SavedData")

	init() {
		do {
			let data = try Data(contentsOf: savePath)
			people = try JSONDecoder().decode([Prospect].self, from: data)
		} catch {
			people = []
		}
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

	func sortPeopleByName() {
		people.sort(by: { $0.name > $1.name })
	}

	func sortPeopleByMet() {
		people.sort(by: { $0.isContacted && !$1.isContacted })
	}

	private func save() {
		do {
			let encodedData = try? JSONEncoder().encode(people)
			try encodedData?.write(to: savePath, options: [.atomic, .completeFileProtection])
		} catch {
			print("Cannot save data")
		}
	}
}

final class Prospect: Identifiable, Codable {
	var id = UUID()
	var name = "Anonymous"
	var emailAddress = ""
	fileprivate(set) var isContacted = false
}
