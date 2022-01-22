//
//  ContentView.swift
//  Drawing
//
//  Created by Igor Chernyshov on 22.01.2022.
//

import SwiftUI

struct ContentView: View {

	@State private var petalOffset = -20.0
	@State private var petalWidth = 100.0

	@State private var insetAmount = 50.0

	@State private var rows = 4
	@State private var columns = 4

	var body: some View {
		VStack(spacing: 20) {
			Path { path in
				path.move(to: CGPoint(x: 200, y: 100))
				path.addLine(to: CGPoint(x: 100, y: 300))
				path.addLine(to: CGPoint(x: 300, y: 300))
				path.addLine(to: CGPoint(x: 200, y: 100))
//				path.closeSubpath()
			}
//			.fill(.blue)
//			.stroke(.blue, lineWidth: 10)
			.stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))

			Triangle()
				.stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
				.frame(width: 300, height: 300)

			Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
				.strokeBorder(.blue, lineWidth: 30)
				.frame(width: 300, height: 300)

			Circle()
				.strokeBorder(.blue, lineWidth: 40)
		}

		VStack {
			Flower(petalOffset: petalOffset, petalWidth: petalWidth)
//				.stroke(.red, lineWidth: 1)
				.fill(.red, style: FillStyle(eoFill: true))

			Text("Offset")
			Slider(value: $petalOffset, in: -40...40)
				.padding([.horizontal, .bottom])

			Text("Width")
			Slider(value: $petalWidth, in: 0...100)
				.padding(.horizontal)
		}

		Trapezoid(insetAmount: insetAmount)
			.frame(width: 200, height: 100)
			.onTapGesture {
				withAnimation {
					insetAmount = Double.random(in: 10...90)
				}
			}

		Checkerboard(rows: rows, columns: columns)
			.onTapGesture {
				withAnimation(.linear(duration: 3)) {
					rows = 8
					columns = 16
				}
			}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
