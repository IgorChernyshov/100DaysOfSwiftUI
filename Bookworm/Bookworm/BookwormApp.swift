//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Igor Chernyshov on 29.01.2022.
//

import SwiftUI

@main
struct BookwormApp: App {

	@StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
				.environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
