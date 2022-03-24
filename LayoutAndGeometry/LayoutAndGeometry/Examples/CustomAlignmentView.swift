//
//  CustomAlignmentView.swift
//  LayoutAndGeometry
//
//  Created by Igor Chernyshov on 22.03.2022.
//

import SwiftUI

struct CustomAlignmentView: View {

	var body: some View {
		HStack(alignment: .midAccountAndName) {
			VStack {
				Text("@twostraws")
					.alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
				Image("paul-hudson")
					.resizable()
					.frame(width: 64, height: 64)
					.background(.green)
			}

			VStack {
				Text("Full name:")
				Text("PAUL HUDSON")
					.alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
					.font(.largeTitle)
			}
		}
	}
}

struct CustomAlignmentView_Previews: PreviewProvider {
	static var previews: some View {
		CustomAlignmentView()
	}
}
