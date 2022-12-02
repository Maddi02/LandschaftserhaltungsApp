//
//  ListEntry+CoreDataProperties.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 07.11.22.
//
//

import Foundation
import CoreData


extension ListEntry {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ListEntry> {
        return NSFetchRequest<ListEntry>(entityName: "ListEntry")
    }
    
    @NSManaged public var dateOfObservation: Date?
    @NSManaged public var listUUID: UUID?
    @NSManaged public var descriptionField: String?
    @NSManaged public var detailDescription: String?
    @NSManaged public var name: String?
    @NSManaged public var contract: AppContract?
    @NSManaged public var plant: NSSet?
    @NSManaged public var longTermPlant: NSSet?
    @NSManaged public var infos : FieldInformation?
    
    var PlantArray : [PlantSpeciesItem] {
        let set = plant as? Set<PlantSpeciesItem> ?? []
        
        return Array(Set(set.sorted
                         {
            $0.scientificName ?? " " < $1.scientificName ?? " "
        }))
    }
    
    var PlantArrayLongTerm : [PlantSpeciesLongTermItem] {
        let set = longTermPlant as? Set<PlantSpeciesLongTermItem> ?? []
        
        return Array(Set(set.sorted
                         {
            $0.scientificName ?? " " < $1.scientificName ?? " "
        }))
    }
    
}

// MARK: Generated accessors for plant
extension ListEntry {
    
    
    @objc(addPlantObject:)
    @NSManaged public func addToPlant(_ value: PlantSpeciesItem)
    
    @objc(removePlantObject:)
    @NSManaged public func removeFromPlant(_ value: PlantSpeciesItem)
    
    @objc(addPlant:)
    @NSManaged public func addToPlant(_ values: NSSet)
    
    @objc(removePlant:)
    @NSManaged public func removeFromPlant(_ values: NSSet)
    
}

extension ListEntry : Identifiable {
    
}
