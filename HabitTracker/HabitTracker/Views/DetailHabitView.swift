//
//  DetailHabitView.swift
//  HabitTracker
//
//  Created by Igor Chernyshov on 23.01.2022.
//

import SwiftUI

struct DetailHabitView: View {

	let habit: Habit

	@State private var timesCompleted = 0

    var body: some View {
		VStack(alignment: .leading) {
			Text(habit.description)
			Stepper(value: $timesCompleted, in: 0...365, step: 1) {
				Text("Times completed: \(timesCompleted)")
			} onEditingChanged: { _ in
				let habits = Habits()
				habits.items.removeAll {
					$0.title == habit.title
				}
				habits.items.append(Habit(title: habit.title, description: habit.description, timesCompleted: habit.timesCompleted))
			}

			Spacer()
		}
		.padding()
		.navigationTitle(habit.title)
		.navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailHabitView_Previews: PreviewProvider {
    static var previews: some View {
		DetailHabitView(habit: .previewHabit)
    }
}
