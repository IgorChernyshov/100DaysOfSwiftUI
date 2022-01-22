//
//  Trapezoid.swift
//  Drawing
//
//  Created by Igor Chernyshov on 22.01.2022.
//

import SwiftUI

struct Trapezoid: Shape {

	var insetAmount: Double

	var animatableData: Double {
		get { insetAmount }
		set { insetAmount = newValue }
	}

	func path(in rect: CGRect) -> Path {
		var path = Path()

		path.move(to: CGPoint(x: 0, y: rect.maxY))
		path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
		path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
		path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
		path.addLine(to: CGPoint(x: 0, y: rect.maxY))

		return path
	}
}

struct Trapezoid_Previews: PreviewProvider {
	static var previews: some View {
		Trapezoid(insetAmount: 50)
	}
}
