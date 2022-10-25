//
//  photo.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 22.10.22.
//

import Foundation
import CoreData
import UIKit

@objc(AppContract)
class AppContract : NSManagedObject {
   
    @nonobjc public class func fetchRequest() -> NSFetchRequest<AppContract>{
        return NSFetchRequest<AppContract>(entityName: "AppContract")
    }
    
    @NSManaged public var picture : UIImage?
    @NSManaged public var firstName : String?
    @NSManaged public var lastName : String?
    @NSManaged public var birthday : Date?
    @NSManaged public var contractPurpose : String?
    @NSManaged public var country : String?
    @NSManaged public var managementRequirements : String?
    @NSManaged public var measures : String?
    @NSManaged public var operationNumber : String?
    @NSManaged public var particularities : String?
    @NSManaged public var plzName : String?
    @NSManaged public var street : String?
    @NSManaged public var mobile: String?
    @NSManaged public var contractTermination : Date?
}

extension AppContract : Identifiable {
    
}
