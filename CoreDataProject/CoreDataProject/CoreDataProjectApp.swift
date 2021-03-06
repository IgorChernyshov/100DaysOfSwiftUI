//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Igor Chernyshov on 02.02.2022.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {

	@StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
			EncapsulatedFetchRequestView()
				.environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
