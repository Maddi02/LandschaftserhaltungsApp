//
//  NewContractDataModel.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 19.10.22.
//

import Foundation
import UIKit
import CoreData

class NewContractDataModel: ObservableObject {
    
    var context = CoreDataManager.shared.persistentContainer.viewContext
    let year = Calendar.current.component(.year, from: Date())
    @Published var appContractListSortedByDate: [AppContract] = []
    
    @Published var photo : UIImage = UIImage()
    
    @Published var firstName: String = ""
    
    @Published var lastName: String = ""
    
    @Published var birthday: Date = Date()
    
    @Published var contractTermination: Int = currentYear()
    
    
    @Published var deadline : Date = Date()
    
    @Published var street: String = ""
    
    @Published var PLZName: String = ""
    
    @Published var addressSecondLine: String = ""
    
    @Published var PLZ: String = ""
    
    @Published var country: String = ""
    
    @Published var operationNumber: String = ""
    
    @Published var contractPurpose: String = ""
    
    @Published var measures: String = ""
    
    @Published var managementRequirements: String = ""
    
    @Published var particularities: String = ""
    @Published var mobile : String = ""
    
    var years: [Int] {Array(1900...Self.currentYear() + 50)}
    
    public func getImage () -> UIImage
    {
        return photo
    }
    
    private class func currentYear() -> Int
    {
        Calendar.current.component(.year, from: Date())
    }
}
