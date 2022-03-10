//
//  TabViewExamplesView.swift
//  HotProspects
//
//  Created by Igor Chernyshov on 08.03.2022.
//

import SwiftUI

struct TabViewExamplesView: View {

	@StateObject var user = User()

	@State private var selectedTab = "One"

	var body: some View {
		TabView(selection: $selectedTab) {
			VStack {
				EditView()
					.padding()
					.border(.secondary, width: 2)
					.padding()

				DisplayView()
			}
			.environmentObject(user)
			.tabItem {
				Label("One", systemImage: "star")
			}
			.onTapGesture {
				selectedTab = "Two"
			}
			.tag("One")

			Text("Tab 2")
				.tabItem {
					Label("Two", systemImage: "circle")
				}
				.tag("Two")
		}
	}
}

struct TabViewExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewExamplesView()
    }
}
