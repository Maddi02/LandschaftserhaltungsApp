//
//  EditContractModel.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 27.10.22.
//

import Foundation
import CoreData
class EditContractModel
{

    private var context = CoreDataManager.shared.persistentContainer.viewContext
    private let user: AppContract = AppContract()
    
    let fetchUser: NSFetchRequest<AppContract> = AppContract.fetchRequest()
    
    
  
   
    
    
}
