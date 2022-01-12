//
//  GuidedContentView.swift
//  iExpense
//
//  Created by Igor Chernyshov on 11.01.2022.
//

import SwiftUI

struct User: Codable {
	let firstName: String
	let lastName: String
}

struct GuidedContentView: View {

	@State private var user = User(firstName: "Taylor", lastName: "Swift")
	@State private var numbers = [Int]()
	@AppStorage("currentNumber") private var currentNumber = 1

	var body: some View {
		NavigationView {
			VStack {
				List {
					ForEach(numbers, id: \.self) {
						Text("Row \($0)")
					}
					.onDelete(perform: removeRows)
				}

				Button("Save User") {
					if let data = try? JSONEncoder().encode(user) {
						UserDefaults.standard.set(data, forKey: "UserData")
					}
				}

				Button("Add Number") {
					numbers.append(currentNumber)
					currentNumber += 1
				}
			}
			.toolbar {
				EditButton()
			}
		}
	}

	private func removeRows(at offsets: IndexSet) {
		numbers.remove(atOffsets: offsets)
	}
}

struct GuidedContentView_Previews: PreviewProvider {
    static var previews: some View {
		GuidedContentView()
    }
}
