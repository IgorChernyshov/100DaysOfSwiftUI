//
//  SizeClassLayoutView.swift
//  SnowSeeker
//
//  Created by Igor Chernyshov on 26.03.2022.
//

import SwiftUI

struct SizeClassLayoutView: View {

	@Environment(\.horizontalSizeClass) var sizeClass

	var body: some View {
		if sizeClass == .compact {
			VStack(content: UserView.init)
		} else {
			HStack(content: UserView.init)
		}
	}
}

struct SizeClassLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        SizeClassLayoutView()
    }
}
