//
//  FrequencyEstimationField.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 06.11.22.
//

import SwiftUI



struct FrequencyEstimationFieldLatein: View {
    @Environment(\.managedObjectContext) var moc
    @StateObject var listEntry : ListEntry
    @StateObject var userSettings = UserSettings()
    @State var checkedW = false
    var typeOfField : String
    let defaults = UserDefaults.standard
    let frequence = ["m", "w", "z" , "s" , "d"]
    @State var selection = ""
    @State private var showingAlert = false
    var types = ["Schnell-Aufnahme", "Genaue Aufnahme"]
       @State private var selectedType = "Schnell-Aufnahme"
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text("Häufigkeitsschätzung").font(.title2).frame(maxWidth: .infinity, alignment: .topLeading).padding()
            
            Text("w - wenige").padding(.leading)
            Text("m - mehrere").padding(.leading)
            Text("z - zahlreich").padding(.leading)
            Text("s - sehr viele").padding(.leading)
            Text("d - dominant").padding(.leading)
            
            
            if (typeOfField == "Anderes Biotop"){
                NavigationView {
                    
                    List(sortLongTerm(listEntry: listEntry)) { todoItem in
                        NavigationLink(destination: SetFrequenceViewLongTerm(listentry: todoItem).onAppear(perform: {
                            selection = "WEEE"
                            
                        }).onDisappear(perform: {
                            selection = "WEEE"
                            checkedW.toggle()
                            update()
                        })) {
                            HStack{
                                Text(todoItem.frequency ?? " ")
                                Text("  ")
                                Text(todoItem.scientificName ?? " ")
                            }
                        }
                    }.alert("HHH", isPresented: $checkedW, actions: {
                        
                    })
                }
            }
            
            
            else {
                
                VStack {
                    Picker("Wähle Liste aus", selection: $selectedType) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    if(selectedType == "Schnell-Aufnahme")
                    {
                        
                        NavigationView {
                            
                            List(sortShortTerm(listEntry: listEntry)) { todoItem in
                                NavigationLink(destination: SetFrequenceViewShortTerm(listentry: todoItem).onAppear(perform: {
                                    print("Hallo Welt")
                                    selection = "WEEE"
                                    
                                }).onDisappear(perform: {
                                    print("Tschäuch Welt")
                                    selection = "WEEE"
                                    checkedW.toggle()
                                    update()
                                })) {
                                    HStack{
                                        Text(todoItem.frequency ?? " ")
                                        Text("  ")
                                        Text(todoItem.scientificName ?? " ")
                                    }
                                }
                            }.alert("", isPresented: $checkedW, actions: {
                                
                            })
                        }
                        }
                    
                    if(selectedType == "Genaue Aufnahme")
                    {
                        NavigationView {
                            
                            List(sortLongTerm(listEntry: listEntry)) { todoItem in
                                NavigationLink(destination: SetFrequenceViewLongTerm(listentry: todoItem).onAppear(perform: {
                                    print("Hallo Welt")
                                    selection = "WEEE"
                                    
                                }).onDisappear(perform: {
                                    print("Tschäuch Welt")
                                    selection = "WEEE"
                                    checkedW.toggle()
                                    update()
                                })) {
                                    HStack{
                                        Text(todoItem.frequency ?? " ")
                                        Text("  ")
                                        Text(todoItem.scientificName ?? " ")
                                    }
                                }
                            }.alert("", isPresented: $checkedW, actions: {
                                
                            })
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
    
    func update()
    {
        print("In upo")
        checkedW.toggle()
      
    }
    
    
    
    
    
    func sortShortTerm(listEntry : ListEntry) -> [PlantSpeciesItem]
    {
        
        return listEntry.PlantArray.sorted( by : {lhs, rhs in
            return lhs.scientificName ?? "a" < rhs.scientificName ?? "b"
          })
    }
    
    func sortLongTerm(listEntry : ListEntry) -> [PlantSpeciesLongTermItem]
    {
        
        return listEntry.PlantArrayLongTerm.sorted( by : {lhs, rhs in
            return lhs.scientificName ?? "a" < rhs.scientificName ?? "b"
          })
    }
    
    
  
    
    
}


