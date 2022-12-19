//
//  PlantSpeciesItem+CoreDataProperties.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 07.11.22.
//
//

import Foundation
import CoreData


extension PlantSpeciesItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlantSpeciesItem> {
        return NSFetchRequest<PlantSpeciesItem>(entityName: "PlantSpeciesItem")
    }
    @NSManaged public var descriptionField: String?
    @NSManaged public var evaluation1a: String?
    @NSManaged public var noun: String?
    @NSManaged public var evaluation1b: String?
    @NSManaged public var evaluation1c: String?
    @NSManaged public var evaluation1d: String?
    @NSManaged public var evaluation2: String?
    @NSManaged public var evaluation3: String?
    @NSManaged public var frequency: String?
    @NSManaged public var germanName: String?
    @NSManaged public var redListBw: String?
    @NSManaged public var scientificName: String?
    @NSManaged public var checked: Bool
    @NSManaged public var uuid: UUID?
    @NSManaged public var species: ListEntry?

}

extension PlantSpeciesItem : Identifiable {

}
