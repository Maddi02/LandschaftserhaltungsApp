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
    @Published var appContractListSortedByDeadline: [AppContract] = []
    @Published var appContractList: [AppContract] = []
    @Published var filter : FilterType = .none
    
    enum FilterType{
        case none, date, deadline
    }

    var filteredContracts: [AppContract]{
        fetchAppContract()
        switch filter {
            
        case .none:
  
            return appContractList
        case .date:
            self.appContractListSortedByDate =  self.sortByDateASC()
            return appContractListSortedByDate
        case .deadline:
            self.appContractListSortedByDeadline =  self.sortByDateDeadline()
            return appContractListSortedByDeadline
        }
    }
    
    func fetchAppContract()
    {
        
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false)
        { _ in
            do {
                self.appContractList = try self.context.fetch(self.request)
            }
            catch {
                // Handle Error
                print("EHHHHHHHHHHH")
            }
        }
        
        
        
        
        
        
    }
    
    func getImage(appContract : AppContract) -> UIImage
    {
        fetchAppContract()
        return appContract.picture ?? UIImage()
    }
    
    func updateContract(appContract : AppContract, contractDataModel : NewContractDataModel, image: UIImage, contractTermination : Date, contractDeadline : Date){
        appContract.deadline = contractDeadline
        appContract.contractTermination = contractTermination
        appContract.picture = image
        
        
        if(contractDataModel.street.isEmpty)
        {
            appContract.street = appContract.street
        }
        else{
            appContract.street = appContract.street
            appContract.street = contractDataModel.street
        }
        
        if(contractDataModel.PLZName.isEmpty)
        {
            appContract.plzName = appContract.plzName
        }
        else{
            appContract.plzName = appContract.plzName
            appContract.plzName = contractDataModel.PLZName
        }
        
        if(contractDataModel.PLZ.isEmpty)
        {
            appContract.plz = appContract.plz
        }
        else{
            appContract.plz = appContract.plz
            appContract.plz = contractDataModel.PLZ
        }
        
        if(contractDataModel.country.isEmpty)
        {
            appContract.country = appContract.country
        }
        else{
            appContract.country = appContract.country
            appContract.country = contractDataModel.country
        }
        
        
        if(contractDataModel.mobile.isEmpty)
        {
            appContract.mobile = appContract.mobile
        }
        else{
            appContract.mobile = appContract.mobile
            appContract.mobile = contractDataModel.mobile
        }
        if(contractDataModel.operationNumber.isEmpty)
        {
            appContract.operationNumber = appContract.operationNumber
        }
        else{
            appContract.operationNumber = appContract.operationNumber
            appContract.operationNumber = contractDataModel.operationNumber
        }
        
        if(contractDataModel.contractPurpose.isEmpty)
        {
            appContract.contractPurpose = appContract.contractPurpose
        }
        else{
            appContract.contractPurpose = appContract.contractPurpose
            appContract.contractPurpose = contractDataModel.contractPurpose
        }
        
        if(contractDataModel.measures.isEmpty)
        {
            appContract.measures = appContract.measures
        }
        else{
            appContract.measures = appContract.measures
            appContract.measures = contractDataModel.measures
        }
        
        if(contractDataModel.managementRequirements.isEmpty)
        {
            appContract.managementRequirements = appContract.managementRequirements
        }
        else{
            appContract.managementRequirements = appContract.managementRequirements
            appContract.managementRequirements = contractDataModel.managementRequirements
        }
        
        if(contractDataModel.particularities.isEmpty)
        {
            appContract.particularities = appContract.particularities
        }
        else{
            appContract.particularities = appContract.particularities
            appContract.particularities = contractDataModel.particularities
        }
        
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
    public func sortByDateDeadline() -> Array<AppContract>
    {
        let request : NSFetchRequest<AppContract> = NSFetchRequest(entityName: "AppContract")
        let sortByDate = NSSortDescriptor(key: #keyPath(AppContract.deadline), ascending: true)
        request.sortDescriptors = [sortByDate]
        do{
            appContractListSortedByDeadline = try context.fetch(request)
        }
        catch{
            print(error)
        }
        
        return appContractListSortedByDeadline
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
        appContract.setValue(newContractDataModel.deadline, forKey: #keyPath(AppContract.deadline))
        do{
            try context.save()
            fetchAppContract()
            
        }catch{
            print(error)
        }
    }
    public func delete(at offsets : IndexSet){
        
        appContractList.remove(atOffsets: offsets)
    }
}
