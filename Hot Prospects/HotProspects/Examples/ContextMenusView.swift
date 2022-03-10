//
//  ContextMenusView.swift
//  HotProspects
//
//  Created by Igor Chernyshov on 10.03.2022.
//

import SwiftUI

struct ContextMenusView: View {

	@State private var backgroundColor = Color.red

	var body: some View {
		VStack {
			Text("Hello, World!")
				.padding()
				.background(backgroundColor)

			Text("Change Color")
				.padding()
				.contextMenu {
					Button(role: .destructive) {
						backgroundColor = .red
					} label: {
						Label("Red", systemImage: "checkmark.circle.fill")
							// .foregroundColor(.red) modifier is ignored - all menus must have the same style
					}

					Button("Green") {
						backgroundColor = .green
					}

					Button("Blue") {
						backgroundColor = .blue
					}
				}
		}
	}
}

struct ContextMenusView_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenusView()
    }
}
