//
//  PlantSpeciesLongTermItem+CoreDataProperties.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 09.11.22.
//
//

import Foundation
import CoreData


extension PlantSpeciesLongTermItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlantSpeciesLongTermItem> {
        return NSFetchRequest<PlantSpeciesLongTermItem>(entityName: "PlantSpeciesLongTermItem")
    }

    @NSManaged public var evaluation1a: String?
    @NSManaged public var evaluation1b: String?
    @NSManaged public var evaluation1c: String?
    @NSManaged public var evaluation1d: String?
    @NSManaged public var evaluation2: String?
    @NSManaged public var evaluation3: String?
    @NSManaged public var frequency: String?
    @NSManaged public var germanName: String?
    @NSManaged public var checked: Bool
    @NSManaged public var redListBw: String?
    @NSManaged public var scientificName: String?
    @NSManaged public var descriptionFieldLongTerm: String?
    @NSManaged public var longTermuuid: UUID?
    @NSManaged public var noun: String?
    @NSManaged public var speciesLongTerm: ListEntry?

}

extension PlantSpeciesLongTermItem : Identifiable {

}
