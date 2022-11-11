//
//  LongTimeSpeciesCensus.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 08.11.22.
//

import SwiftUI

struct LongTimeSpeciesCensus: View {
    @State private var selectedStrength = "Deutsch"
    let strengths = ["Deutsch", "Latein"]
    var description : String = "Test"
    @State var fieldDescription : String = ""
    @StateObject var listEntry : ListEntry
    @State private var showSelectionView = false
    @StateObject var plantSpeciesDataModel = PlantSpeciesDataModel()
    var speciesCensusView : SpeciesCensusView
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        
        VStack{
            Text("Genauere Aufname").font(Font.title).frame(maxWidth: .infinity , alignment: .topLeading)
            Text("\(description) ").font(Font.title3).frame(maxWidth: .infinity , alignment: .topLeading)
            HStack{
                
                Text("Planzenname: ")
                
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
            }
            Section(header: Text("Ausgewählte Pflanzen"))
            {
                List{
                    ForEach($plantSpeciesDataModel.platList)
                    {
                        
                        list in
                        
                        if(list.isChecked.wrappedValue)
                        {
                            Text(list.scientificName.wrappedValue)
                        }
                    }
                    
                    
                }
            }
            Section(header: Text("Schon gespeicherte Pflanzen aus Schnellaufnahme"))
            {
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
                SheetSelectPlantsLongTerm(plantSpeciesDataModel: plantSpeciesDataModel)
                
                
            }
            
            
            
           
                
                
                NavigationLink(destination:  getDestination().onAppear{
                    saveEntrysLongTerm()
                })
                {
                    Text("Save & geh zur nächsten Seite")
                }
                
            
        }
    }
        
    
    private func getDestination() -> AnyView
    {
        
        if(listEntry.descriptionField == "FFH Mähwiese")
        {
            return AnyView(InformationFFHWiese())
        }
        else {
            return AnyView(InformationAnderesBiotop())
        }
        
    }
    
    
    
    private func contains(str: String) -> Bool
    {
        for i in listEntry.PlantArrayLongTerm
        {
            if(i.scientificName == str)
            {
                return true
            }
        }
        return false
    }
    
    public func saveEntrysLongTerm()
    {
        
        let plant = PlantSpeciesLongTermItem(context: moc)
        plant.descriptionFieldLongTerm = description
        print("Size \(listEntry.PlantArrayLongTerm.count)")
        
        
        for list in plantSpeciesDataModel.platList
        {
            
            
            if(list.isChecked){
                if(contains(str: list.scientificName))
                {
                    print("Found")
                }
                else{
                    let plant = PlantSpeciesLongTermItem(context: moc)
                  
                    plant.speciesLongTerm = listEntry
                    plant.scientificName =  list.scientificName
                    plant.southernGaelandschaften = list.southernGaelandschaften
                    plant.schaebischeAlb = list.schaebischeAlb
                    plant.responsibility = list.responsibility
                    plant.redListBw = list.redListBw
                    plant.odenWald = list.odenWald
                    plant.oberReihnArea = list.oberReihnArea
                    plant.nothernGaelandschaften = list.nothernGaelandschaften
                    plant.germanName = list.germanName
                    plant.checked = list.isChecked
                    plant.blackForest = list.blackForest
                    plant.alpenvorland = list.alpenvorland
                    print(list.scientificName)
                    
                    do {
                        try moc.save()
                        print("Success")
                    } catch {
                        print("Error saving: \(error)")
                    }
                }
                
                
                if (listEntry.PlantArrayLongTerm.count == 0)
                {
                    let plant = PlantSpeciesLongTermItem(context: moc)
                    plant.speciesLongTerm = listEntry
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
        
        }
        
    }
    
}

