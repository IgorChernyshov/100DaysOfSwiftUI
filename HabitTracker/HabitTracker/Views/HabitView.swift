//
//  HabitView.swift
//  HabitTracker
//
//  Created by Igor Chernyshov on 23.01.2022.
//

import SwiftUI

struct HabitView: View {

	let habit: Habit

    var body: some View {
		VStack(alignment: .leading) {
			Text(habit.title)
				.font(.body)
			Text(habit.description)
				.font(.caption)
				.opacity(0.75)
		}
		.padding()
    }
}

struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
		HabitView(habit: Habit.previewHabit)
    }
}
