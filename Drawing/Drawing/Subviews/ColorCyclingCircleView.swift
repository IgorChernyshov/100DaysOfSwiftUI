//
//  ColorCyclingCircleView.swift
//  Drawing
//
//  Created by Igor Chernyshov on 22.01.2022.
//

import SwiftUI

struct ColorCyclingCircleView: View {

	@State private var colorCycle = 0.0

	var body: some View {
		VStack {
			ZStack {
				ColorCyclingCircle(amount: colorCycle)
				.frame(width: 300, height: 300)
			}
			.drawingGroup()

			Slider(value: $colorCycle)
		}

	}
}

struct ColorCyclingCircleView_Previews: PreviewProvider {
	static var previews: some View {
		ColorCyclingCircleView()
	}
}
