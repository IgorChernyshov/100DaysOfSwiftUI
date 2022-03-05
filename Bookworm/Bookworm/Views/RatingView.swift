//
//  RatingView.swift
//  Bookworm
//
//  Created by Igor Chernyshov on 30.01.2022.
//

import SwiftUI

struct RatingView: View {

	@Binding var rating: Int

	var label = ""

	var maximumRating = 5

	var offImage = Image(systemName: "star")
	var onImage = Image(systemName: "star.fill")

	var offColor = Color.gray
	var onColor = Color.yellow

    var body: some View {
		HStack {
			if label.isEmpty == false {
				Text(label)
			}

			ForEach(1..<maximumRating + 1, id: \.self) { number in
				image(for: number)
					.foregroundColor(number > rating ? offColor : onColor)
					.onTapGesture {
						rating = number
					}
//					.accessibilityLabel("\(number == 1 ? "1 star" : "\(number) stars")")
//					.accessibilityRemoveTraits(.isImage)
//					.accessibilityAddTraits(number > rating ? .isButton : [.isButton, .isSelected])
			}
		}
		.accessibilityElement()
		.accessibilityLabel(label)
		.accessibilityValue(rating == 1 ? "1 star" : "\(rating) stars")
		.accessibilityAdjustableAction { direction in
			switch direction {
			case .increment:
				if rating < maximumRating { rating += 1 }
			case .decrement:
				if rating > 1 { rating -= 1 }
			default:
				break
			}
		}
    }

	private func image(for number: Int) -> Image {
		number > rating ? offImage : onImage
	}
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
		RatingView(rating: .constant(3))
    }
}
