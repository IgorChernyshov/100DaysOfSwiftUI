//
//  UserPreview.swift
//  FriendsFace
//
//  Created by Igor Chernyshov on 05.02.2022.
//

import SwiftUI

struct UserPreview: View {

	let user: User

    var body: some View {
		HStack(spacing: 16) {
			Circle()
				.frame(width: 64, height: 64)
				.foregroundColor(.mint)

			VStack(alignment: .leading, spacing: 0) {
				Text(user.name)
					.font(.title)
					.fontWeight(.medium)

				HStack {
					Circle()
						.frame(width: 8, height: 8)
						.foregroundColor(user.isActive ? .green : .gray)

					Text("\(user.isActive ? "Online" : "Offline")")
						.opacity(user.isActive ?  0.75 : 0.5)
				}
			}
		}
		.padding()
		.frame(maxWidth: .infinity, alignment: .leading)
		.overlay(
			RoundedRectangle(cornerRadius: 10)
				.stroke(.mint)
		)
    }
}
