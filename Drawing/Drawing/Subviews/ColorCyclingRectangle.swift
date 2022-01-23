//
//  ColorCyclingRectangle.swift
//  Drawing
//
//  Created by Igor Chernyshov on 23.01.2022.
//

import SwiftUI

struct ColorCyclingRectangleView: View {

	@State private var colorCycle = 0.0
	@State private var gradientStart = 0.0
	@State private var gradientEnd = 0.0

	var body: some View {
		VStack {
			ZStack {
				ColorCyclingRectangle(amount: colorCycle, gradientStart: gradientStart, gradientEnd: gradientEnd)
					.frame(width: 300, height: 300)
			}
			.drawingGroup()

			Text("Color Offset")
			Slider(value: $colorCycle)

			Text("Gradient Start")
			Slider(value: $gradientStart, in: 0...1, step: 0.05)

			Text("Gradient End")
			Slider(value: $gradientEnd, in: 0...1, step: 0.05)
		}
		.padding()
	}
}

struct ColorCyclingRectangle: View {

	var amount = 0.0
	var steps = 100

	var gradientStart = 0.0
	var gradientEnd = 0.0

	var body: some View {
		ZStack {
			ForEach(0..<steps) { value in
				Rectangle()
					.inset(by: Double(value))
					.strokeBorder(
						LinearGradient(
							gradient: Gradient(colors: [
								color(for: value, brightness: 1),
								color(for: value, brightness: 0.5)
							]),
							startPoint: .init(x: gradientStart, y: gradientEnd),
							endPoint: .bottom
						),
						lineWidth: 2
					)
			}
		}
	}

	func color(for value: Int, brightness: Double) -> Color {
		var targetHue = Double(value) / Double(steps) + amount

		if targetHue > 1 {
			targetHue -= 1
		}

		return Color(hue: targetHue, saturation: 1, brightness: brightness)
	}
}

struct CColorCyclingRectangleView_Previews: PreviewProvider {
    static var previews: some View {
		ColorCyclingRectangleView()
    }
}
