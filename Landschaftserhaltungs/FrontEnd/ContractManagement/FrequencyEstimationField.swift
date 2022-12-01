//
//  FrequencyEstimationField.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 06.11.22.
//

import SwiftUI

struct FrequencyEstimationField: View {
    @Environment(\.managedObjectContext) var moc
    @StateObject var listEntry : ListEntry
    @State var checkedW = false
    
    let frequence = ["m", "w", "z" , "s" , "d"]
    @State var selection = ""
    @State private var showingAlert = false
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text("Häufigkeitsschätzung").font(.title2).frame(maxWidth: .infinity, alignment: .top)
            
            Text("w - wenige")
            Text("m - mehrere")
            Text("z - zahlreich")
            Text("s - sehr viele")
            Text("d - dominant")
            
            List()
            {
                
                ForEach(listEntry.PlantArray)
                {
                    item in
                    Button {
                        print(item.germanName)
                        showingAlert = true
                    } label: {
                        HStack{
                            Text(item.germanName ?? " " )
                            Spacer()
                            Text(item.frequency ?? "")
                        }
                    }.alert(item.germanName ?? "NO Value", isPresented: $showingAlert, actions: {
                        Button("wenige") { save(item: item, value: "v") }
                        Button("mehrere") { save(item: item, value: "m")}
                        Button("zahlreich") { save(item: item, value: "z")}
                        Button("sehr viele") { save(item: item, value: "s")}
                        Button("dominat") {  save(item: item, value: "d")}
                    })
                }
                
                
                
            }

        }
        
    }
    
    func save(item : PlantSpeciesItem, value : String)
    {
        print(item.germanName)
        
        item.frequency = value
        print(value)
        do{
            try moc.save()
            
        }
        catch{
            print("Hier \(error)")
        }
    }
    
    
}

