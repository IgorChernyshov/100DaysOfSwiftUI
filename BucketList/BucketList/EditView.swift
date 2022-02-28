//
//  EditView.swift
//  BucketList
//
//  Created by Igor Chernyshov on 27.02.2022.
//

import SwiftUI

struct EditView: View {

	@Environment(\.dismiss) var dismiss

	var onSave: (Location) -> Void

	@StateObject private var viewModel: ViewModel

	init(location: Location, onSave: @escaping (Location) -> Void) {
		self.onSave = onSave
		_viewModel = StateObject(wrappedValue: ViewModel(location: location))
	}

	var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Place name", text: $viewModel.name)
					TextField("Description", text: $viewModel.description)
				}

				Section("Nearby…") {
					switch viewModel.loadingState {
					case .loaded:
						ForEach(viewModel.pages, id: \.pageid) { page in
							Text(page.title)
								.font(.headline)
							+ Text(": ") +
							Text(page.description)
								.italic()
						}
					case .loading:
						Text("Loading…")
					case .failed:
						Text("Please try again later.")
					}
				}
			}
			.navigationTitle("Place details")
			.toolbar {
				Button("Save") {
					var newLocation = viewModel.location
					newLocation.id = UUID()
					newLocation.name = viewModel.name
					newLocation.description = viewModel.description

					onSave(newLocation)
					dismiss()
				}
			}
			.task {
				await viewModel.fetchNearbyPlaces()
			}
		}
	}
}

extension EditView {
	enum LoadingState {
		case loading, loaded, failed
	}
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
		EditView(location: Location.example) { newLocation in }
    }
}
