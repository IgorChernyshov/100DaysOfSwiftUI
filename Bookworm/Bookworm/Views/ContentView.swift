//
//  ContentView.swift
//  Bookworm
//
//  Created by Igor Chernyshov on 29.01.2022.
//

import CoreData
import SwiftUI

struct ContentView: View {

	@Environment(\.managedObjectContext) var managedObjectContext
	@FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>

    var body: some View {
		VStack {
			List(students) { student in
				Text(student.name ?? "Unknown")
			}

			Button("Add") {
				let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
				let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]

				let chosenFirstName = firstNames.randomElement()!
				let chosenLastName = lastNames.randomElement()!

				let student = Student(context: managedObjectContext)
				student.id = UUID()
				student.name = "\(chosenFirstName) \(chosenLastName)"

				try? managedObjectContext.save()
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
