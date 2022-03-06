//
//  ContentView.swift
//  iExpense
//
//  Created by Igor Chernyshov on 12.01.2022.
//

import SwiftUI

struct ContentView: View {

	@StateObject var expenses = Expenses()

	@State private var showingAddExpense = false

    var body: some View {
		NavigationView {
			List {
				ForEach(["Business", "Personal"], id: \.self) { category in
					Section(category) {
						ForEach(expenses.items.filter { category == $0.type }) { item in
							HStack {
								VStack(alignment: .leading) {
									Text(item.name)
										.font(.headline)
									Text(item.type)
								}

								Spacer()

								Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
									.coloredAmount(amount: item.amount)
							}
							.accessibilityElement(children: .ignore)
							.accessibilityLabel("\(item.name) \(item.amount)")
							.accessibilityHint(item.type)
						}
						.onDelete(perform: removeItems)
					}
				}
			}
			.navigationTitle("iExpense")
			.toolbar {
				Button {
					showingAddExpense = true
				} label: {
					Image(systemName: "plus")
				}
			}
		}
		.sheet(isPresented: $showingAddExpense) {
			AddView(expenses: expenses)
		}
    }

	private func removeItems(at offsets: IndexSet) {
		expenses.items.remove(atOffsets: offsets)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
