//
//  SheetSelectPlantsLongTerm.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 09.11.22.
//

import SwiftUI

struct SheetSelectPlantsLongTerm: View {
    @ObservedObject var userSettings = UserSettings()
    @StateObject var plantSpeciesDataModel = PlantSpeciesDataModel()
    var longTimeSpeciesCencus : LongTimeSpeciesCensus
    @StateObject var listEntry : ListEntry
    @Environment(\.presentationMode) var presentationMode
    @State private var selection: Set<UUID> = []
    @Environment(\.managedObjectContext) var moc
    @State  var plantSpecies : [PlantSpecies]
    @State private var searchText = ""
    @State private var isItemCheck : Bool = false
    @State private var ItemCheckTrue : Bool = true
    let strengths = ["Deutsch", "Latein"]
    @State private var selectedStrength = "Deutsch"
    @State private var show = true
    @Environment(\.isSearching) private var isSearching: Bool
    @Environment(\.dismissSearch) private var dismissSearch

    var devicesListGerman: some View {
        ForEach(plantSpeciesDataModel.germanList.sorted(by: { (lhs, rhs) -> Bool in
            lhs.key < rhs.key
        }), id: \.key) { categoryName, devicesArray in
            HeaderView(title: categoryName)
            ForEach(devicesArray) { name in
                RowViewLongTerm(plant: name, plantSpeciesDataModel: plantSpeciesDataModel, plantSpecies : plantSpecies, checked: name.isChecked, listEntry: listEntry, text: name.germanName)
            }
        }
    }
    
    var devicesListLatein: some View {
        ForEach(plantSpeciesDataModel.lateinList.sorted(by: { (lhs, rhs) -> Bool in
            lhs.key < rhs.key
        }), id: \.key) { categoryName, devicesArray in
            HeaderView(title: categoryName)
            ForEach(devicesArray) { name in
                RowViewLongTerm(plant: name, plantSpeciesDataModel: plantSpeciesDataModel, plantSpecies : plantSpecies, checked: name.isChecked, listEntry: listEntry, text: name.scientificName)
            }
        }
        
     
    }

    var body: some View {
        ScrollViewReader { proxy in
            List {
                if(userSettings.getSelectedLanguage() == "Deutsch"){
                    devicesListGerman
                }
                else if(userSettings.getSelectedLanguage() == "Latein"){
                    devicesListLatein
                }
                
                
            }.listStyle(InsetGroupedListStyle())
                .overlay(sectionIndexTitles(proxy: proxy))
           
            
            .navigationBarTitle("Pflanzenarten")
          
        }
        
        NavigationLink(destination:  getDestination().environmentObject(ViewModel()).onAppear{
                        saveEntrysLongTerm()
                    })
                    {
                        Text("Save & geh zur nächsten Seite")
                    }.navigationBarBackButtonHidden(true)
        
        
    }
        
        func sectionIndexTitles(proxy: ScrollViewProxy) -> some View {
            SectionIndexTitles(proxy: proxy, titles: plantSpeciesDataModel.b().keys.sorted())
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
        }
    
    private func getDestination() -> AnyView
         {

             if(listEntry.descriptionField == "FFH Mähwiese")
             {
                 return AnyView(InformationFFHWiese(listEntry: listEntry))
             }
             else {
                 return AnyView(InformationAnderesBiotop(listEntry: listEntry))
             }

         }
    
    public func saveEntrysLongTerm()
        {
            
            //let plant = PlantSpeciesLongTermItem(context: moc)
           // plant.descriptionFieldLongTerm = description
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
                    
                  /*
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
                   */
                }
            
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
}








