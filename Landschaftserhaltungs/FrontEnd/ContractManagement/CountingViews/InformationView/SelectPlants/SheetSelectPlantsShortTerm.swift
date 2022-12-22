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
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc
    @State var listDisabled = true
    @State  var plantSpecies : [PlantSpecies]
    var speciesCensusView : SpeciesCensusView
    var listEntry : ListEntry


    
    
    let alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    
    var devicesListLatein: some View {
        ForEach(plantSpeciesDataModel.lateinList.sorted(by: { (lhs, rhs) -> Bool in
            lhs.key < rhs.key
        }), id: \.key) { categoryName, devicesArray in
            HeaderView(title: categoryName)
            ForEach(devicesArray) { name in
                RowViewShortTerm(plant: name, plantSpeciesDataModel: plantSpeciesDataModel, plantSpecies: plantSpecies, checked: name.isChecked, listEntry: listEntry, text: name.scientificName )
            }
        }
        
        
    }
    
    var devicesListGerman: some View {
        ForEach(plantSpeciesDataModel.germanList.sorted(by: { (lhs, rhs) -> Bool in
            lhs.key < rhs.key
        }), id: \.key) { categoryName, devicesArray in
            HeaderView(title: categoryName)
            ForEach(devicesArray) { name in
                RowViewShortTerm(plant: name, plantSpeciesDataModel: plantSpeciesDataModel, plantSpecies: plantSpecies, checked: name.isChecked, listEntry: listEntry, text: name.germanName  )
            }
        }
    }
    
    
    var body: some View {
        ScrollViewReader { proxy in
            List {
                if( userSettings.getSelectedLanguage() == "Deutsch"){
                    devicesListGerman
                }
                else {
                    devicesListLatein
                }
            }.listStyle(InsetGroupedListStyle())
                .overlay(sectionIndexTitles(proxy: proxy))

                .navigationBarTitle("Schnellaufnahme").padding()
                .navigationBarBackButtonHidden(true)
        }
    
    


    
    
        NavigationLink(destination: SheetSelectPlantsLongTerm(plantSpeciesDataModel: plantSpeciesDataModel , listEntry: listEntry).onAppear{
                speciesCensusView.saveEntrys()
                
            }){
                Text("Weiter").frame(minWidth: 0, maxWidth: .infinity , minHeight: 30 , maxHeight: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .listRowBackground(Color.blue)
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




