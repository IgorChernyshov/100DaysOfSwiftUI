//
//  Prominent.swift
//  ViewsAndModifiers
//
//  Created by Igor Chernyshov on 28.12.2021.
//

import SwiftUI

struct Prominent: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.largeTitle)
			.foregroundColor(.blue)
	}
}

extension View {
	func prominent() -> some View {
		modifier(Prominent())
	}
}
