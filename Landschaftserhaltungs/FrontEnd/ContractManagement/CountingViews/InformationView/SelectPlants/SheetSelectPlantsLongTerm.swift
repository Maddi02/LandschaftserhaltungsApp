//
//  SheetSelectPlantsLongTerm.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 09.11.22.
//

import SwiftUI

struct SheetSelectPlantsLongTerm: View {
    @ObservedObject var userSettings = UserSettings()
    @ObservedObject var plantSpeciesDataModel : PlantSpeciesDataModel
    @StateObject var listEntry : ListEntry
    @Environment(\.presentationMode) var presentationMode
    @State private var selection: Set<UUID> = []
    @Environment(\.managedObjectContext) var moc
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
                RowViewLongTerm(plant: name, plantSpeciesDataModel: plantSpeciesDataModel, plantSpecies : plantSpeciesDataModel.platList, checked: name.isChecked, listEntry: listEntry, text: name.germanName)
            }
        }
    }
    
    var devicesListLatein: some View {
        ForEach(plantSpeciesDataModel.lateinList.sorted(by: { (lhs, rhs) -> Bool in
            lhs.key < rhs.key
        }), id: \.key) { categoryName, devicesArray in
            HeaderView(title: categoryName)
            ForEach(devicesArray) { name in
                RowViewLongTerm(plant: name, plantSpeciesDataModel: plantSpeciesDataModel, plantSpecies : plantSpeciesDataModel.platList, checked: name.isChecked, listEntry: listEntry, text: name.scientificName)
            }
        }
        
     
    }

    var body: some View {
        ScrollViewReader { proxy in
            List {
                if(userSettings.getSelectedLanguage() == "Deutsch"){
                    devicesListGerman
                }
                else{
                    devicesListLatein
                }
                
                
            }.listStyle(InsetGroupedListStyle())
                .overlay(sectionIndexTitles(proxy: proxy))
           
            
                .navigationBarTitle("Weitere Arten").padding()
          
        }
        
        NavigationLink(destination:  getDestination().environmentObject(ViewModel()).onAppear{
                        saveEntrysLongTerm()
                    })
                    {
                        Text("Weiter").frame(minWidth: 0, maxWidth: .infinity , minHeight: 30 , maxHeight: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .listRowBackground(Color.blue)
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
            for list in plantSpeciesDataModel.platList
            {
                if(list.isChecked){
                    if(contains(str: list.scientificName))
                    {
                    }
                    else{
                        let plant = PlantSpeciesLongTermItem(context: moc)
                      
                        //SEARCH
                        plant.speciesLongTerm = listEntry
                        plant.scientificName =  list.scientificName
                        plant.redListBw = list.redListBw
                        plant.germanName = list.germanName
                        plant.evaluation1a = list.evaluation1a
                        plant.evaluation1b = list.evaluation1b
                        plant.evaluation1c = list.evaluation1c
                        plant.evaluation1d = list.evaluation1d
                        plant.evaluation2 = list.evaluation2
                        plant.evaluation3 = list.evaluation3
                        plant.checked = list.isChecked
                        plant.noun = list.noun
                        
                        do {
                            try moc.save()
                        } catch {
                            print("Error saving: \(error)")
                        }
                    }
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








