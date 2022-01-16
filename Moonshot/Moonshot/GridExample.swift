//
//  GridExample.swift
//  Moonshot
//
//  Created by Igor Chernyshov on 16.01.2022.
//

import SwiftUI

struct GridExample: View {

	let layout = [GridItem(.fixed(80)), GridItem(.fixed(80)), GridItem(.fixed(80))]
	let adaptiveLayout = [GridItem(.adaptive(minimum: 60, maximum: 120))]

    var body: some View {
		ScrollView(.horizontal) {
			LazyHGrid(rows: layout) {
				ForEach(0..<1000) {
					Text("Item \($0)")
				}
			}
		}
		ScrollView {
			LazyVGrid(columns: adaptiveLayout) {
				ForEach(0..<1000) {
					Text("Item \($0)")
						.font(.subheadline)
				}
			}
		}
		ScrollView {
			LazyVGrid(columns: layout) {
				ForEach(0..<1000) {
					Text("Item \($0)")
				}
			}
		}
    }
}

struct GridExample_Previews: PreviewProvider {
    static var previews: some View {
        GridExample()
    }
}
