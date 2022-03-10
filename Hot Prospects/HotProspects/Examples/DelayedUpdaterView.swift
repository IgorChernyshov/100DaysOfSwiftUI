//
//  DelayedUpdaterView.swift
//  HotProspects
//
//  Created by Igor Chernyshov on 08.03.2022.
//

import SwiftUI

struct DelayedUpdaterView: View {

	@ObservedObject var updater = DelayedUpdater()

	var body: some View {
		Text("Value is: \(updater.value)")
	}
}

struct DelayedUpdaterView_Previews: PreviewProvider {
    static var previews: some View {
        DelayedUpdaterView()
    }
}
