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
                RowViewLongTerm(plantSpeciesDataModel: plantSpeciesDataModel, plantSpecies : plantSpecies, checked: name.isChecked, listEntry: listEntry, text: name.germanName)
            }
        }
    }
    
    var devicesListLatein: some View {
        ForEach(plantSpeciesDataModel.lateinList.sorted(by: { (lhs, rhs) -> Bool in
            lhs.key < rhs.key
        }), id: \.key) { categoryName, devicesArray in
            HeaderView(title: categoryName)
            ForEach(devicesArray) { name in
                RowViewLongTerm(plantSpeciesDataModel: plantSpeciesDataModel, plantSpecies : plantSpecies, checked: name.isChecked, listEntry: listEntry, text: name.scientificName)
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
    }
        
        func sectionIndexTitles(proxy: ScrollViewProxy) -> some View {
            SectionIndexTitles(proxy: proxy, titles: plantSpeciesDataModel.b().keys.sorted())
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
        }
}








