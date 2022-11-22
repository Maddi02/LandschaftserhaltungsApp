//
//  LongTimeSpeciesCensus.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 08.11.22.
//

import SwiftUI

struct LongTimeSpeciesCensus: View {
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var userSettings = UserSettings()
    @StateObject var listEntry : ListEntry
    @StateObject var plantSpeciesDataModel = PlantSpeciesDataModel()
    @State private var selectedStrength = "Deutsch"
    @State var fieldDescription : String = ""
    @State private var showSelectionView = false
    var description : String = ""
    var speciesCensusView : SpeciesCensusView

    
    var body: some View {
        
        VStack{
            Text("Genauere Aufname").font(Font.title).frame(maxWidth: .infinity , alignment: .topLeading)
            Text("\(description) ").font(Font.title3).frame(maxWidth: .infinity , alignment: .topLeading)
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
                            if(userSettings.getSelectedLanguage() == "Latein")
                            {
                                Text(list.scientificName.wrappedValue)
                            }
                            
                            if(userSettings.getSelectedLanguage() == "Deutsch")
                            {
                                Text(list.germanName.wrappedValue)
                            }
        
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
                        
          
                        if(userSettings.getSelectedLanguage() == "Deutsch")
                        {
                            Text(list.germanName ?? "N")
                        }
                        
                        if(userSettings.getSelectedLanguage() == "Latein")
                        {
                            Text(list.scientificName  ?? "N")
                        }
                        
                    }
                    
                }
            }
            
            
            NavigationLink(destination: SheetSelectPlantsLongTerm(plantSpeciesDataModel: plantSpeciesDataModel, longTimeSpeciesCencus: self ,listEntry: listEntry, plantSpecies: plantSpeciesDataModel.platList)){
                
                Text("Wähle Pflanze aus")
            }
        }
        .navigationBarBackButtonHidden(true)
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

