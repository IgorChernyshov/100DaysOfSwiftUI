//
//  ColorBlendView.swift
//  Drawing
//
//  Created by Igor Chernyshov on 22.01.2022.
//

import SwiftUI

struct ColorBlendView: View {

	@State private var amount = 0.0

	var body: some View {
		Image("flame.circle.fill")
			.colorMultiply(.red)

		VStack {
			ZStack {
				Circle()
					.fill(.red)
					.frame(width: 200 * amount)
					.offset(x: -50, y: -80)
					.blendMode(.screen)

				Circle()
					.fill(.green)
					.frame(width: 200 * amount)
					.offset(x: 50, y: -80)
					.blendMode(.screen)

				Circle()
					.fill(.blue)
					.frame(width: 200 * amount)
					.blendMode(.screen)
			}
			.frame(width: 300, height: 300)

			Slider(value: $amount)
				.padding()
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(.black)
		.ignoresSafeArea()
	}
}

struct ColorBlendView_Previews: PreviewProvider {
	static var previews: some View {
		ColorBlendView()
	}
}
