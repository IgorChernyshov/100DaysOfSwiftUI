//
//  ColoredAmount.swift
//  iExpense
//
//  Created by Igor Chernyshov on 13.01.2022.
//

import SwiftUI

struct ColoredAmount: ViewModifier {

	let amount: Double

	func body(content: Content) -> some View {
		let color: Color = amount <= 10 ? .green : amount <= 100 ? .yellow : .red
		content
			.foregroundColor(color)
	}
}

extension View {

	func coloredAmount(amount: Double) -> some View {
		modifier(ColoredAmount(amount: amount))
	}
}
