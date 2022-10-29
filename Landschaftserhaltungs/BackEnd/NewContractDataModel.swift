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
    
    @Published var contractTermination: Date = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date("01-01-\(Calendar.current.component(.year, from: Date()).description)"))!

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
}



