//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Igor Chernyshov on 26.03.2022.
//

import SwiftUI

struct ContentView: View {

	@State private var searchText = ""
	@State private var sortingMode: Resort.SortMode = .default

	@StateObject var favorites = Favorites()

	let resorts: [Resort] = Bundle.main.decode("resorts.json")

	var filteredResorts: [Resort] {
		if searchText.isEmpty {
			return resorts
		} else {
			return resorts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
		}
	}

	var resortsToDisplay: [Resort] {
		switch sortingMode {
		case .default: return filteredResorts
		case .name: return filteredResorts.sorted { $0.name < $1.name }
		case .country: return filteredResorts.sorted { $0.country < $1.country }
		}
	}

	var body: some View {
		NavigationView {
			List(resortsToDisplay) { resort in
				NavigationLink {
					ResortView(resort: resort)
				} label: {
					HStack {
						Image(resort.country)
							.resizable()
							.scaledToFill()
							.frame(width: 40, height: 25)
							.clipShape(
								RoundedRectangle(cornerRadius: 5)
							)
							.overlay(
								RoundedRectangle(cornerRadius: 5)
									.stroke(.black, lineWidth: 1)
							)

						VStack(alignment: .leading) {
							Text(resort.name)
								.font(.headline)
							Text("\(resort.runs) runs")
								.foregroundColor(.secondary)
						}

						if favorites.contains(resort) {
							Spacer()

							Image(systemName: "heart.fill")
								.accessibilityLabel("This is a favorite resort")
								.foregroundColor(.red)
						}
					}
				}
			}
			.navigationTitle("Resorts")
			.searchable(text: $searchText, prompt: "Search for a resort")
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Image(systemName: "arrow.up.arrow.down")
						.foregroundColor(.primary)
						.contextMenu {
							Button("Sort by default") {
								sortingMode = .default
							}

							Button("Sort by name") {
								sortingMode = .name
							}

							Button("Sort by country") {
								sortingMode = .country
							}
						}
				}
			}

			WelcomeView()
		}
		.environmentObject(favorites)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
