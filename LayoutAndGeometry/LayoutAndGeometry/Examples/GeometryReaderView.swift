//
//  GeometryReaderView.swift
//  LayoutAndGeometry
//
//  Created by Igor Chernyshov on 22.03.2022.
//

import SwiftUI

struct GeometryReaderView: View {

	var body: some View {
		VStack {
			GeometryReader { geo in
				Text("Hello, World!")
					// Take 90% of the width regardless of content
					.frame(width: geo.size.width * 0.9, height: 40)
					.background(.red)
			}
			.background(.green)

			Text("More text")
				.background(.blue)
		}
	}
}

struct GeometryReaderView_Previews: PreviewProvider {
	static var previews: some View {
		GeometryReaderView()
	}
}
