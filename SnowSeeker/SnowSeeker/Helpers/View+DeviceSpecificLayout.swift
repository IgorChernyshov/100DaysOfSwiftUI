//
//  View+DeviceSpecificLayout.swift
//  SnowSeeker
//
//  Created by Igor Chernyshov on 26.03.2022.
//

import SwiftUI

extension View {
	@ViewBuilder func phoneOnlyStackNavigationView() -> some View {
		if UIDevice.current.userInterfaceIdiom == .phone {
			self.navigationViewStyle(.stack)
		} else {
			self
		}
	}
}
