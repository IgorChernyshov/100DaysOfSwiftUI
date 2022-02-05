//
//  EncapsulatedFetchRequestView.swift
//  CoreDataProject
//
//  Created by Igor Chernyshov on 03.02.2022.
//

import SwiftUI

struct EncapsulatedFetchRequestView: View {

	@Environment(\.managedObjectContext) var moc
	@State private var lastNameFilter = "A"
	@State private var filterType = FilterType.beginsWith

    var body: some View {
		VStack {
			FilteredList(filterKey: "lastName", filterType: filterType, filterValue: lastNameFilter, sortDescriptors: []) { (singer: Singer) in
				Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
			}

			Button("Add Examples") {
				let taylor = Singer(context: moc)
				taylor.firstName = "Taylor"
				taylor.lastName = "Swift"

				let ed = Singer(context: moc)
				ed.firstName = "Ed"
				ed.lastName = "Sheeran"

				let adele = Singer(context: moc)
				adele.firstName = "Adele"
				adele.lastName = "Adkins"

				try? moc.save()
			}

			Button("Show A") {
				lastNameFilter = "A"
			}

			Button("Show S") {
				lastNameFilter = "S"
			}

			Picker("Filter type", selection: $filterType) {
				ForEach(FilterType.allCases, id: \.self) {
					Text($0.rawValue)
				}
			}
		}
    }
}

struct EncapsulatedFetchRequestView_Previews: PreviewProvider {
    static var previews: some View {
        EncapsulatedFetchRequestView()
    }
}
