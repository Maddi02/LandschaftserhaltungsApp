//
//  SpeciesCensusView.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 06.11.22.
//

import SwiftUI
import CoreData
struct SpeciesCensusView: View {
    
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var selectedStrength = "FFH Mähwiese"
    let strengths = ["Deutsch", "Latein"]
    @State private var showSelectionView = false
    private let  width : Double = 250
    var description : String
    @State var fieldDescription : String = ""
    @StateObject var plantSpeciesDataModel = PlantSpeciesDataModel()
    @StateObject var listEntry : ListEntry
    @Environment(\.managedObjectContext) var moc
    
    @State var platList1: [PlantSpecies] = []
    @State var saveTest : [PlantSpecies] = []
    
    
    
    
    
    
    var body: some View {
        
        VStack{
            Text("Schnellaufnahme").font(Font.title).frame(maxWidth: .infinity , alignment: .topLeading)
            Text("\(description) ").font(Font.title3).frame(maxWidth: .infinity , alignment: .topLeading)
            HStack{
                
                Text("Platzennamen: ")
                
                Section {
                    Picker("", selection: $selectedStrength) {
                        ForEach(strengths, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                }.frame(maxWidth: .infinity, alignment: .center)
                
            }
        }
        Form{
            Section(header: Text("Description"))
            {
                TextField("Fügen Sie ein Beschreibung hinzu", text: $fieldDescription)
                
                List{
                    ForEach(listEntry.PlantArray)
                    {
                        list in
                        
                        
                        Text(list.scientificName ?? "BBB")
                        
                        
                        
                        
                    }
                }
            }
            
            
            Button("Wähle Pflanze aus")
            {
                print("Wähle aus")
                showSelectionView.toggle()
                
            }.sheet(isPresented: $showSelectionView)
            {
                SheetSelectPlants(plantSpeciesDataModel: plantSpeciesDataModel, speciesCensusView: self, listEntry: listEntry )
            }
        }
        
        
            NavigationLink(destination: LongTimeSpeciesCensus()){
                
                Text("Genauere Aufnahme")
            }
        
            
            
        
        
        
    }
    
    
    private func contains(str: String) -> Bool
    {
        for i in listEntry.PlantArray
        {
            if(i.scientificName == str)
            {
                return true
            }
        }
        return false
    }
    
    
    public func saveEntrys()
    {

        
        
        print("Size \(listEntry.PlantArray.count)")
        
        
        for list in plantSpeciesDataModel.platList
        {
            
            
            if(list.isChecked){
                if(contains(str: list.scientificName))
                {
                    print("Found")
                }
                else{
                    let plant = PlantSpeciesItem(context: moc)
                    plant.species = listEntry
                    plant.scientificName = list.scientificName
                    print(list.scientificName)
                    
                    do {
                        try moc.save()
                        print("Success")
                    } catch {
                        print("Error saving: \(error)")
                    }
                }
                
                
                if (listEntry.PlantArray.count == 0)
                {
                    let plant = PlantSpeciesItem(context: moc)
                    plant.species = listEntry
                    plant.scientificName = list.scientificName
                    print(list.scientificName)
                    
                    do {
                        try moc.save()
                        print("Success")
                    } catch {
                        print("Error saving: \(error)")
                    }
                }
            }
            
            if(list.isChecked)
            {
               
               
                saveTest.append(list)
                
            }
        }

    }
}

