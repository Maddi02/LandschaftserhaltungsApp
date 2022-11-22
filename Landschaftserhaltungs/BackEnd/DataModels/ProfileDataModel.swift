//
//  ProfileDataModel.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 21.11.22.
//


import Foundation
import CoreData
public class ProfileDataModel : ObservableObject {
     static var profile: [Profile] = []
    static private var context =  CoreDataManager.shared.persistentContainer.viewContext
    static let request : NSFetchRequest<Profile> = NSFetchRequest(entityName: "Profile")
    
  
    init()
    {
        
    }
    static func getUserData() -> [Profile]
    {
        
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false)
        { _ in
            do {
                self.profile = try self.context.fetch(self.request)
                print("User size \(self.profile.count)")
            }
            catch {
                // Handle Error
                print("EHHHHHHHHHHH")
            }
        }
        return profile
        

    }
    
}



