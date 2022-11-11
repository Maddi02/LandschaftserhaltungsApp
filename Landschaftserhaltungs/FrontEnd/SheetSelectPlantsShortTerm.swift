//
//  SheetSelectPlants.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 08.11.22.
//

import SwiftUI
import Foundation
struct SheetSelectPlantsShortTerm: View {
    @StateObject var plantSpeciesDataModel : PlantSpeciesDataModel
    var speciesCensusView : SpeciesCensusView
    var listEntry : ListEntry
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedStrength = "Deutsch"
    let strengths = ["Deutsch", "Latein"]
    @State var listDisabled = true
    @State private var selection: Set<UUID> = []
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        
        VStack{
            HStack{
                List(){
                    
                    ForEach($plantSpeciesDataModel.platList){
                        list in
                        HStack{
                            Text(list.scientificName.wrappedValue)
                            Toggle("", isOn: list.isChecked)
                            
                        }
                        
                        
                    }
                    
                    
                }.disabled(listDisabled).toolbar {
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
                
                
                
            }
            

            NavigationLink(destination: LongTimeSpeciesCensus(listEntry: listEntry, plantSpeciesDataModel: plantSpeciesDataModel, speciesCensusView: speciesCensusView).onAppear{
                speciesCensusView.saveEntrys()
                
            }){
                  
                  Text("Save & Go to Genaue Aufnahme")
            }.padding(.bottom, 30)
           
            TimerView(sheetSelectPlants: self)
            
        }.navigationBarBackButtonHidden(true)
    }
    func selectionActivate()
    {
        listDisabled = false
    }
    
    func selectionDeactivate()
    {
        listDisabled = true
    }
}




