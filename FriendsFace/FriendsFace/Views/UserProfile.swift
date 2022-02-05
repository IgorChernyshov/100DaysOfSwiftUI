//
//  UserProfile.swift
//  FriendsFace
//
//  Created by Igor Chernyshov on 05.02.2022.
//

import SwiftUI

struct UserProfile: View {

	let user: User

    var body: some View {
		VStack {
			Circle()
				.frame(width: 128, height: 128)
				.foregroundColor(.mint)

			HStack {
				Text(user.name)
					.font(.title)
					.fontWeight(.medium)

				Circle()
					.frame(width: 8, height: 8)
					.foregroundColor(user.isActive ? .green : .gray)
			}

			ScrollView(.vertical, showsIndicators: true) {
				VStack(spacing: 16) {
					Text("FriendsFace member since: \(user.formattedRegisteredDate)")

					Text("\(user.age) y.o. Works @\(user.company).")

					HStack {
						Text(user.tags.map { "#\($0)" }.joined(separator: " "))
							.foregroundColor(.blue)
					}

					Text("Bio: \(user.about)")

					HStack {
						Text("Friends: \(user.friends.map { $0.name }.joined(separator: ", "))")
					}
				}
			}
		}
		.padding(.horizontal)
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile(user: User(id: "id",
							   isActive: true,
							   name: "Lol Kek",
							   age: 21,
							   company: "Sber",
							   email: "mail@sber.ru",
							   address: "Moscow City",
							   about: "iOS Developer",
							   registered: Date(),
							   tags: ["snowboard", "gaming"],
							   friends: [Friend(id: "qwe123-321ewq", name: "Simple Man"),
										 Friend(id: "rty456-654ytr", name: "Simple Woman")]))
    }
}
