//
//  SpiralFlowView.swift
//  LayoutAndGeometry
//
//  Created by Igor Chernyshov on 23.03.2022.
//

import SwiftUI

struct SpiralFlowView: View {
	
	let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

	var body: some View {
		GeometryReader { fullView in
			ScrollView {
				ForEach(0..<50) { index in
					GeometryReader { geo in
						Text("Row #\(index)")
							.font(.title)
							.frame(maxWidth: .infinity)
							.background(colors[index % 7])
							.rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
					}
					.frame(height: 40)
				}
			}
		}
	}
}

struct SpiralFlowView_Previews: PreviewProvider {
    static var previews: some View {
        SpiralFlowView()
    }
}
