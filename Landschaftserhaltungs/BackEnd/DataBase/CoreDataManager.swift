//
//  DataController.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 19.10.22.
//
import CoreData
import Foundation

class CoreDataManager
{
    
    let persistentContainer: NSPersistentContainer
    static let shared: CoreDataManager = CoreDataManager()
    
    private init(){
        
        
        ValueTransformer.setValueTransformer(UIImageTransformer(), forName: NSValueTransformerName("UIImageTransformer"))
        
        persistentContainer = NSPersistentContainer(name: "AppStateDataModel")
        persistentContainer.loadPersistentStores{ description, error in
            if let error = error as NSError?{
                fatalError("Unable to initialize Core Data \(error)")
            }
            
        }
        self.persistentContainer.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    }
}
