//
//  SetFrequenceViewLongTerm.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 02.12.22.
//

import SwiftUI

struct SetFrequenceViewLongTerm : View
{
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    var userSettings = UserSettings()
    @StateObject var listentry : PlantSpeciesLongTermItem
    static var state = " frrewfwf"
    var body: some View
    {
        if(userSettings.getLanguage() == "Deutsch")
        {
            Text(listentry.germanName ?? "Hhh").font(.title2)
        }
        else
        {
            Text(listentry.scientificName ?? "Hhh").font(.title2)
        }
        VStack{
            Text("Ausgewählte Häufigkeit").frame(maxWidth: .infinity , alignment: .center)
            Text(listentry.frequency ?? "Hhh").frame(maxWidth: .infinity , alignment: .center)
        }
        
        
        VStack{
            Button("wenige (w)")
            {
                listentry.frequency = "w"
                do{
                    try moc.save()
                }
                catch{
                    print("Hier \(error)")
                }
                dismiss()
                
            } .padding()
                .background(Color.gray)
                .foregroundColor(.black)
                .clipShape(Capsule())
            
            Button("mehrere (m)")
            {
                listentry.frequency = "m"
                do{
                    try moc.save()
                }
                catch{
                    print("Hier \(error)")
                }
                dismiss()
                
            } .padding()
                .background(Color.gray)
                .foregroundColor(.black)
                .clipShape(Capsule())
            
            Button("zahlreich (z)")
            {
                listentry.frequency = "z"
                do{
                    try moc.save()
                }
                catch{
                    print("Hier \(error)")
                }
                dismiss()
                
            } .padding()
                .background(Color.gray)
                .foregroundColor(.black)
                .clipShape(Capsule())
            
            Button("sehr viele (s)")
            {
                listentry.frequency = "s"
                do{
                    try moc.save()
                }
                catch{
                    print("Hier \(error)")
                }
                dismiss()
                
            } .padding()
                .background(Color.gray)
                .foregroundColor(.black)
                .clipShape(Capsule())
            
            Button("dominant (d)")
            {
                listentry.frequency = "d"
                do{
                    try moc.save()
                }
                catch{
                    print("Hier \(error)")
                }
                dismiss()
                
            } .padding()
                .background(Color.gray)
                .foregroundColor(.black)
                .clipShape(Capsule())
            
            Button("Zurück")
            {
               dismiss()
                
            } .padding()
                .background(Color.gray)
                .foregroundColor(.black)
                .clipShape(Capsule())
            
        }
        
        
    }
}
