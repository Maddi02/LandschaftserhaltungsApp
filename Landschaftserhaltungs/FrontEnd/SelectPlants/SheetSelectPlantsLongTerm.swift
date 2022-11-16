//
//  SheetSelectPlantsLongTerm.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 09.11.22.
//

import SwiftUI

struct SheetSelectPlantsLongTerm: View {
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
                RowViewLongTerm(listEntry: listEntry, text: name.germanName, checked: name.isChecked)
            }
        }
    }
    
    var devicesListLatein: some View {
        ForEach(plantSpeciesDataModel.getLateinList().sorted(by: { (lhs, rhs) -> Bool in
            lhs.key < rhs.key
        }), id: \.key) { categoryName, devicesArray in
            //HeaderView(title: categoryName)
            ForEach(devicesArray) { name in
                RowViewLongTerm(listEntry: listEntry, text: name.scientificName, checked: name.isChecked)
            }
        }
        
     
    }
    
    
    var devicesListLatein1: some View {
  
            ForEach(plantSpecies) { name1 in
                RowViewLongTerm(listEntry: listEntry, text: name1.germanName, checked: name1.isChecked)
            }
        
    }

    
    
    var body: some View {
        ScrollViewReader { proxy in
            List {
                if(show && selectedStrength == "Deutsch"){
                    devicesListGerman
                }
                else if(show && selectedStrength == "Latein"){
                    devicesListLatein
                }
                else {
                    ForEach($plantSpecies){
                        plantSpecies1 in
                        
                        HStack{
                            if(selectedStrength == "Latein" ){
                                Text(plantSpecies1.scientificName.wrappedValue)
                                Spacer()
                                if(containsInPlantArray(str: plantSpecies1.scientificName.wrappedValue))
                                {
                                    CheckBoxView(checked: plantSpecies1.isChecked).disabled(true)
                                }
                                else {
                                    CheckBoxView(checked: plantSpecies1.isChecked).onChange(of: plantSpecies1.isChecked.wrappedValue)
                                    {
                                        value in
                                        print ("Halllo")
                                    }
                                }
                                
                            }
                            if(selectedStrength == "Deutsch" ){
                                Text(plantSpecies1.germanName.wrappedValue)
                                Spacer()
                                if(containsInPlantArray(str: plantSpecies1.scientificName.wrappedValue))
                                {
                                    CheckBoxView(checked: plantSpecies1.isChecked).disabled(true)
                                }
                                else {
                                    CheckBoxView(checked: plantSpecies1.isChecked)
                                }
                                
                            }
                        }
                    }
                    
                }
            }.listStyle(InsetGroupedListStyle())
                .overlay(sectionIndexTitles(proxy: proxy))
           
            
            .navigationBarTitle("Pflanzenarten")
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .navigationBarBackButtonHidden(true)
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .onChange(of: searchText) { value in
                if searchText.isEmpty && !isSearching {
                    show = true
                    
                    
                }
            }
            
            .onChange(of: searchText) { value in
                if !searchText.isEmpty {
                    show = false
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack{
                        
                        Text("Sprache: ")
                        Section {
                            Picker("", selection: $selectedStrength) {
                                ForEach(strengths, id: \.self) {
                                    Text($0).tag($0.components(separatedBy: " ")[0])
                                }
                            }
                            .pickerStyle(.menu)
                        }.frame(maxWidth: .infinity, alignment: .center)
                        
                    }
                }
            }
            
            .navigationTitle("Schnellaufname").font(.title3)
            .listStyle(PlainListStyle())
            
            
            
            
            .onChange(of: searchText) {
                searchText in
                if !searchText.isEmpty {
                    if(selectedStrength == "Deutsch")
                    {
                        checkInOtherList()
                        let values = plantSpeciesDataModel.b().values.flatMap({$0})
                        plantSpecies = values.filter { $0.germanName.lowercased().contains(searchText.lowercased()) }
                        
                        for i in plantSpecies {
                            print (i.germanName)
                        }
                    }
                    if(selectedStrength == "Latein")
                    {
                        plantSpecies = plantSpeciesDataModel.platList.filter { $0.scientificName.lowercased().contains(searchText.lowercased()) }
                    }
                    
                } else {
                    plantSpecies = plantSpeciesDataModel.platList
                }
            }
            
            
        }
    }
        
        func sectionIndexTitles(proxy: ScrollViewProxy) -> some View {
            SectionIndexTitles(proxy: proxy, titles: plantSpeciesDataModel.b().keys.sorted())
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
        }
        
        
        func checkInOtherList()
        {
            
            let keys = plantSpeciesDataModel.b().values.flatMap({$0})
            
            let a = keys.filter { $0.scientificName.lowercased().contains(searchText.lowercased()) }
            for i in a
            {
                print(i.germanName)
            }
            
        }
    
    private func containsInPlantArray(str : String) -> Bool
    {
        
        
        
        if(selectedStrength == "Latein")
        {
            for i in listEntry.PlantArray
            {
                if(i.scientificName == str)
                {
                    return true
                }
            }
        }
        
        if(selectedStrength == "Deutsch")
        {
            for i in listEntry.PlantArray
            {
                if(i.germanName == str)
                {
                    return true
                }
            }
        }
        
        
        
        return false
    }
    
    
}








