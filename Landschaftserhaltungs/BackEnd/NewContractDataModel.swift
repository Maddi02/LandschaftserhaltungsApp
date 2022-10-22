//
//  NewContractDataModel.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 19.10.22.
//

import Foundation
import UIKit

class NewContractDataModel: ObservableObject {

    

    
    
    
    @Published var photo : UIImage = UIImage()
    
    @Published var firstName: String = ""
    
    @Published var lastNames: String = ""

    @Published var birthday: Date = Date()

    @Published var street: String = ""

    @Published var PLZName: String = ""

    @Published var addressSecondLine: String = ""

    @Published var PLZ: String = ""

    @Published var Land: String = ""
    
    @Published var operationNumber: String = ""
    
    @Published var contractPurpose: String = ""
    
    @Published var measures: String = ""
    
    @Published var managementRequirements: String = ""
    
    @Published var particularities: String = ""
    
    public func whatWasSaved()
    {
        print(firstName, "Firstname")
    }
}



