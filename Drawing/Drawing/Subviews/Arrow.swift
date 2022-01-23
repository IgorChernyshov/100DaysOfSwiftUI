//
//  Arrow.swift
//  Drawing
//
//  Created by Igor Chernyshov on 23.01.2022.
//

import SwiftUI

struct ArrowContainer: View {

	@State private var lineWidth = 3.0

	var body: some View {
		VStack {
			Arrow()
				.stroke(.green, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))

			Slider(value: $lineWidth, in: 1...30)
		}
		.padding()
	}
}

struct Arrow: Shape {
	func path(in rect: CGRect) -> Path {
		let oneSixthX = rect.maxX / 6
		let oneSixthY = rect.maxY / 6

		var path = Path()
		path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
		path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
		path.addLine(to: CGPoint(x: rect.midX - oneSixthX, y: rect.minY + oneSixthY))
		path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
		path.addLine(to: CGPoint(x: rect.midX + oneSixthX, y: rect.minY + oneSixthY))

		return path
	}
}

struct ArrowContainer_Previews: PreviewProvider {
    static var previews: some View {
		ArrowContainer()
    }
}
