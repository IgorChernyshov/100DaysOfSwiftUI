//
//  View+Helpers.swift
//  Flashzilla
//
//  Created by Igor Chernyshov on 19.03.2022.
//

import SwiftUI

extension View {
	func stacked(at position: Int, in total: Int) -> some View {
		let offset = Double(total - position)
		return self.offset(x: 0, y: offset * 10)
	}
}
