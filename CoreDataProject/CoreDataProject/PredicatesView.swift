//
//  PredicatesView.swift
//  CoreDataProject
//
//  Created by Igor Chernyshov on 03.02.2022.
//

import CoreData
import SwiftUI

struct PredicatesView: View {

	static private let equalPredicate = NSPredicate(format: "universe == %@", "Star Wars")
	static private let lessPredicate = NSPredicate(format: "name < %@", "F")
	static private let inPredicate = NSPredicate(format: "universe IN %@", ["Aliens", "Firefly", "Star Trek"])
	static private let beginsWithPredicate = NSPredicate(format: "name BEGINSWITH %@", "E")
	static private let containsPredicate = NSPredicate(format: "name CONTAINS %@", "E")
	static private let beginsWithIgnoreCase = NSPredicate(format: "name BEGINSWITH[c] %@", "E")
	static private let notContainsPredicate = NSPredicate(format: "NOT name CONTAINS %@", "E")
	@Environment(\.managedObjectContext) var moc
	@FetchRequest(sortDescriptors: [], predicate: inPredicate) var ships: FetchedResults<Ship>

	var body: some View {
		VStack {
			List(ships, id: \.self) { ship in
				Text(ship.name ?? "Unknown name")
			}

			Button("Add Examples") {
				let ship1 = Ship(context: moc)
				ship1.name = "Enterprise"
				ship1.universe = "Star Trek"

				let ship2 = Ship(context: moc)
				ship2.name = "Defiant"
				ship2.universe = "Star Trek"

				let ship3 = Ship(context: moc)
				ship3.name = "Millennium Falcon"
				ship3.universe = "Star Wars"

				let ship4 = Ship(context: moc)
				ship4.name = "Executor"
				ship4.universe = "Star Wars"

				try? moc.save()
			}
		}
	}
}

struct PredicatesView_Previews: PreviewProvider {
    static var previews: some View {
        PredicatesView()
    }
}
