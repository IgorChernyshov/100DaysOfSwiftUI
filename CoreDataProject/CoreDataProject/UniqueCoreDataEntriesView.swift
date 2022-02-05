//
//  UniqueCoreDataEntriesView.swift
//  CoreDataProject
//
//  Created by Igor Chernyshov on 02.02.2022.
//

import SwiftUI

struct UniqueCoreDataEntriesView: View {

	@Environment(\.managedObjectContext) var moc
	@FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>

	var body: some View {
		VStack {
			List(wizards, id: \.self) { wizard in
				Text(wizard.name ?? "Unknown")
			}

			Button("Add") {
				let wizard = Wizard(context: moc)
				wizard.name = "Harry Potter"
			}

			Button("Save") {
				// Conditional saving
				if moc.hasChanges {
					do {
						try moc.save()
					} catch {
						print(error.localizedDescription)
					}
				}
			}
		}
	}
}

struct UniqueCoreDataEntriesView_Previews: PreviewProvider {
	static var previews: some View {
		UniqueCoreDataEntriesView()
	}
}
