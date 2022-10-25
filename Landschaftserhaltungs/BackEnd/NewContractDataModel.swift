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

    private var context = CoreDataManager.shared.persistentContainer.viewContext
    
    
    
    
    @Published var photo : UIImage = UIImage()
    
    @Published var firstName: String = ""
    
    @Published var lastName: String = ""

    @Published var birthday: Date = Date()
    
    @Published var contractTermination: Date = Date()

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
    
    public func whatWasSaved()
    {
        print(firstName, "Firstname")
    }
    
    
    public func saveAll(image: UIImage , firstName1: String)
    {
        let appContract = AppContract(context: context);
        appContract.setValue(firstName1, forKey: #keyPath(AppContract.firstName))
        appContract.setValue(lastName, forKey: #keyPath(AppContract.lastName))
        appContract.setValue(birthday, forKey: #keyPath(AppContract.birthday))
        appContract.setValue(contractPurpose, forKey: #keyPath(AppContract.contractPurpose))
        appContract.setValue(country, forKey: #keyPath(AppContract.country))
        appContract.setValue(managementRequirements, forKey: #keyPath(AppContract.managementRequirements))
        appContract.setValue(measures, forKey: #keyPath(AppContract.measures))
        appContract.setValue(operationNumber, forKey: #keyPath(AppContract.operationNumber))
        appContract.setValue(particularities, forKey: #keyPath(AppContract.particularities))
        appContract.setValue(PLZName, forKey: #keyPath(AppContract.plzName))
        appContract.setValue(street, forKey: #keyPath(AppContract.street))
        appContract.setValue(mobile, forKey: #keyPath(AppContract.mobile))
        appContract.setValue(image, forKey: #keyPath(AppContract.picture))
        appContract.setValue(contractTermination, forKey: #keyPath(AppContract.contractTermination))
        do{
            try context.save()
            
        }catch{
            print(error)
        }
    }
    
    public func printALL()
    {
    
        let request : NSFetchRequest<AppContract> = NSFetchRequest(entityName: "AppContract")
        
        do{
            let test: [AppContract] = try context.fetch(request)
            print(test.count)
            for test1 in test {
                print(test1.firstName)
            }
        }
        
        catch{
            print(error)
        }
    }
    
    public func testSet()
    {
      //  self.firstName = "dd"
        
    }
    
    

    
    
    
}



