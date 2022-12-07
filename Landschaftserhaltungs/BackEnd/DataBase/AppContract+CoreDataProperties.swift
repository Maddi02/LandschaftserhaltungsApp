//
//  AppContract+CoreDataProperties.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 07.11.22.
//
//

import Foundation
import CoreData
import SwiftUI

extension AppContract {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AppContract> {
        return NSFetchRequest<AppContract>(entityName: "AppContract")
    }

    @NSManaged public var birthday: Date?
    @NSManaged public var contractPurpose: String?
    @NSManaged public var contractTermination: Int16
    @NSManaged public var country: String?
    @NSManaged public var deadline: Date?
    @NSManaged public var firstName: String?
    @NSManaged public var id: UUID?
    @NSManaged public var lastName: String?
    @NSManaged public var managementRequirements: String?
    @NSManaged public var measures: String?
    @NSManaged public var mobile: String?
    @NSManaged public var operationNumber: String?
    @NSManaged public var particularities: String?
    @NSManaged public var picture: UIImage?
    @NSManaged public var plz: String?
    @NSManaged public var plzName: String?
    @NSManaged public var street: String?
    @NSManaged public var list: NSSet?

    
    
    public var wrappedFirstName : String
          {
              firstName ?? "Unknown Firstname"
          }
          
          public var wrappedLastName : String
          {
              lastName ?? "Unknown LastName"
          }
          
          public var ContactArray : [ListEntry] {
              let set = list as? Set<ListEntry> ?? []
              return set.sorted
              {
                  $0.dateOfObservation ?? Date() <= $1.dateOfObservation ?? Date()
              }
          }
    
}

// MARK: Generated accessors for list
extension AppContract {

    @objc(addListObject:)
    @NSManaged public func addToList(_ value: ListEntry)

    @objc(removeListObject:)
    @NSManaged public func removeFromList(_ value: ListEntry)

    @objc(addList:)
    @NSManaged public func addToList(_ values: NSSet)

    @objc(removeList:)
    @NSManaged public func removeFromList(_ values: NSSet)

}

extension AppContract : Identifiable {

}
