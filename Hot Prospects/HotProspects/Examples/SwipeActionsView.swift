//
//  SwipeActionsView.swift
//  HotProspects
//
//  Created by Igor Chernyshov on 10.03.2022.
//

import SwiftUI

struct SwipeActionsView: View {
    var body: some View {
		List {
			Text("Taylor Swift")
				.swipeActions {
					Button(role: .destructive) {
						print("Hi")
					} label: {
						Label("Delete", systemImage: "minus.circle")
					}
				}
				.swipeActions(edge: .leading) {
					Button {
						print("Hi")
					} label: {
						Label("Pin", systemImage: "pin")
					}
					.tint(.orange)
				}
		}
    }
}

struct SwipeActionsView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeActionsView()
    }
}
