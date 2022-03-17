//
//  AccessibilityFeaturesSupportView.swift
//  Flashzilla
//
//  Created by Igor Chernyshov on 17.03.2022.
//

import SwiftUI

struct AccessibilityFeaturesSupportView: View {

	@Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor

	@Environment(\.accessibilityReduceMotion) var reduceMotion
	@State private var scale = 1.0

	@Environment(\.accessibilityReduceTransparency) var reduceTransparency

	var body: some View {
		VStack {
			HStack {
				if differentiateWithoutColor {
					Image(systemName: "checkmark.circle")
				}

				Text("Success")
			}
			.padding()
			.background(differentiateWithoutColor ? .black : .green)
			.foregroundColor(.white)
			.clipShape(Capsule())

			Text("Reduce Motion Accessibility")
				.scaleEffect(scale)
				.onTapGesture {
					withOptionalAnimation {
						scale *= 1.5
					}
				}

			Text("Hello, World!")
				.padding()
				.background(reduceTransparency ? .black : .black.opacity(0.5))
				.foregroundColor(.white)
				.clipShape(Capsule())
		}
	}

	private func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
		if UIAccessibility.isReduceMotionEnabled {
			return try body()
		} else {
			return try withAnimation(animation, body)
		}
	}
}

struct AccessibilityFeaturesSupportView_Previews: PreviewProvider {
    static var previews: some View {
        AccessibilityFeaturesSupportView()
    }
}
