//
//  Mission.swift
//  Moonshot
//
//  Created by Igor Chernyshov on 16.01.2022.
//

import Foundation

// MARK: - Mission
struct Mission: Codable, Identifiable {
	let id: Int
	let launchDate: Date?
	let crew: [CrewRole]
	let description: String
}

// MARK: - Helpers
extension Mission {

	var displayName: String {
		"Apollo \(id)"
	}

	var image: String {
		"apollo\(id)"
	}

	var formattedLaunchDate: String {
		launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
	}
}

// MARK: - CrewRole
extension Mission {
	struct CrewRole: Codable {
		let name: String
		let role: String
	}
}
