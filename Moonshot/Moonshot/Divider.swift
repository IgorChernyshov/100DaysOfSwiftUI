//
//  Divider.swift
//  Moonshot
//
//  Created by Igor Chernyshov on 22.01.2022.
//

import SwiftUI

struct Divider: View {
    var body: some View {
		Rectangle()
			.frame(height: 2)
			.foregroundColor(.lightBackground)
			.padding(.vertical)
    }
}

struct Divider_Previews: PreviewProvider {
    static var previews: some View {
        Divider()
    }
}
