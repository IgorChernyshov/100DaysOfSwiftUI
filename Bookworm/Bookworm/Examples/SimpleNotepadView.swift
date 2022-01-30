//
//  SimpleNotepadView.swift
//  Bookworm
//
//  Created by Igor Chernyshov on 29.01.2022.
//

import SwiftUI

struct SimpleNotepadView: View {

	@AppStorage("notes") private var notes = ""

	var body: some View {
		NavigationView {
			TextEditor(text: $notes)
				.navigationTitle("Notes")
				.padding()
		}
	}
}

struct SimpleNotepadView_Previews: PreviewProvider {
	static var previews: some View {
		SimpleNotepadView()
	}
}
