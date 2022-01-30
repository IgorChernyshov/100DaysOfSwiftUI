//
//  PushButtonView.swift
//  Bookworm
//
//  Created by Igor Chernyshov on 29.01.2022.
//

import SwiftUI

struct PushButtonView: View {

	@State private var rememberMe = false

	var body: some View {
		VStack {
			PushButton(title: "Remember Me", isOn: $rememberMe)
			Text(rememberMe ? "On" : "Off")
		}
	}
}

struct PushButtonView_Previews: PreviewProvider {
    static var previews: some View {
		PushButtonView()
    }
}
