//
//  FieldInformation+CoreDataProperties.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 23.11.22.
//
//

import Foundation
import CoreData


extension FieldInformation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FieldInformation> {
        return NSFetchRequest<FieldInformation>(entityName: "FieldInformation")
    }

    @NSManaged public var dataOfTaking: Date?
    @NSManaged public var farming: String?
    @NSManaged public var position: String?
    @NSManaged public var vegetationDescription: String?
    @NSManaged public var bloomAspect: String?
    @NSManaged public var evaluationSpeciesInventory: String?
    @NSManaged public var assessmentHabitatStructure: String?
    @NSManaged public var ratingImpairment: String?
    @NSManaged public var protectionStatus: String?
    @NSManaged public var overallAssessmentOfTheStateOfPreservation: String?
    @NSManaged public var faunisticObservation: String?
    @NSManaged public var contractTarget: String?
    @NSManaged public var adaptationEditions: String?
    @NSManaged public var furtherMaintenanceMeasures: String?
    @NSManaged public var id: UUID?
    @NSManaged public var listEntry: ListEntry?
    @NSManaged public var pictures: NSSet?

}

// MARK: Generated accessors for picutres
extension FieldInformation {

    @objc(addPicutresObject:)
    @NSManaged public func addToPicutres(_ value: PicutreList)

    @objc(removePicutresObject:)
    @NSManaged public func removeFromPicutres(_ value: PicutreList)

    @objc(addPicutres:)
    @NSManaged public func addToPicutres(_ values: NSSet)

    @objc(removePicutres:)
    @NSManaged public func removeFromPicutres(_ values: NSSet)

}

extension FieldInformation : Identifiable {

}
