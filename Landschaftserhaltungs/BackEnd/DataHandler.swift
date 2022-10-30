//
//  DataHandler.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 28.10.22.
//

import Foundation
import CoreData
import SwiftUI
class DataHandler : ObservableObject
{
    
    private var newContractDataModel = NewContractDataModel()
    private var context = CoreDataManager.shared.persistentContainer.viewContext
    let request : NSFetchRequest<AppContract> = NSFetchRequest(entityName: "AppContract")
    @Published var appContractListSortedByDate: [AppContract] = []
    @Published var appContractList: [AppContract] = []
    
    
    init()
    {
      fetchAppContract()
    }
    
    
     func fetchAppContract()
    {
        print("Fetching")
        do {
            appContractList = try context.fetch(request)
            
        }
        catch {
            // Handle Error
        }
    }
    
    func updateContract(appContract : AppContract, contractDataModel : NewContractDataModel, image: UIImage){

        appContract.picture = image
        if(contractDataModel.lastName.isEmpty)
           {
            appContract.lastName = appContract.lastName
           }
        else{
            appContract.lastName = appContract.lastName
            appContract.lastName = contractDataModel.lastName
        }
        if(contractDataModel.firstName.isEmpty)
           {
            appContract.firstName = appContract.firstName
           }
        else{
            appContract.firstName = appContract.firstName
            appContract.firstName = contractDataModel.firstName
        }

        do {
            try context.save()
        }
        catch {
            // Handle Error
        }
    }
    

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
    
    
    public func sortByDateASC() -> Array<AppContract>
    {
        let request : NSFetchRequest<AppContract> = NSFetchRequest(entityName: "AppContract")
        let sortByDate = NSSortDescriptor(key: #keyPath(AppContract.contractTermination), ascending: true)
        request.sortDescriptors = [sortByDate]
        do{
            appContractListSortedByDate = try context.fetch(request)
        }
        catch{
            print(error)
        }
        
        return appContractListSortedByDate
    }
    
    public func saveAll(image: UIImage = UIImage(), firstName1: String, newContractDataModel : NewContractDataModel)
    {
        let appContract = AppContract(context: context);
        appContract.setValue(firstName1, forKey: #keyPath(AppContract.firstName))
        appContract.setValue(newContractDataModel.lastName, forKey: #keyPath(AppContract.lastName))
        appContract.setValue(newContractDataModel.birthday, forKey: #keyPath(AppContract.birthday))
        appContract.setValue(newContractDataModel.contractPurpose, forKey: #keyPath(AppContract.contractPurpose))
        appContract.setValue(newContractDataModel.country, forKey: #keyPath(AppContract.country))
        appContract.setValue(newContractDataModel.managementRequirements, forKey: #keyPath(AppContract.managementRequirements))
        appContract.setValue(newContractDataModel.measures, forKey: #keyPath(AppContract.measures))
        appContract.setValue(newContractDataModel.operationNumber, forKey: #keyPath(AppContract.operationNumber))
        appContract.setValue(newContractDataModel.particularities, forKey: #keyPath(AppContract.particularities))
        appContract.setValue(newContractDataModel.PLZName, forKey: #keyPath(AppContract.plzName))
        appContract.setValue(newContractDataModel.street, forKey: #keyPath(AppContract.street))
        appContract.setValue(newContractDataModel.mobile, forKey: #keyPath(AppContract.mobile))
        appContract.setValue(image, forKey: #keyPath(AppContract.picture))
        appContract.setValue(newContractDataModel.contractTermination, forKey: #keyPath(AppContract.contractTermination))
        do{
            try context.save()
            
        }catch{
            print(error)
        }
    }
    public func delete(at offsets : IndexSet){
        
        appContractList.remove(atOffsets: offsets)
    }
}
