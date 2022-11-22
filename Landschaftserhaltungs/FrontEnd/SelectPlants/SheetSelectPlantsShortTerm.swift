//
//  SheetSelectPlants.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 08.11.22.
//

import SwiftUI
import Foundation
struct SheetSelectPlantsShortTerm: View {
    @ObservedObject var userSettings = UserSettings()
    @ObservedObject var plantSpeciesDataModel : PlantSpeciesDataModel
    var speciesCensusView : SpeciesCensusView
    var listEntry : ListEntry
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedStrength = "Deutsch"
    let strengths = ["Deutsch", "Latein"]
    @State var listDisabled = true
    @State private var selection: Set<UUID> = []
    @Environment(\.managedObjectContext) var moc
    @State private var searchText = ""
    @State  var plantSpecies : [PlantSpecies]
    @State private var showGreeting = true
    @State private var show = true
    @Environment(\.isSearching) private var isSearching: Bool
    @Environment(\.dismissSearch) private var dismissSearch
    
    
    let alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    
    var devicesListLatein: some View {
        ForEach(plantSpeciesDataModel.lateinList.sorted(by: { (lhs, rhs) -> Bool in
            lhs.key < rhs.key
        }), id: \.key) { categoryName, devicesArray in
            HeaderView(title: categoryName)
            ForEach(devicesArray) { name in
                RowViewLongTerm(plantSpeciesDataModel: plantSpeciesDataModel, plantSpecies: plantSpecies, listEntry: listEntry, text: name.germanName, checked: name.isChecked)
            }
        }
        
        
    }
    
    var devicesListGerman: some View {
        ForEach(plantSpeciesDataModel.germanList.sorted(by: { (lhs, rhs) -> Bool in
            lhs.key < rhs.key
        }), id: \.key) { categoryName, devicesArray in
            HeaderView(title: categoryName)
            ForEach(devicesArray) { name in
                RowViewLongTerm(plantSpeciesDataModel: plantSpeciesDataModel, plantSpecies: plantSpecies, listEntry: listEntry, text: name.germanName, checked: name.isChecked )
            }
        }
    }
    
    
    var body: some View {
        ScrollViewReader { proxy in
            List {
                if( userSettings.getSelectedLanguage() == "Deutsch"){
                    devicesListGerman
                }
                else if( userSettings.getSelectedLanguage() == "Latein"){
                    devicesListLatein
                }
                else {
                    ForEach($plantSpecies){
                        plantSpecies1 in
                        
                        HStack{
                            if(selectedStrength == "Latein" ){
                                Text(plantSpecies1.scientificName.wrappedValue)
                                Spacer()
                                
                                CheckBoxView(checked: plantSpecies1.isChecked)
                            }
                            
                        }
                        if(selectedStrength == "Deutsch" ){
                            Text(plantSpecies1.germanName.wrappedValue)
                            Spacer()
                            CheckBoxView(checked: plantSpecies1.isChecked)
                        }
                    }
                }
                
                
            }.listStyle(InsetGroupedListStyle())
                .overlay(sectionIndexTitles(proxy: proxy))
            
            
                .navigationBarTitle("Pflanzenarten")
                .navigationBarBackButtonHidden(true)
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
               
            
                .navigationTitle("Schnellaufname").font(.title3)
                .listStyle(PlainListStyle())
            
            
            
            
                .onChange(of: searchText) {
                    searchText in
                    if !searchText.isEmpty {
                        if(selectedStrength == "Deutsch")
                        {
                            
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
    
    


    
    
            NavigationLink(destination: LongTimeSpeciesCensus(listEntry: listEntry, plantSpeciesDataModel: plantSpeciesDataModel, speciesCensusView: speciesCensusView).onAppear{
                speciesCensusView.saveEntrys()
                
            }){
                
                Text("Save & Go to Genaue Aufnahme")
            }.padding(.bottom, 30)
            
            TimerView(sheetSelectPlants: self).frame(maxWidth: .infinity, maxHeight: 30)
            
        }
    
    func selectionActivate()
    {
        listDisabled = false
    }
    
    func selectionDeactivate()
    {
        listDisabled = true
    }
    
    
func sectionIndexTitles(proxy: ScrollViewProxy) -> some View {
    SectionIndexTitles(proxy: proxy, titles: plantSpeciesDataModel.b().keys.sorted())
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding()
}
    
    
    
    
    

}




