//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Igor Chernyshov on 03.02.2022.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {

	@FetchRequest var fetchRequest: FetchedResults<T>

	let content: (T) -> Content

	var body: some View {
		List(fetchRequest, id: \.self) { singer in
			self.content(singer)
		}
	}

	init(filterKey: String, filterType: FilterType, filterValue: String, sortDescriptors: [SortDescriptor<T>], @ViewBuilder content: @escaping (T) -> Content) {
		_fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptors, predicate: NSPredicate(format: "%K \(filterType.rawValue) %@", filterKey, filterValue))
		self.content = content
	}
}
