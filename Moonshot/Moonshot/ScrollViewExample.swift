//
//  ScrollViewExample.swift
//  Moonshot
//
//  Created by Igor Chernyshov on 16.01.2022.
//

import SwiftUI

struct ScrollViewExample: View {
    var body: some View {
		ScrollView(.horizontal) {
			LazyHStack(spacing: 10) {
				ForEach(0..<100) {
					Text("Item \($0)")
						.font(.title)
				}
			}
		}
    }
}

struct ScrollViewExample_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewExample()
    }
}
