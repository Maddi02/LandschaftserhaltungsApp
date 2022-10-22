//
//  DataController.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 19.10.22.
//
import CoreData
import Foundation

class DataController: ObservableObject
{
    let container = NSPersistentContainer(name: "AppStateDataModel")
   
    init()
    {
        container.loadPersistentStores { description , error in
            if let error = error {
                print("Core Data failed to load:  \(error.localizedDescription)")
            }
            
        }
    }
     
}
