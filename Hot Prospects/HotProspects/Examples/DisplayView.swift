//
//  DisplayView.swift
//  HotProspects
//
//  Created by Igor Chernyshov on 08.03.2022.
//

import SwiftUI

struct DisplayView: View {

	@EnvironmentObject var user: User

	var body: some View {
		Text(user.name)
	}
}

struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView()
    }
}
