//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Igor Chernyshov on 26.12.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		VStack {
			Text("Gryffindor")
				.font(.largeTitle)
				.blur(radius: 1)
			Text("Hufflepuff")
			Text("Ravenclaw")
			Text("Slytherin")
				.prominent()

			Text("Hello, world!")
				.padding()
				.background(.red)
				.padding()
				.background(.blue)
				.padding()
				.background(.green)
				.padding()
				.background(.yellow)
		}
		// Modifiers like fonts are applied to all child views
		// They are overriden by child individual modifiers
		.font(.body)
		// Modifiers like blur are applied to all child views
		// Any individual child modifiers are then added to parent modifier
		.blur(radius: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
