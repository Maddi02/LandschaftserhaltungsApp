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

    @NSManaged public var alpenvorland: String?
    @NSManaged public var blackForest: String?
    @NSManaged public var germanName: String?
    @NSManaged public var checked: Bool
    @NSManaged public var brachePointer: Bool
    @NSManaged public var disturbanceIndicator: Bool
    @NSManaged public var impairedSpecies: Bool
    @NSManaged public var mergerityPointer: Bool
    @NSManaged public var nitrogenIndicator: Bool
    @NSManaged public var seedSpecies: Bool
    @NSManaged public var valuationNeutralType: Bool
    @NSManaged public var nothernGaelandschaften: String?
    @NSManaged public var oberReihnArea: String?
    @NSManaged public var redListBw: String?
    @NSManaged public var responsibility: String?
    @NSManaged public var schaebischeAlb: String?
    @NSManaged public var southernGaelandschaften: String?
    @NSManaged public var scientificName: String?
    @NSManaged public var odenWald: String?
    @NSManaged public var descriptionFieldLongTerm: String?
    @NSManaged public var longTermuuid: UUID?
    @NSManaged public var speciesLongTerm: ListEntry?

}

extension PlantSpeciesLongTermItem : Identifiable {

}
