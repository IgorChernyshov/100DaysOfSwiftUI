//
//  ContentView.swift
//  Moonshot
//
//  Created by Igor Chernyshov on 16.01.2022.
//

import SwiftUI

struct ContentView: View {

	@State private var isShowingGrid = true

    var body: some View {
		NavigationView {
			ScrollView {
				if isShowingGrid {
					GridLayout()
				} else {
					ListLayout()
						.padding(.horizontal, 50)
				}
			}
			.navigationTitle("Moonshot")
			.background(.darkBackground)
			.preferredColorScheme(.dark)
			.toolbar {
				Button {
					isShowingGrid.toggle()
				} label: {
					Image(systemName: isShowingGrid ? "rectangle.grid.1x2" : "square.grid.2x2")
						.tint(.white)
				}
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
