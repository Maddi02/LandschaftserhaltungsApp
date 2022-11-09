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

    @NSManaged public var alpenvorland: String?
    @NSManaged public var blackForest: String?
    @NSManaged public var germanName: String?
    @NSManaged public var nothernGaelandschaften: String?
    @NSManaged public var oberReihnArea: String?
    @NSManaged public var odenWald: String?
    @NSManaged public var redListBw: String?
    @NSManaged public var responsibility: String?
    @NSManaged public var schaebischeAlb: String?
    @NSManaged public var scientificName: String?
    @NSManaged public var descriptionField: String?
    @NSManaged public var southernGaelandschaften: String?
    @NSManaged public var checked: Bool
    @NSManaged public var uuid: UUID?
    @NSManaged public var species: ListEntry?

}

extension PlantSpeciesItem : Identifiable {

}
