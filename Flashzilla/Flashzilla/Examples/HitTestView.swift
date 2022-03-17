//
//  HitTestView.swift
//  Flashzilla
//
//  Created by Igor Chernyshov on 16.03.2022.
//

import SwiftUI

struct HitTestView: View {

    var body: some View {
		VStack {
			VStack {
				Text("Hello")
				// Not tapable by default
				Spacer().frame(height: 100)
				Text("World")
			}
			// Overrides VStack tapable area
			.contentShape(Rectangle())
			.onTapGesture {
				print("VStack tapped!")
			}

			ZStack {
				Rectangle()
					.fill(.blue)
					.frame(width: 300, height: 300)
					.onTapGesture {
						print("Rectangle tapped!")
					}

				Circle()
					.fill(.red)
					.frame(width: 300, height: 300)
				// Overrides tapable area
					.contentShape(Rectangle())
					.onTapGesture {
						print("Circle tapped!")
					}
				// Taps go through the view
					.allowsHitTesting(false)
			}
		}
    }
}

struct HitTestView_Previews: PreviewProvider {
    static var previews: some View {
        HitTestView()
    }
}
