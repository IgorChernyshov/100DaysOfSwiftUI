//
//  User.swift
//  FriendsFace
//
//  Created by Igor Chernyshov on 05.02.2022.
//

import Foundation

struct User: Codable, Identifiable {
	let id: String
	let isActive: Bool
	let name: String
	let age: Int8
	let company: String
	let email: String
	let address: String
	let about: String
	let registered: Date?
	let tags: [String]
	let friends: [Friend]

	var formattedRegisteredDate: String {
		registered?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
	}
}
