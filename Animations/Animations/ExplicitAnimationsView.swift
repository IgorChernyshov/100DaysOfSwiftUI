//
//  ExplicitAnimationsView.swift
//  Animations
//
//  Created by Igor Chernyshov on 08.01.2022.
//

import SwiftUI

struct ExplicitAnimationsView: View {

	@State private var animationAmount = 0.0
	@State private var enabled = false

	var body: some View {
		Button("Tap Me") {
			enabled.toggle()
		}
		.frame(width: 200, height: 200)
		.background(enabled ? .blue : .red)
		.animation(nil, value: enabled)
		.foregroundColor(.white)
		.clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
		.animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
	}
}

struct ExplicitAnimationsView_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimationsView()
    }
}
