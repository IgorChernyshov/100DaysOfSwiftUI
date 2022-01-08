//
//  ContentView.swift
//  Animations
//
//  Created by Igor Chernyshov on 07.01.2022.
//

import SwiftUI

struct ContentView: View {

	@State private var animationAmount = 1.0

	var body: some View {
		VStack {
			Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)

			Spacer()

			Button("Tap Me") {
				animationAmount += 1
			}
			.padding(40)
			.background(.red)
			.foregroundColor(.white)
			.clipShape(Circle())
			.scaleEffect(animationAmount)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
