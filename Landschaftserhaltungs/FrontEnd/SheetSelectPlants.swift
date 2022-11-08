//
//  SheetSelectPlants.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 08.11.22.
//

import SwiftUI
import Foundation
struct SheetSelectPlants: View {
    
    @StateObject var plantSpeciesDataModel = PlantSpeciesDataModel()
    var speciesCensusView : SpeciesCensusView
    
    

    @State private var selection: Set<UUID> = []
    var listEntry : ListEntry
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
                    
                    
                }
                
                
                
            }
            Button("Save")
            {
                speciesCensusView.saveEntrys()
            }.padding()
            
            TimerView()
            
        }
        

        
        

        
        
        
        
    }
}




