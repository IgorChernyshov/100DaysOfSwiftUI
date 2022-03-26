//
//  DotsView.swift
//  Dices
//
//  Created by Igor Chernyshov on 26.03.dotSize22.
//

import SwiftUI

struct DotsView: View {

	let numberOfDots: Int

	let dotSize: CGFloat

	init(numberOfDots: Int, dotSize: CGFloat = 20) {
		if numberOfDots < 1 {
			self.numberOfDots = 1
		} else {
			self.numberOfDots = min(numberOfDots, 6)
		}

		self.dotSize = dotSize
	}

    var body: some View {
		GeometryReader { geo in
			switch numberOfDots {
			case 1:
				Circle()
					.frame(width: dotSize, height: dotSize)
					.position(x: geo.size.width / 2, y: geo.size.height / 2)
			case 2:
				ZStack {
					Circle()
						.frame(width: dotSize, height: dotSize)
						.position(x: dotSize * 1.5, y: dotSize * 1.5)

					Circle()
						.frame(width: dotSize, height: dotSize)
						.position(x: geo.size.width - dotSize * 1.5, y: geo.size.height - dotSize * 1.5)
				}
			case 3:
				ZStack {
					Circle()
						.frame(width: dotSize, height: dotSize)
						.position(x: dotSize * 1.5, y: dotSize * 1.5)

					Circle()
						.frame(width: dotSize, height: dotSize)
						.position(x: geo.size.width / 2, y: geo.size.height / 2)

					Circle()
						.frame(width: dotSize, height: dotSize)
						.position(x: geo.size.width - dotSize * 1.5, y: geo.size.height - dotSize * 1.5)
				}
			case 4:
				ZStack {
					Circle()
						.frame(width: dotSize, height: dotSize)
						.position(x: dotSize * 1.5, y: dotSize * 1.5)

					Circle()
						.frame(width: dotSize, height: dotSize)
						.position(x: geo.size.width - dotSize * 1.5, y: dotSize * 1.5)

					Circle()
						.frame(width: dotSize, height: dotSize)
						.position(x: geo.size.width - dotSize * 1.5, y: geo.size.height - dotSize * 1.5)

					Circle()
						.frame(width: dotSize, height: dotSize)
						.position(x: dotSize * 1.5, y: geo.size.height - dotSize * 1.5)
				}
			case 5:
				ZStack {
					Circle()
						.frame(width: dotSize, height: dotSize)
						.position(x: dotSize * 1.5, y: dotSize * 1.5)

					Circle()
						.frame(width: dotSize, height: dotSize)
						.position(x: geo.size.width - dotSize * 1.5, y: dotSize * 1.5)

					Circle()
						.frame(width: dotSize, height: dotSize)
						.position(x: geo.size.width / 2, y: geo.size.height / 2)

					Circle()
						.frame(width: dotSize, height: dotSize)
						.position(x: geo.size.width - dotSize * 1.5, y: geo.size.height - dotSize * 1.5)

					Circle()
						.frame(width: dotSize, height: dotSize)
						.position(x: dotSize * 1.5, y: geo.size.height - dotSize * 1.5)
				}
			case 6:
				ZStack {
					Circle()
						.frame(width: dotSize, height: dotSize)
						.position(x: dotSize * 1.5, y: dotSize * 1.5)

					Circle()
						.frame(width: dotSize, height: dotSize)
						.position(x: dotSize * 1.5, y: geo.size.height / 2)

					Circle()
						.frame(width: dotSize, height: dotSize)
						.position(x: geo.size.width - dotSize * 1.5, y: dotSize * 1.5)

					Circle()
						.frame(width: dotSize, height: dotSize)
						.position(x: geo.size.width - dotSize * 1.5, y: geo.size.height - dotSize * 1.5)

					Circle()
						.frame(width: dotSize, height: dotSize)
						.position(x: geo.size.width - dotSize * 1.5, y: geo.size.height / 2)

					Circle()
						.frame(width: dotSize, height: dotSize)
						.position(x: dotSize * 1.5, y: geo.size.height - dotSize * 1.5)
				}
			default:
				Image(systemName: "star.fill")
			}
		}.shadow(radius: 5)
    }
}

struct DotsView_Previews: PreviewProvider {
    static var previews: some View {
		DotsView(numberOfDots: 5)
			.frame(width: 200, height: 200)
    }
}
