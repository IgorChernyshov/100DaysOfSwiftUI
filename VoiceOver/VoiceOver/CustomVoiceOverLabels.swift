//
//  CustomVoiceOverLabels.swift
//  VoiceOver
//
//  Created by Igor Chernyshov on 04.03.2022.
//

import SwiftUI

struct CustomVoiceOverLabels: View {
	let pictures = [
		"ales-krivec-15949",
		"galina-n-189483",
		"kevin-horstmann-141705",
		"nicolas-tissot-335096"
	]

	let labels = [
		"Tulips",
		"Frozen tree buds",
		"Sunflowers",
		"Fireworks",
	]

	@State private var selectedPicture = Int.random(in: 0...3)

	var body: some View {
		VStack {
			Image(pictures[selectedPicture])
				.resizable()
				.scaledToFit()
				.accessibilityLabel(labels[selectedPicture])
				.accessibilityAddTraits(.isButton)
				.accessibilityRemoveTraits(.isImage)
				.onTapGesture {
					selectedPicture = Int.random(in: 0...3)
				}

			Image(decorative: UIImage(systemName: "star")!.cgImage!, scale: 1.0)
				.accessibilityHidden(true)

			VStack {
				Text("Your score is")
				Text("1000")
					.font(.title)
			}
			.accessibilityElement(children: .combine) // <- Pause between two pieces

			VStack {
				Text("Your score is")
				Text("1000")
					.font(.title)
			}
			.accessibilityElement(children: .ignore) // <- BTW it's a default parameter
			.accessibilityLabel("Your score is 1000") // <- Custom pronunciation
		}
	}
}

struct CustomVoiceOverLabels_Previews: PreviewProvider {
    static var previews: some View {
        CustomVoiceOverLabels()
    }
}
