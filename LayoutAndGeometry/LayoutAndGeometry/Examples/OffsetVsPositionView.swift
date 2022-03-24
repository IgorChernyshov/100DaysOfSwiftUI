//
//  OffsetVsPositionView.swift
//  LayoutAndGeometry
//
//  Created by Igor Chernyshov on 22.03.2022.
//

import SwiftUI

struct OffsetVsPositionView: View {
    var body: some View {
		Text("Hello, world!")
			// Takes up all available space to guarantee the required position
			.position(x: 100, y: 100)
			.background(.red)

		Text("Hello, world!")
			// Shifts the render without moving the actual view
			.offset(x: 100, y: 100)
			.background(.blue)
    }
}

struct OffsetVsPositionView_Previews: PreviewProvider {
    static var previews: some View {
        OffsetVsPositionView()
    }
}
