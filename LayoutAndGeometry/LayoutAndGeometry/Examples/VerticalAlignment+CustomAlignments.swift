//
//  VerticalAlignment+CustomAlignments.swift
//  LayoutAndGeometry
//
//  Created by Igor Chernyshov on 22.03.2022.
//

import SwiftUI

extension VerticalAlignment {

	enum MidAccountAndName: AlignmentID {
		static func defaultValue(in d: ViewDimensions) -> CGFloat {
			d[.top]
		}
	}

	static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}
