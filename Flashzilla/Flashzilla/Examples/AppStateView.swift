//
//  AppStateView.swift
//  Flashzilla
//
//  Created by Igor Chernyshov on 17.03.2022.
//

import SwiftUI

struct AppStateView: View {

	@Environment(\.scenePhase) var scenePhase

	var body: some View {
		Text("Hello, world!")
			.padding()
			.onChange(of: scenePhase) { newPhase in
				if newPhase == .active {
					print("Active")
				} else if newPhase == .inactive {
					print("Inactive")
				} else if newPhase == .background {
					print("Background")
				}
			}
	}
}

struct AppStateView_Previews: PreviewProvider {
    static var previews: some View {
        AppStateView()
    }
}
