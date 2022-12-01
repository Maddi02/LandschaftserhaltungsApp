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
    var typeOfField : String
    let frequence = ["m", "w", "z" , "s" , "d"]
    @State var selection = ""
    @State private var showingAlert = false
    var types = ["Schnell-Aufnahme", "Genaue Aufnahme"]
       @State private var selectedType = "Schnell-Aufnahme"
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text("Häufigkeitsschätzung").font(.title2).frame(maxWidth: .infinity, alignment: .top)
            
            Text("w - wenige")
            Text("m - mehrere")
            Text("z - zahlreich")
            Text("s - sehr viele")
            Text("d - dominant")
            
            
            if (typeOfField == "Anderes Biotop"){
                List()
                {
                    
                    ForEach(listEntry.PlantArrayLongTerm)
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
                            Button("wenige") { saveLongTerm(item: item, value: "w") }
                            Button("mehrere") { saveLongTerm(item: item, value: "m") }
                            Button("zahlreich") { saveLongTerm(item: item, value: "z")}
                            Button("sehr viele") { saveLongTerm(item: item, value: "v")}
                            Button("dominat") { saveLongTerm(item: item, value: "d") }
                        })
                    }
                    
                    
                    
                }
            }
            
            
            else {
                
                VStack {
                    Picker("Please choose a color", selection: $selectedType) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    if(selectedType == "Schnell-Aufnahme")
                    {
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
                                    Button("wenige") { saveShortTerm(item: item, value: "w") }
                                    Button("mehrere") { saveShortTerm(item: item, value: "m") }
                                    Button("zahlreich") { saveShortTerm(item: item, value: "z")}
                                    Button("sehr viele") { saveShortTerm(item: item, value: "v")}
                                    Button("dominat") { saveShortTerm(item: item, value: "d") }
                                })
                            }}
                        
                        
                    }
                    
                    if(selectedType == "Genaue Aufnahme")
                    {
                        List()
                        {
                        
                        ForEach(listEntry.PlantArrayLongTerm)
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
                                    Button("wenige") { saveLongTerm(item: item, value: "w") }
                                    Button("mehrere") { saveLongTerm(item: item, value: "m") }
                                    Button("zahlreich") { saveLongTerm(item: item, value: "z")}
                                    Button("sehr viele") { saveLongTerm(item: item, value: "v")}
                                    Button("dominat") { saveLongTerm(item: item, value: "d") }
                                })
                            }
                        }
                        
                    }
                    
                    
                }
            }

        }
        
    }
    
    func saveShortTerm(item : PlantSpeciesItem, value : String)
    {
        item.frequency = value
        print(value)
        do{
            try moc.save()
            
        }
        catch{
            print("Hier \(error)")
        }
    }
    
    
    func saveLongTerm(item : PlantSpeciesLongTermItem, value : String)
    {
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

