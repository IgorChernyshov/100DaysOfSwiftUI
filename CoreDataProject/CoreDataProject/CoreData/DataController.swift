//
//  DataController.swift
//  CoreDataProject
//
//  Created by Igor Chernyshov on 02.02.2022.
//

import CoreData
import SwiftUI

final class DataController: ObservableObject {

	let container = NSPersistentContainer(name: "CoreDataProject")

	init() {
		container.loadPersistentStores { [weak self] description, error in
			if let error = error {
				print("Core Data failed to load: \(error.localizedDescription)")
			}

			self?.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
		}
	}
}
