//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Igor Chernyshov on 24.03.2022.
//

import SwiftUI

struct ContentView: View {

	var body: some View {
		GeometryReader { fullView in
			ScrollView(.vertical) {
				ForEach(0..<50) { index in
					GeometryReader { geo in
						Text("Row #\(index)")
							.font(.title)
							.frame(maxWidth: .infinity)
							.background(Color(hue: (1 / fullView.frame(in: .global).maxY) * geo.frame(in: .global).minY, saturation: 1, brightness: 1))
							.rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
							.opacity(geo.frame(in: .global).maxY / 200)
							.scaleEffect((0.5 / fullView.size.height) * geo.frame(in: .global).maxY + 0.5)
					}
					.frame(height: 40)
				}
			}
		}
		.ignoresSafeArea()
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
