//
//  LayoutViaGroupView.swift
//  SnowSeeker
//
//  Created by Igor Chernyshov on 26.03.2022.
//

import SwiftUI

struct LayoutViaGroupView: View {

	@State private var layoutVertically = false

	var body: some View {
		Group {
			if layoutVertically {
				VStack {
					UserView()
				}
			} else {
				HStack {
					UserView()
				}
			}
		}
		.onTapGesture {
			layoutVertically.toggle()
		}
	}
}

struct UserView: View {
    var body: some View {
		Group {
			Text("Name: Paul")
			Text("Country: England")
			Text("Pets: Luna and Arya")
		}
		.font(.title)
    }
}

struct LayoutViaGroupView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutViaGroupView()
    }
}
