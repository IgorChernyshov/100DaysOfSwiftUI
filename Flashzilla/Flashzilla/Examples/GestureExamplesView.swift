//
//  GestureExamplesView.swift
//  Flashzilla
//
//  Created by Igor Chernyshov on 16.03.2022.
//

import SwiftUI

struct GestureExamplesView: View {

	@State private var currentAmount = 0.0
	@State private var finalAmount = 1.0

	@State private var rotationCurrentAmount = Angle.zero
	@State private var rotationFinalAmount = Angle.zero

	var body: some View {
		VStack {
			Text("Hello, World!")
				.padding()
				.onTapGesture(count: 2) {
					print("Double tapped!")
				}
				.onLongPressGesture(minimumDuration: 2) {
					print("Long pressed!")
				}

			Text("Long Press Closure")
				.padding()
				.onLongPressGesture(minimumDuration: 1) {
					print("Long pressed!")
				} onPressingChanged: { inProgress in
					print("In progress: \(inProgress)!")
				}

			Text("Resizeable Text")
				.padding()
				.scaleEffect(finalAmount + currentAmount)
				.gesture(
					MagnificationGesture()
						.onChanged { amount in
							currentAmount = amount - 1
						}
						.onEnded { amount in
							finalAmount += currentAmount
							currentAmount = 0
						}
				)

			Text("Rotating View")
				.rotationEffect(rotationCurrentAmount + rotationFinalAmount)
				.gesture(
					RotationGesture()
						.onChanged { angle in
							rotationCurrentAmount = angle
						}
						.onEnded { angle in
							rotationFinalAmount += rotationCurrentAmount
							rotationCurrentAmount = .zero
						}
				)
		}
		.onTapGesture {
			print("VStack tapped")
		}
		.highPriorityGesture(
			TapGesture()
				.onEnded { _ in
					print("VStack tapped (high priority)")
				}
		)
		.simultaneousGesture(
			TapGesture()
				.onEnded { _ in
					print("VStack tapped (simultaneous)")
				}
		)
	}
}

struct GestureExamplesView_Previews: PreviewProvider {
	static var previews: some View {
		GestureExamplesView()
	}
}
