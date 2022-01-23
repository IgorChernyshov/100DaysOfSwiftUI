//
//  MainView.swift
//  HabitTracker
//
//  Created by Igor Chernyshov on 23.01.2022.
//

import SwiftUI

struct MainView: View {

	@StateObject var habits = Habits()

	@State private var isShowingAddHabit = false
	@State private var isShowingHabitDetails = false

    var body: some View {
		NavigationView {
			List {
				Section("Your habits") {
					ForEach(habits.items, id: \.title) { habit in
						NavigationLink {
							DetailHabitView(habit: habit)
						} label: {
							HabitView(habit: habit)
						}
					}
				}
			}
			.navigationTitle("Habit Tracker")
			.toolbar {
				Button {
					isShowingAddHabit = true
				} label: {
					Image(systemName: "plus.circle")
				}
			}
			.sheet(isPresented: $isShowingAddHabit) {
				AddHabitView(habits: habits)
			}
		}
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
		let habits = Habits()
		habits.items.append(.previewHabit)
		return MainView(habits: habits)
    }
}
