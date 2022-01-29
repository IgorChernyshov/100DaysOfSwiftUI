//
//  Order.swift
//  CupcakeCorner
//
//  Created by Igor Chernyshov on 26.01.2022.
//

import SwiftUI

struct Order: Codable {

	// MARK: - Properties
	static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

	var type = 0
	var quantity = 3

	var specialRequestEnabled = false {
		didSet {
			if specialRequestEnabled == false {
				extraFrosting = false
				addSprinkles = false
			}
		}
	}
	var extraFrosting = false
	var addSprinkles = false

	var name = ""
	var streetAddress = ""
	var city = ""
	var zip = ""

	// MARK: - Helpers
	var hasValidAddress: Bool {
		isValid(field: name) && isValid(field: streetAddress) && isValid(field: city) && isValid(field: zip)
	}

	private func isValid(field: String) -> Bool {
		!field.isEmpty && !field.allSatisfy { $0 == " " }
	}

	var cost: Double {
		// $2 per cake
		var cost = Double(quantity) * 2

		// complicated cakes cost more
		cost += (Double(type) / 2)

		// $1/cake for extra frosting
		if extraFrosting {
			cost += Double(quantity)
		}

		// $0.50/cake for sprinkles
		if addSprinkles {
			cost += Double(quantity) / 2
		}

		return cost
	}
}
