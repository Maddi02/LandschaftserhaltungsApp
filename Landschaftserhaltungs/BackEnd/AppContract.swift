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
    
    
}

extension AppContract : Identifiable {
    
}
