//
//  DelayedUpdater.swift
//  HotProspects
//
//  Created by Igor Chernyshov on 09.03.2022.
//

import SwiftUI

@MainActor class DelayedUpdater: ObservableObject {

	var value = 0 {
		willSet {
			// This replaces @Published
			objectWillChange.send()
		}
	}

	init() {
		for i in 1...10 {
			DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
				self.value += 1
			}
		}
	}
}
