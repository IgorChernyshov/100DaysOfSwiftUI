//
//  DataController.swift
//  Bookworm
//
//  Created by Igor Chernyshov on 29.01.2022.
//

import CoreData
import SwiftUI

final class DataController: ObservableObject {

	let container = NSPersistentContainer(name: "Bookworm")

	init() {
		container.loadPersistentStores { description, error in
			if let error = error {
				print("Core Data failed to load: \(error.localizedDescription)")
			}
		}
	}
}
