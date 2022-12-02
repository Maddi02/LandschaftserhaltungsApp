//
//  SetFrequenceViewShortTerm.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 02.12.22.
//

import SwiftUI

struct SetFrequenceViewShortTerm : View
{    @Environment(\.managedObjectContext) var moc

    var userSettings = UserSettings()
    @StateObject var listentry : PlantSpeciesItem
    static var state = " frrewfwf"
    var body: some View
    {
        if(userSettings.getLanguage() == "Deutsch")
        {
            Text(listentry.germanName ?? "Hhh")
        }
        else
        {
            Text(listentry.scientificName ?? "Hhh")
        }
        Text(listentry.frequency ?? "Hhh")
        Button("Test")
        {
            listentry.frequency = "Kuck Kuck"
            do{
                try moc.save()
       
            
               
                
            }
            catch{
                print("Hier \(error)")
            }
            
        }
        
        
    }
}

