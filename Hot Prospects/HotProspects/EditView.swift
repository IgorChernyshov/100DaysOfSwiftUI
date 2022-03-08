//
//  EditView.swift
//  HotProspects
//
//  Created by Igor Chernyshov on 08.03.2022.
//

import SwiftUI

struct EditView: View {

	@EnvironmentObject var user: User

	var body: some View {
		TextField("Name", text: $user.name)
	}
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
