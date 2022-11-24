//
//  PicutreList+CoreDataProperties.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 23.11.22.
//
//

import Foundation
import CoreData
import SwiftUI

extension PicutreList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PicutreList> {
        return NSFetchRequest<PicutreList>(entityName: "PicutreList")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var compareString: String?
    @NSManaged public var picutre: UIImage?
    @NSManaged public var listOfPictures: FieldInformation?

    public var wrappedCompareString : String {
        compareString ?? "Unknown"
    }
}

extension PicutreList : Identifiable {

}
