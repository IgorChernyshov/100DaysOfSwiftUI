//
//  TransitionView.swift
//  Animations
//
//  Created by Igor Chernyshov on 08.01.2022.
//

import SwiftUI

struct TransitionView: View {

	@State private var isShowingRed = false

	var body: some View {
		ZStack {
			Rectangle()
				.fill(.blue)
				.frame(width: 200, height: 200)

			if isShowingRed {
				Rectangle()
					.fill(.red)
					.frame(width: 200, height: 200)
					.transition(.pivot)
			}
		}
		.onTapGesture {
			withAnimation {
				isShowingRed.toggle()
			}
		}
	}
}

struct TransitionView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionView()
    }
}
