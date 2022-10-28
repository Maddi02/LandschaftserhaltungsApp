//
//  EditContractModel.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 27.10.22.
//

import Foundation
import CoreData
import SwiftUI
class EditContractModel
{

    private var context = CoreDataManager.shared.persistentContainer.viewContext
     var newContractDataModel = NewContractDataModel()
    let fetchUser: NSFetchRequest<AppContract> = AppContract.fetchRequest()
    
    
    
    func upi(appContract : AppContract, contractDataModel : NewContractDataModel){

        
        if(contractDataModel.lastName.isEmpty)
           {
            appContract.lastName = appContract.lastName
            
        }
        else{
            appContract.lastName = appContract.lastName
            appContract.lastName = contractDataModel.lastName
        }
    
        do {
            try context.save()
        }
        catch {
            // Handle Error
        }
    }


    
    
    
  
   
    
    
}
