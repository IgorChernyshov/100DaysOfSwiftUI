//
//  Entity+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Igor Chernyshov on 02.02.2022.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16

	// Properties above can be made non-optional but this may leads to receiving a nil-value from a non-optional property.
	// Use wrappers like the one below to avoid this.
	public var wrappedTitle: String {
		title ?? "Unknown Title"
	}
}

extension Entity : Identifiable {

}
