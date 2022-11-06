//
//  ListEntry+CoreDataProperties.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 06.11.22.
//
//

import Foundation
import CoreData


extension ListEntry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ListEntry> {
        return NSFetchRequest<ListEntry>(entityName: "ListEntry")
    }

    @NSManaged public var name: String?
    @NSManaged public var descriptionField: String?
    @NSManaged public var dateOfObservation: Date?
    @NSManaged public var contract: AppContract?

    
    public var wrappedName : String {
        name ?? "unknown contract"
    }
}

extension ListEntry : Identifiable {

}
