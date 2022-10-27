//
//  ManageContractModel.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 23.10.22.
//

import Foundation
import CoreData
import SwiftUI
import MapKit
class ManageContractModel : ObservableObject
{
    
    private var context = CoreDataManager.shared.persistentContainer.viewContext
    let request : NSFetchRequest<AppContract> = NSFetchRequest(entityName: "AppContract")
    
    @Published var appContractList: [AppContract] = []
    @Published var test: [AppContract] = []
    public func getEntrys() -> Array<AppContract> {
        do{
            appContractList = try context.fetch(request)
            return appContractList
        
        }
        
        catch{
            print(error)
        }
        return appContractList
    }
}
