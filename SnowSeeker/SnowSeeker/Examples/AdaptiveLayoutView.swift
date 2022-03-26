//
//  AdaptiveLayoutView.swift
//  SnowSeeker
//
//  Created by Igor Chernyshov on 26.03.2022.
//

import SwiftUI

struct AdaptiveLayoutView: View {

	@State private var selectedUser: User? = nil

	var body: some View {
		NavigationView {
			NavigationLink {
				Text("New secondary")
					.onTapGesture {
						selectedUser = User()
					}
					.sheet(item: $selectedUser) { user in
						Text(user.id)
					}
			} label: {
				Text("Hello, World!")
			}
			.navigationTitle("Primary")

			Text("Secondary")
		}
	}
}

struct AdaptiveLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        AdaptiveLayoutView()
			.previewInterfaceOrientation(.portrait)
    }
}
