//
//  Triangle.swift
//  Drawing
//
//  Created by Igor Chernyshov on 22.01.2022.
//

import SwiftUI

struct Triangle: Shape {
	func path(in rect: CGRect) -> Path {
		var path = Path()

		path.move(to: CGPoint(x: rect.midX, y: rect.minY))
		path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
		path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
		path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

		return path
	}
}

struct Triangle_Previews: PreviewProvider {
    static var previews: some View {
		Triangle().path(in: CGRect(x: 50, y: 50, width: 30, height: 30))
    }
}
