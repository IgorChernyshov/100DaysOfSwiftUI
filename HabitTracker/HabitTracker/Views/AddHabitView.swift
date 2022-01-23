//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Igor Chernyshov on 23.01.2022.
//

import SwiftUI

struct AddHabitView: View {

	@Environment(\.dismiss) var dismiss

	@ObservedObject var habits: Habits

	@State private var title = ""
	@State private var description = ""

	var body: some View {
		NavigationView {
			Form {
				TextField("Title", text: $title)
				TextField("Description", text: $description)
			}
			.navigationTitle("Add new habit")
			.toolbar {
				Button {
					let habit = Habit(title: title, description: description, timesCompleted: 0)
					habits.items.append(habit)
					dismiss()
				} label: {
					Image(systemName: "checkmark.circle")
				}
			}
		}
	}
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habits: Habits())
    }
}
