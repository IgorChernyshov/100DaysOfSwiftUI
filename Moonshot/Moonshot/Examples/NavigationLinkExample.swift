//
//  NavigationLinkExample.swift
//  Moonshot
//
//  Created by Igor Chernyshov on 16.01.2022.
//

import SwiftUI

struct NavigationLinkExample: View {

	struct User: Codable {
		let name: String
		let address: Address
	}

	struct Address: Codable {
		let street: String
		let city: String
	}

	var body: some View {
		NavigationView {
			List(0..<100) { row in
				NavigationLink {
					VStack {
						Text("Detail \(row)")

						Button("Decode JSON") {
							let input = """
							{
								"name": "Taylor Swift",
								"address": {
									"street": "555, Taylor Swift Avenue",
									"city": "Nashville"
								}
							}
							"""

							let data = Data(input.utf8)
							let decoder = JSONDecoder()
							if let user = try? decoder.decode(User.self, from: data) {
								print(user.address.street)
							}
						}
					}
				} label: {
					Text("Row \(row)")
				}
			}
			.navigationTitle("SwiftUI")
		}
	}
}

struct NavigationLinkExample_Previews: PreviewProvider {
	static var previews: some View {
		NavigationLinkExample()
	}
}
