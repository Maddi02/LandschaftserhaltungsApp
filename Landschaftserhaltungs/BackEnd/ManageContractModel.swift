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
    
    public func getEntrysSortedBasedOnDate() -> Array<AppContract>{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        var customObjects: [AppContract]
        do{
            customObjects = try context.fetch(request)
            return customObjects
        
        }
        catch{
            print(error)
        }
        return test
        
    }
    
 
}
