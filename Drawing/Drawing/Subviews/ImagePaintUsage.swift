//
//  ImagePaintUsage.swift
//  Drawing
//
//  Created by Igor Chernyshov on 22.01.2022.
//

import SwiftUI

struct ImagePaintUsage: View {
	var body: some View {
		VStack {
			Text("Hello World")
				.frame(width: 300, height: 300)
				.border(ImagePaint(image: Image(systemName: "pencil"), scale: 0.2), width: 30)
			
			Text("Hello World")
				.frame(width: 300, height: 300)
				.border(ImagePaint(image: Image(systemName: "pencil"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 30)
			
			Capsule()
				.strokeBorder(ImagePaint(image: Image(systemName: "pencil"), scale: 0.1), lineWidth: 20)
				.frame(width: 300, height: 200)
		}
	}
}

struct ImagePaintUsage_Previews: PreviewProvider {
	static var previews: some View {
		ImagePaintUsage()
	}
}
