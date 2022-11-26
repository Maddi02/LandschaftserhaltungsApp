//
//  Profile+CoreDataProperties.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 18.11.22.
//
//

import Foundation
import CoreData
import SwiftUI

extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var userFirstName: String?
    @NSManaged public var userSecondName: String?
    @NSManaged public var selectedLanguage: String?
    @NSManaged public var logo: UIImage?

}

extension Profile : Identifiable {

}
