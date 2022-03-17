//
//  BasicHapticView.swift
//  Flashzilla
//
//  Created by Igor Chernyshov on 16.03.2022.
//

import SwiftUI

struct BasicHapticView: View {

    var body: some View {
        Text("Hello, World!")
			.onTapGesture(perform: simpleSuccess)
			.onLongPressGesture(minimumDuration: 1, perform: simpleWarning)
			.onLongPressGesture(minimumDuration: 2, perform: simpleError)
    }

	private func simpleSuccess() {
		let generator = UINotificationFeedbackGenerator()
		generator.notificationOccurred(.success)
	}

	private func simpleError() {
		let generator = UINotificationFeedbackGenerator()
		generator.notificationOccurred(.error)
	}

	private func simpleWarning() {
		let generator = UINotificationFeedbackGenerator()
		generator.notificationOccurred(.warning)
	}
}

struct BasicHapticView_Previews: PreviewProvider {
    static var previews: some View {
        BasicHapticView()
    }
}
