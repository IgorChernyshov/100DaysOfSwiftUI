//
//  FlagView.swift
//  GuessTheFlag
//
//  Created by Igor Chernyshov on 27.12.2021.
//

import SwiftUI

struct FlagView: View {

	private let imageName: String

	init(_ name: String) {
		self.imageName = name
	}

	var body: some View {
		Image(imageName)
			.renderingMode(.original)
			.clipShape(Capsule())
			.shadow(radius: 5)
	}
}

struct FlagView_Previews: PreviewProvider {
	static var previews: some View {
		FlagView("Estonia")
	}
}
