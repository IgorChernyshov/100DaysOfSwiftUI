//
//  ContentView.swift
//  FriendsFace
//
//  Created by Igor Chernyshov on 05.02.2022.
//

import SwiftUI

struct ContentView: View {

	@State private var users = [User]()

	@State private var isLoggedIn = false

    var body: some View {
		NavigationView {
			List {
				ForEach(users) { user in
					NavigationLink {
						UserProfile(user: user)
					} label: {
						UserPreview(user: user)
					}
				}
			}
			.navigationTitle("Friends Face")
			.toolbar {
				Button(isLoggedIn ? "Log out" : "Login") {
					Task {
						isLoggedIn.toggle()
						await loadUsers()
					}
				}
			}
		}
    }

	private func loadUsers() async {
		guard users.isEmpty, isLoggedIn else { return }
		let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!

		do {
			let (data, _) = try await URLSession.shared.data(from: url)

			let decoder = JSONDecoder()
			decoder.dateDecodingStrategy = .iso8601

			let encodedUsers = try decoder.decode([User].self, from: data)
			users = encodedUsers
		} catch {
			print(error.localizedDescription)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
